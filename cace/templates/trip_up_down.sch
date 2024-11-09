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
Description: Brown-out detector CACE testbench} -1200 -50 0 0 0.4 0.4 {}
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
N 240 -410 240 -390 {
lab=GND}
N 210 -410 240 -410 {
lab=GND}
N 210 -570 240 -570 {
lab=GND}
N 210 -490 240 -490 {
lab=GND}
N 670 -410 670 -390 {
lab=GND}
N 640 -410 670 -410 {
lab=GND}
N 640 -650 640 -410 {
lab=GND}
N 640 -650 670 -650 {
lab=GND}
N 640 -570 670 -570 {
lab=GND}
N 640 -490 670 -490 {
lab=GND}
N 0 -410 0 -390 {
lab=GND}
N -30 -410 0 -410 {
lab=GND}
N -30 -570 0 -570 {
lab=GND}
N -30 -490 0 -490 {
lab=GND}
N 450 -410 450 -390 {
lab=GND}
N 420 -410 450 -410 {
lab=GND}
N 420 -570 450 -570 {
lab=GND}
N 420 -490 450 -490 {
lab=GND}
N -30 -650 -0 -650 {
lab=GND}
N -30 -810 0 -810 {
lab=GND}
N -140 -660 -140 -640 {
lab=avdd_bg}
N -380 -660 -140 -660 {
lab=avdd_bg}
N -210 -580 -210 -40 {
lab=ibg_200n}
N -30 -810 -30 -410 {
lab=GND}
N -30 -730 0 -730 {
lab=GND}
N 470 -220 470 -50 {
lab=itest}
N 210 -570 210 -490 {
lab=GND}
N 210 -490 210 -410 {
lab=GND}
N 420 -570 420 -490 {
lab=GND}
N 420 -490 420 -410 {
lab=GND}
C {devices/isource.sym} -370 -480 0 0 {name=Ibias value=200n}
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -230 -610 0 0 {name=M1
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
C {sky130_fd_pr/pfet_g5v0d10v5.sym} -350 -610 0 1 {name=M0
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
C {sky130_ajc_ip__brownout.sym} 150 -160 0 0 {name=xIbrout}
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
C {devices/vsource.sym} 670 -600 0 0 {name=Vavss value="DC CACE\{Vavss\}" savecurrent=false}
C {devices/lab_pin.sym} 670 -630 2 0 {name=p25 sig_type=std_logic lab=avss}
C {devices/lab_pin.sym} 670 -710 2 0 {name=p36 sig_type=std_logic lab=avdd}
C {devices/vsource.sym} 0 -440 0 0 {name=Vena value="DC CACE[CACE\{ena\}*CACE\{Vdvdd\}]" savecurrent=false}
C {devices/gnd.sym} 0 -390 0 0 {name=l15 lab=GND}
C {devices/lab_pin.sym} 0 -470 2 0 {name=p38 sig_type=std_logic lab=ena}
C {devices/vsource.sym} 670 -680 0 0 {name=Vavdd value="pwl (0 2 3m 3.6 6m 2) DC CACE\{Vavdd\}" savecurrent=true}
C {devices/vsource.sym} 0 -520 0 0 {name=Vbg1v2 value="DC 1.2" savecurrent=false}
C {devices/lab_pin.sym} 0 -550 2 0 {name=p39 sig_type=std_logic lab=vbg_1v2}
C {devices/vsource.sym} 670 -440 0 0 {name=Vdvss value="DC CACE\{Vdvss\}" savecurrent=false}
C {devices/gnd.sym} 670 -390 0 0 {name=l16 lab=GND}
C {devices/lab_pin.sym} 670 -470 2 0 {name=p40 sig_type=std_logic lab=dvss}
C {devices/lab_pin.sym} 670 -550 2 0 {name=p41 sig_type=std_logic lab=dvdd}
C {devices/vsource.sym} 670 -520 0 0 {name=Vdvdd value="DC CACE\{Vdvdd\}" savecurrent=true}
C {devices/gnd.sym} 240 -390 0 0 {name=l17 lab=GND}
C {devices/vsource.sym} 240 -440 0 0 {name=Vvotrip0 value="DC CACE[CACE\{otrip[0]\}*CACE\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 240 -470 2 0 {name=p42 sig_type=std_logic lab=otrip[0]}
C {devices/vsource.sym} 240 -520 0 0 {name=Vvotrip1 value="DC CACE[CACE\{otrip[1]\}*CACE\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 240 -550 2 0 {name=p43 sig_type=std_logic lab=otrip[1]}
C {devices/vsource.sym} 240 -600 0 0 {name=Vvotrip2 value="DC CACE[CACE\{otrip[2]\}*CACE\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 240 -630 2 0 {name=p44 sig_type=std_logic lab=otrip[2]}
C {devices/vsource.sym} 0 -600 0 0 {name=Visrc_sel value="DC CACE[CACE\{isrc_sel\}*CACE\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -630 2 0 {name=p46 sig_type=std_logic lab=isrc_sel}
C {devices/gnd.sym} 450 -390 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} 450 -440 0 0 {name=Vvvtrip0 value="DC CACE[CACE\{vtrip[0]\}*CACE\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 450 -470 2 0 {name=p1 sig_type=std_logic lab=vtrip[0]}
C {devices/vsource.sym} 450 -520 0 0 {name=Vvvtrip1 value="DC CACE[CACE\{vtrip[1]\}*CACE\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 450 -550 2 0 {name=p2 sig_type=std_logic lab=vtrip[1]}
C {devices/vsource.sym} 450 -600 0 0 {name=Vvvtrip2 value="DC CACE[CACE\{vtrip[2]\}*CACE\{Vdvdd\}]" savecurrent=true}
C {devices/lab_pin.sym} 450 -630 2 0 {name=p4 sig_type=std_logic lab=vtrip[2]}
C {devices/code_shown.sym} -1200 -710 0 0 {name=SETUP only_toplevel=false value="* CACE gensim simulation file CACE\{filename\}_CACE\{N\}
* Generated by CACE gensim, Efabless Corporation (c) 2023
* Find trip voltage by ramping Vavdd, both up and down.

.lib CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.tech/combined/sky130.lib.spice CACE\{corner\}
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
.include CACE\{PDK_ROOT\}/CACE\{PDK\}/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
*.include CACE\{DUT_path\}

.option TEMP=CACE\{temperature\}
* Flag unsafe operating conditions (exceeds models' specified limits)
.option warn=1
*.option reltol=5e-5
.option reltol=1e-3
.option abstol=1e-3

.save all
"}
C {devices/code_shown.sym} -1210 -330 0 0 {name=CONTROL only_toplevel=false value=".csparam dvdd2=CACE[CACE\{Vdvdd\}/2]
.control
tran 1u 6m
meas tran otrip_r find v(avdd) when v(dcomp)=$&dvdd2 td=3m rise=1
meas tran otrip_f find v(avdd) when v(dcomp)=$&dvdd2 td=300u fall=1
meas tran vtrip_r find v(avdd) when v(vunder)=$&dvdd2 td=300u rise=1
meas tran vtrip_f find v(avdd) when v(vunder)=$&dvdd2 td=3m fall=1
echo $&otrip_r > CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
echo $&otrip_f >> CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
echo $&vtrip_r >> CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
echo $&vtrip_f >> CACE\{simpath\}/CACE\{filename\}_CACE\{N\}.data
quit
.endc
"}
C {devices/vsource.sym} 0 -680 0 0 {name=Vforce_dis_rc_osc value="DC CACE[CACE\{force_dis_rc_osc\}*CACE\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -710 2 0 {name=p6 sig_type=std_logic lab=force_dis_rc_osc}
C {devices/vsource.sym} 0 -840 0 0 {name=Vforce_short_oneshot value="DC CACE[CACE\{force_short_oneshot\}*CACE\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -870 2 0 {name=p11 sig_type=std_logic lab=force_short_oneshot}
C {devices/vsource.sym} -140 -610 0 0 {name=Vavdd_bg value="DC 3.3" savecurrent=false}
C {devices/lab_wire.sym} -290 -660 0 0 {name=p3 sig_type=std_logic lab=avdd_bg}
C {devices/gnd.sym} -140 -580 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -370 -450 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} 0 -100 0 0 {name=p14 lab=force_dis_rc_osc}
C {devices/vsource.sym} 0 -760 0 0 {name=Vforce_ena_rc_osc value="DC CACE[CACE\{force_ena_rc_osc\}*CACE\{Vdvdd\}]" savecurrent=false}
C {devices/lab_pin.sym} 0 -790 2 0 {name=p16 sig_type=std_logic lab=force_ena_rc_osc}
C {devices/lab_pin.sym} 300 -240 0 1 {name=p19 lab=dcomp}
