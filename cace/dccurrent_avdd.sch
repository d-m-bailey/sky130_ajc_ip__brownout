v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Copyright 2024 Ajacci, Ltd. Co.
Apache License, Version 2.0 with Addendum, see NOTICE
Date: 03/20/2024   Rev: 0
Description: Brown-out detector DC current CACE testbench} -1200 -70 0 0 0.4 0.4 {}
N -210 -610 -200 -610 {
lab=avdd_bg}
N -200 -660 -200 -610 {
lab=avdd_bg}
N -370 -660 -370 -640 {
lab=avdd_bg}
N -330 -610 -250 -610 {
lab=vbp}
N -320 -610 -320 -560 {
lab=vbp}
N -370 -560 -320 -560 {
lab=vbp}
N -370 -580 -370 -510 {
lab=vbp}
N -380 -610 -370 -610 {
lab=avdd_bg}
N -380 -660 -380 -610 {
lab=avdd_bg}
N -210 -660 -210 -640 {
lab=avdd_bg}
N -210 -40 0 -40 {
lab=ibg_200n}
N 300 -280 630 -280 {
lab=outb}
N 300 -220 470 -220 {
lab=itest}
N 630 -280 630 -110 {
lab=outb}
N 190 -410 190 -390 {
lab=GND}
N 160 -410 190 -410 {
lab=GND}
N 160 -650 190 -650 {
lab=GND}
N 160 -650 160 -410 {
lab=GND}
N 160 -570 190 -570 {
lab=GND}
N 160 -490 190 -490 {
lab=GND}
N 620 -410 620 -390 {
lab=GND}
N 590 -410 620 -410 {
lab=GND}
N 590 -650 590 -410 {
lab=GND}
N 590 -650 620 -650 {
lab=GND}
N 590 -570 620 -570 {
lab=GND}
N 590 -490 620 -490 {
lab=GND}
N 0 -410 0 -390 {
lab=GND}
N -30 -410 0 -410 {
lab=GND}
N -30 -570 0 -570 {
lab=GND}
N -30 -490 0 -490 {
lab=GND}
N 400 -410 400 -390 {
lab=GND}
N 370 -410 400 -410 {
lab=GND}
N 370 -650 400 -650 {
lab=GND}
N 370 -650 370 -410 {
lab=GND}
N 370 -570 400 -570 {
lab=GND}
N 370 -490 400 -490 {
lab=GND}
N -30 -650 -0 -650 {
lab=GND}
N -30 -730 -0 -730 {
lab=GND}
N -140 -660 -140 -640 {
lab=avdd_bg}
N -380 -660 -140 -660 {
lab=avdd_bg}
N -210 -580 -210 -40 {
lab=ibg_200n}
N 470 -220 470 -50 {
lab=itest}
N -30 -810 0 -810 {
lab=GND}
N -30 -810 -30 -410 {
lab=GND}
C {devices/isource.sym} -370 -480 0 0 {name=Ibias value=200n}
C {xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} -230 -610 0 0 {name=M1
W=1
L=4
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {xschem/sky130_fd_pr/pfet_g5v0d10v5.sym} -350 -610 0 1 {name=M0
W=1
L=4
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_g5v0d10v5
spiceprefix=X
}
C {devices/lab_wire.sym} -280 -610 0 0 {name=p17 sig_type=std_logic lab=vbp}
C {devices/lab_wire.sym} -210 -540 0 0 {name=p18 sig_type=std_logic lab=ibg_200n}
C {devices/res.sym} 470 -20 0 0 {name=R1
value=1e6
footprint=1206
device=resistor
m=1}
C {devices/gnd.sym} 470 10 0 0 {name=l9 lab=GND}
C {devices/lab_wire.sym} 460 -220 0 0 {name=p7 sig_type=std_logic lab=itest}
C {devices/gnd.sym} 630 -50 0 0 {name=l8 lab=GND}
C {devices/capa.sym} 630 -80 0 0 {name=C1
m=1
value=20p
footprint=1206
device="ceramic capacitor"}
C {devices/lab_wire.sym} 610 -280 0 0 {name=p12 sig_type=std_logic lab=outb}
C {xschem/sky130_ajc_ip__brownout.sym} 150 -160 0 0 {name=xIbrout}
C {devices/lab_pin.sym} 0 -280 0 0 {name=p9 lab=avdd}
C {devices/lab_pin.sym} 0 -260 0 0 {name=p15 lab=avss}
C {devices/lab_pin.sym} 0 -240 0 0 {name=p20 lab=dvdd}
C {devices/lab_pin.sym} 0 -220 0 0 {name=p22 lab=dvss}
C {devices/lab_pin.sym} 300 -260 0 1 {name=p23 lab=osc_ck}
C {devices/lab_pin.sym} 0 -200 0 0 {name=p24 lab=vbg_1v2}
C {devices/lab_pin.sym} 0 -180 0 0 {name=p26 lab=otrip[2:0]}
C {devices/lab_pin.sym} 300 -200 0 1 {name=p28 lab=brout_filt}
C {devices/lab_pin.sym} 0 -140 0 0 {name=p30 lab=ena}
C {devices/lab_pin.sym} 300 -180 0 1 {name=p32 lab=vin_brout}
C {devices/lab_pin.sym} 0 -120 0 0 {name=p33 lab=force_ena_rc_osc}
C {devices/lab_pin.sym} 0 -80 0 0 {name=p34 lab=force_short_oneshot}
C {devices/lab_pin.sym} 300 -140 0 1 {name=p35 lab=timed_out}
C {devices/lab_pin.sym} 0 -60 0 0 {name=p37 lab=isrc_sel}
C {devices/lab_pin.sym} 0 -160 0 0 {name=p8 lab=vtrip[2:0]}
C {devices/lab_pin.sym} 300 -160 0 1 {name=p10 lab=vin_vunder}
C {devices/lab_pin.sym} 300 -120 0 1 {name=p13 lab=vunder}
C {devices/vsource.sym} 620 -600 0 0 {name=Vavss value="DC \{Vavss\}" savecurrent=false}
C {devices/lab_pin.sym} 620 -630 2 0 {name=p25 sig_type=std_logic lab=avss}
C {devices/lab_pin.sym} 620 -710 2 0 {name=p36 sig_type=std_logic lab=avdd}
C {devices/vsource.sym} 0 -440 0 0 {name=Vena value="DC [\{ena\}*\{Vdvdd\}]" savecurrent=false}
C {devices/gnd.sym} 0 -390 0 0 {name=l15 lab=GND}
C {devices/lab_pin.sym} 0 -470 2 0 {name=p38 sig_type=std_logic lab=ena}
C {devices/vsource.sym} 620 -680 0 0 {name=Vavdd value="DC \{Vavdd\}" savecurrent=true}
C {devices/vsource.sym} 0 -520 0 0 {name=Vbg1v2 value="DC 1.2" savecurrent=false}
C {devices/lab_pin.sym} 0 -550 2 0 {name=p39 sig_type=std_logic lab=vbg_1v2}
C {devices/vsource.sym} 620 -440 0 0 {name=Vdvss value="DC \{Vdvss\}" savecurrent=false}
C {devices/gnd.sym} 620 -390 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} 620 -470 2 0 {name=p40 sig_type=std_logic lab=dvss}
C {devices/lab_pin.sym} 620 -550 2 0 {name=p41 sig_type=std_logic lab=dvdd}
C {devices/vsource.sym} 620 -520 0 0 {name=Vdvdd value="DC \{Vdvdd\}" savecurrent=true}
C {devices/gnd.sym} 190 -390 0 0 {name=l17 lab=GND}
C {devices/vsource.sym} 190 -440 0 0 {name=Vvotrip0 value="DC [\{otrip[0]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 190 -470 2 0 {name=p42 sig_type=std_logic lab=otrip[0]}
C {devices/vsource.sym} 190 -520 0 0 {name=Vvotrip1 value="DC [\{otrip[1]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 190 -550 2 0 {name=p43 sig_type=std_logic lab=otrip[1]}
C {devices/vsource.sym} 190 -600 0 0 {name=Vvotrip2 value="DC [\{otrip[2]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 190 -630 2 0 {name=p44 sig_type=std_logic lab=otrip[2]}
C {devices/vsource.sym} 190 -680 0 0 {name=Vvotrip3 value="DC [\{otrip[3]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 190 -710 2 0 {name=p45 sig_type=std_logic lab=otrip[3]}
C {devices/vsource.sym} 0 -600 0 0 {name=Visrc_sel value="DC [\{isrc_sel\}*\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -630 2 0 {name=p46 sig_type=std_logic lab=isrc_sel}
C {devices/gnd.sym} 400 -390 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 400 -440 0 0 {name=Vvvtrip0 value="DC [\{vtrip[0]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 400 -470 2 0 {name=p1 sig_type=std_logic lab=vtrip[0]}
C {devices/vsource.sym} 400 -520 0 0 {name=Vvvtrip1 value="DC [\{vtrip[1]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 400 -550 2 0 {name=p2 sig_type=std_logic lab=vtrip[1]}
C {devices/vsource.sym} 400 -600 0 0 {name=Vvvtrip2 value="DC [\{vtrip[2]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 400 -630 2 0 {name=p4 sig_type=std_logic lab=vtrip[2]}
C {devices/vsource.sym} 400 -680 0 0 {name=Vvvtrip3 value="DC [\{vtrip[3]\}*\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 400 -710 2 0 {name=p5 sig_type=std_logic lab=vtrip[3]}
C {devices/code_shown.sym} -1200 -710 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file \{filename\}_\{N\}
* Generated by CACE gensim, Efabless Corporation (c) 2023
* Find trip voltage by ramping Vavdd, both up and down.

.lib \{PDK_ROOT\}/\{PDK\}/libs.tech/combined/sky130.lib.spice \{corner\}
.include \{PDK_ROOT\}/\{PDK\}/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
.include \{PDK_ROOT\}/\{PDK\}/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
*.include \{DUT_path\}

.option TEMP=\{temperature\}
* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
*.option reltol=5e-5
.option reltol=1e-3
.option abstol=1e-3

.save all
"}
C {devices/code_shown.sym} -1210 -330 0 0 {name=CONTROL only_toplevel=false value=".control
op
set wr_singlescale
wrdata \{simpath\}/\{filename\}_\{N\}.data -I(Vavdd)
quit
.endc
"}
C {devices/vsource.sym} -140 -610 0 0 {name=Vavdd_bg value="DC 3.3" savecurrent=false}
C {devices/lab_wire.sym} -290 -660 0 0 {name=p3 sig_type=std_logic lab=avdd_bg}
C {devices/gnd.sym} -140 -580 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -370 -450 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 0 -100 0 0 {name=p14 lab=force_dis_rc_osc}
C {devices/lab_pin.sym} 300 -240 0 1 {name=p16 lab=dcomp}
C {devices/vsource.sym} 0 -680 0 0 {name=Vforce_dis_rc_osc value="DC [\{force_dis_rc_osc\}*\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -710 2 0 {name=p11 sig_type=std_logic lab=force_dis_rc_osc}
C {devices/vsource.sym} 0 -840 0 0 {name=Vforce_short_oneshot value="DC [\{force_short_oneshot\}*\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -870 2 0 {name=p6 sig_type=std_logic lab=force_short_oneshot}
C {devices/vsource.sym} 0 -760 0 0 {name=Vforce_ena_rc_osc value="DC [\{force_ena_rc_osc\}*\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -790 2 0 {name=p19 sig_type=std_logic lab=force_ena_rc_osc}
