v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Copyright 2024 Ajacci, Ltd. Co.
Apache License, Version 2.0 with Addendum, see NOTICE
Date: 03/14/2024   Rev: 0
Description: Brown-out detector testbench} -480 20 0 0 0.4 0.4 {}
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
N -370 -450 -370 -440 {
lab=avss}
N -400 -440 -370 -440 {
lab=avss}
N -380 -610 -370 -610 {
lab=avdd_bg}
N -380 -660 -380 -610 {
lab=avdd_bg}
N -210 -660 -210 -640 {
lab=avdd_bg}
N 300 -280 630 -280 {
lab=outb}
N 300 -220 470 -220 {
lab=itest}
N 630 -280 630 -110 {
lab=outb}
N -130 -660 -130 -610 {
lab=avdd_bg}
N -380 -660 -130 -660 {
lab=avdd_bg}
N -210 -40 -0 -40 {
lab=ibg_200n}
N -210 -580 -210 -40 {
lab=ibg_200n}
N 470 -220 470 -50 {
lab=itest}
C {devices/vsource.sym} -750 -170 0 0 {name=Vavss value=0 savecurrent=false}
C {devices/gnd.sym} -750 -140 0 0 {name=l1 lab=GND}
C {devices/lab_pin.sym} -750 -200 1 0 {name=p1 sig_type=std_logic lab=avss}
C {devices/gnd.sym} -680 -140 0 0 {name=l2 lab=GND}
C {devices/lab_pin.sym} -680 -200 1 0 {name=p5 sig_type=std_logic lab=avdd}
C {devices/vsource.sym} -680 -320 0 0 {name=Vena value="pwl(0 0 1u dvdd) DC dvdd" savecurrent=false}
C {devices/gnd.sym} -680 -290 0 0 {name=l3 lab=GND}
C {devices/lab_pin.sym} -680 -350 1 0 {name=p6 sig_type=std_logic lab=ena}
C {devices/code.sym} -850 -490 0 0 {name=tb only_toplevel=false value="
.param avdd=3.3
.param dvdd=1.8
*.csparam dvdd2="dvdd/2"
.csparam=0.9
.lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.include /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
.include /usr/local/share/pdk/sky130A/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice

*dig pull up/down to set test bits
R000 ena dvdd 1e6
R001 force_ena_rc_osc dvss 1e6
R002 force_dis_rc_osc dvdd 1e6
R003 force_short_oneshot dvdd 1e6
R004 isrc_sel dvss 1e6

.option reltol=5e-5
.temp 25
.save all
.save @m.xibrout.xiana.xirsmux.xmena.msky130_fd_pr__nfet_g5v0d10v5[id]
.control
*op
tran 10u 6m
*meas tran otrip_r find v(avdd) when v(brout_filt)=$&dvdd2 td=300u rise=1
*meas tran otrip_f find v(avdd) when v(brout_filt)=$&dvdd2 td=300u fall=1
*meas tran vtrip_r find v(avdd) when v(vunder)=$&dvdd2 td=300u rise=1
*meas tran vtrip_f find v(avdd) when v(vunder)=$&dvdd2 td=300u fall=1
meas tran otrip_r find v(avdd) when v(brout_filt)=0.9 td=3m rise=1
meas tran otrip_f find v(avdd) when v(brout_filt)=0.9 td=300u fall=1
meas tran vtrip_r find v(avdd) when v(vunder)=0.9 td=300u rise=1
meas tran vtrip_f find v(avdd) when v(vunder)=0.9 td=3m fall=1

let hyst_br = $&otrip_f - $&otrip_r
let hyst_vu = $&vtrip_r - $&vtrip_f
print $&hyst_br
print $&hyst_vu

*let accu_br = ($&otrip_r + $&otrip_f)/2
*let accu_vu = ($&vtrip_r + $&vtrip_f)/2
*print $&accu_br
*print $&accu_vu

*plot @m.xibrout.xiana.xirsmux.xmena.msky130_fd_pr__nfet_g5v0d10v5[id]
plot 1.4*brout_filt avdd 1.5*vunder vbg_1v2 vin_brout 
plot xibrout.xiana.xiosc.in osc_ck*1.1 xibrout.xiana.xiosc.net1*1.2 xibrout.xiana.xiosc.m*1.3 xibrout.xiana.xiosc.n*1.4 

*plot brout_filt itest avdd ena vbg_1v2 vin_brout vin_vunder timed_out xibrout.xiana.dcomp xibrout.xiana.dcomp_filt
*plot i(Vavdd) i(Vdvdd)
*plot outb avdd vunder*0.75 ena*0.5
*plot xibrout.osc_ena 1.25*out 1.75*brout_filt
*plot 0.5*brout_filt 0.75*xibrout.xiana.dcomp xibrout.xiana.dcomp_filt
*plot avdd 0.25*osc_ck 0.5*ena 0.75*brout_filt timed_out 1.25*outb 1.5*vunder
*plot osc_ck*0.5 xibrout.xiana.xiosc.in xibrout.xiana.xiosc.m xibrout.osc_ena*0.25 brout_filt out*1.25
.endc
"}
C {devices/vsource.sym} -680 -170 0 0 {name=Vavdd value="pwl (0 2 3m 3.6 6m 2) DC 3.3" savecurrent=true}
C {devices/vsource.sym} -820 -170 0 0 {name=Vbg value=1.2 savecurrent=false}
C {devices/gnd.sym} -820 -140 0 0 {name=l7 lab=GND}
C {devices/lab_pin.sym} -820 -200 1 0 {name=p11 sig_type=std_logic lab=vbg_1v2}
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
C {devices/lab_pin.sym} -400 -440 0 0 {name=p16 lab=avss}
C {devices/lab_wire.sym} -280 -610 0 0 {name=p17 sig_type=std_logic lab=vbp}
C {devices/lab_wire.sym} -210 -540 0 0 {name=p18 sig_type=std_logic lab=ibg_200n}
C {devices/vsource.sym} -750 -20 0 0 {name=Vdvss value=0 savecurrent=false}
C {devices/gnd.sym} -750 10 0 0 {name=l4 lab=GND}
C {devices/lab_pin.sym} -750 -50 1 0 {name=p2 sig_type=std_logic lab=dvss}
C {devices/gnd.sym} -680 10 0 0 {name=l5 lab=GND}
C {devices/lab_pin.sym} -680 -50 1 0 {name=p4 sig_type=std_logic lab=dvdd}
C {devices/vsource.sym} -680 -20 0 0 {name=Vdvdd value=dvdd savecurrent=true}
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
C {devices/gnd.sym} -680 290 0 0 {name=l10 lab=GND}
C {devices/vsource.sym} -680 260 0 0 {name=Vvotrip0 value="DC 0" savecurrent=false}
C {devices/lab_pin.sym} -680 230 1 0 {name=p14 sig_type=std_logic lab=otrip[0]}
C {devices/gnd.sym} -760 290 0 0 {name=l6 lab=GND}
C {devices/vsource.sym} -760 260 0 0 {name=Vvotrip1 value="DC 0" savecurrent=false}
C {devices/lab_pin.sym} -760 230 1 0 {name=p19 sig_type=std_logic lab=otrip[1]}
C {devices/gnd.sym} -840 290 0 0 {name=l11 lab=GND}
C {devices/vsource.sym} -840 260 0 0 {name=Vvotrip2 value="DC dvdd" savecurrent=false}
C {devices/lab_pin.sym} -840 230 1 0 {name=p21 sig_type=std_logic lab=otrip[2]}
C {devices/gnd.sym} -940 290 0 0 {name=l12 lab=GND}
C {devices/vsource.sym} -940 260 0 0 {name=Vvvtrip0 value="DC 0" savecurrent=false}
C {devices/lab_pin.sym} -940 230 1 0 {name=p27 sig_type=std_logic lab=vtrip[0]}
C {devices/gnd.sym} -1020 290 0 0 {name=l13 lab=GND}
C {devices/vsource.sym} -1020 260 0 0 {name=Vvvtrip1 value="DC 0" savecurrent=true}
C {devices/lab_pin.sym} -1020 230 1 0 {name=p29 sig_type=std_logic lab=vtrip[1]}
C {devices/gnd.sym} -1100 290 0 0 {name=l14 lab=GND}
C {devices/vsource.sym} -1100 260 0 0 {name=Vvvtrip2 value="DC dvdd" savecurrent=false}
C {devices/lab_pin.sym} -1100 230 1 0 {name=p31 sig_type=std_logic lab=vtrip[2]}
C {devices/gnd.sym} -130 -550 0 0 {name=l15 lab=GND}
C {devices/vsource.sym} -130 -580 0 0 {name=Vavdd_bg value="DC 3.3" savecurrent=false}
C {devices/lab_wire.sym} -280 -660 0 0 {name=p3 sig_type=std_logic lab=avdd_bg}
C {devices/lab_pin.sym} 0 -100 0 0 {name=p25 lab=force_dis_rc_osc}
C {devices/lab_pin.sym} 300 -240 0 1 {name=p36 lab=dcomp}
