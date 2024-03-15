module brownout_ana(
//INPUTS
input real avdd,
input logic avss,
input logic dvdd,
input logic dvss,
input logic [7:0] otrip_decoded,
input logic [7:0] vtrip_decoded,
input real vbg_1v2,
input logic ena,
input logic isrc_sel,
input real ibg_200n,
input logic osc_ena,
input logic out_unbuf,
//OUTPTUS
output brout_filt,
output out,
output vunder,
output osc_ck,
output real vin_brout,
output real vin_vunder,
output real itest
);

//BUFFERS
assign vunder = ~vunder_unbuf;
assign out = out_unbuf;

rstring_mux rstring_mux(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(ena),
.otrip_decoded(otrip_decoded), //lvls not modeled
.vtrip_decoded(vtrip_decoded), //lvls not modeled
.vin_brout(vin_brout),
.vin_vunder(vin_vunder)
);

real ibias;

ibias_gen ibias_gen(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.ena(ena),
.isrc_sel(isrc_sel),
.ibg_200n(ibg_200n),
.ibias(ibias),
.itest(itest)
);

comparator comparator_brout(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vinp(vbg_1v2),
.vinn(vin_brout),
.ena(ena),
.ibias(ibias),
.dout(brout_filt)
);

comparator comparator_vunder(
.avdd(avdd),
.avss(avss),
.dvdd(dvdd),
.dvss(dvss),
.vinp(vbg_1v2),
.vinn(vin_vunder),
.ena(ena),
.ibias(ibias),
.dout(vunder_unbuf)
);

rc_osc rc_osc(
.dvdd(dvdd),
.dvss(dvss),
.osc_ena(osc_ena),
.osc_ck(osc_ck)
);

endmodule
