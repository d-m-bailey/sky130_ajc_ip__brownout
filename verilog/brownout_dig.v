module brownout_dig(
//INPUTS
input logic [2:0] otrip,
input logic [2:0] vtrip,
input logic ena,
input logic force_rc_osc,
input logic force_short_oneshot,
input logic brout_filt,
input logic osc_ck,
//OUTPUTS
output osc_ena,
output out_unbuf,
output logic [7:0] otrip_decoded,
output logic [7:0] vtrip_decoded,
//DEBUG OUTPUTS
output logic osc_ck_256,
output timed_out
);

  //assign vunder = vunder_unbuf;

  //TRIP-VOLTAGE 3-to-8 DECODERS
  always @ (otrip) begin
    case(otrip)
      3'b111: otrip_decoded = 8'b10000000;
      3'b110: otrip_decoded = 8'b01000000;
      3'b101: otrip_decoded = 8'b00100000;
      3'b100: otrip_decoded = 8'b00010000;
      3'b011: otrip_decoded = 8'b00001000;
      3'b010: otrip_decoded = 8'b00000100;
      3'b001: otrip_decoded = 8'b00000010;
      3'b000: otrip_decoded = 8'b00000001;
    endcase
  end

  always @ (vtrip) begin
    case(vtrip)
      3'b111: vtrip_decoded = 8'b10000000;
      3'b110: vtrip_decoded = 8'b01000000;
      3'b101: vtrip_decoded = 8'b00100000;
      3'b100: vtrip_decoded = 8'b00010000;
      3'b011: vtrip_decoded = 8'b00001000;
      3'b010: vtrip_decoded = 8'b00000100;
      3'b001: vtrip_decoded = 8'b00000010;
      3'b000: vtrip_decoded = 8'b00000001;
    endcase
  end

  assign osc_ena = force_rc_osc | (ena & (brout_filt | !out_unbuf));
  wire brout_filt_ena_rsb;

  //BROUT_FILT RETIMER
  reg brout_filt_retime_rsb_stg1, brout_filt_retime_rsb;
  assign brout_filt_ena_rsb = ena & brout_filt;

  always @ (posedge osc_ck or negedge brout_filt_ena_rsb) begin
    if (!brout_filt_ena_rsb) begin
      brout_filt_retime_rsb_stg1 <= 0;
      brout_filt_retime_rsb <= 0;
    end else begin
      brout_filt_retime_rsb_stg1 <= 1;
      brout_filt_retime_rsb <= brout_filt_retime_rsb_stg1;
    end
  end

  reg brout_filt_retimed_stg1, brout_filt_retimed;
  always @ (posedge osc_ck or negedge brout_filt_retime_rsb) begin
    if (!brout_filt_retime_rsb) begin
      brout_filt_retimed_stg1 <= 0;
      brout_filt_retimed <= 0;
    end else begin
      brout_filt_retimed_stg1 <= brout_filt;
      brout_filt_retimed <= brout_filt_retimed_stg1;
    end
  end

  //COUNTER RESET
  reg cnt_rsb_stg1, cnt_rsb_stg2, cnt_rsb;

  always @ (posedge osc_ck or negedge ena) begin
    if (!ena) begin
      cnt_rsb_stg1 <= 0;
      cnt_rsb_stg2 <= 0;
      cnt_rsb <= 0;
    end else begin
      cnt_rsb_stg1 <= 1;
      cnt_rsb_stg2 <= cnt_rsb_stg1;
      cnt_rsb <= cnt_rsb_stg2;
    end
  end

  //16-BIT BROWN-OUT ONE-SHOT
  reg [15:0] cnt;

  assign timed_out = (cnt == 16'b1111111111111111);
  assign out_unbuf = brout_filt_retimed ? 0 : timed_out;

  always @ (posedge osc_ck or negedge cnt_rsb) begin
    if (!cnt_rsb) begin
      cnt <= 16'b1111111111111111;
    end else begin
      cnt <= brout_filt_retimed ? 0 : timed_out ? cnt : force_short_oneshot ? (cnt & 16'b1111000000000000) + 13'b1111111111111 : cnt + 1;
    end
  end

  //OUTPUT
  //DEBUG osc_ck/256
  reg [6:0] cnt_ck_256;

  always @ (posedge osc_ck or negedge brout_filt_retime_rsb) begin
    if (!brout_filt_retime_rsb) begin
      cnt_ck_256 <= 0;
      osc_ck_256 <= 0;
    end else begin
      cnt_ck_256 <= cnt_ck_256 + 1;
      osc_ck_256 <= (cnt_ck_256 == 7'b1111111) ? !osc_ck_256 : osc_ck_256;
    end
  end

endmodule
