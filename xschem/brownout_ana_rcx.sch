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
Description: Brown-out detector (analog section)} -230 410 0 0 0.4 0.4 {}
C {devices/ipin.sym} -180 -220 0 0 {name=p12 lab=vbg_1v2}
C {devices/ipin.sym} -180 -200 0 0 {name=p22 lab=avdd}
C {devices/ipin.sym} -180 -180 0 0 {name=p23 lab=avss}
C {devices/ipin.sym} -180 -160 0 0 {name=p24 lab=dvdd}
C {devices/ipin.sym} -180 -140 0 0 {name=p25 lab=dvss}
C {devices/ipin.sym} -850 -210 0 0 {name=p26 lab=ena}
C {devices/ipin.sym} -850 -150 0 0 {name=p3 lab=isrc_sel}
C {devices/ipin.sym} 290 -180 0 0 {name=p19 lab=ibg_200n}
C {devices/opin.sym} 1080 -60 0 0 {name=p30 lab=dcomp}
C {devices/opin.sym} 590 -180 0 0 {name=p18 lab=itest}
C {devices/ipin.sym} 290 180 0 0 {name=p34 lab=osc_ena}
C {devices/opin.sym} 590 160 0 0 {name=p35 lab=osc_ck}
C {devices/ipin.sym} -850 -270 2 1 {name=p36 lab=otrip_decoded[7:0]}
C {devices/opin.sym} 590 -270 0 0 {name=p41 lab=vin_brout}
C {devices/ipin.sym} -920 420 0 0 {name=p42 lab=outb_unbuf}
C {devices/opin.sym} -380 420 0 0 {name=p44 lab=outb}
C {devices/opin.sym} 1200 260 0 0 {name=p45 lab=vunder}
C {devices/ipin.sym} -850 -90 2 1 {name=p46 lab=vtrip_decoded[7:0]}
C {devices/opin.sym} 590 -250 0 0 {name=p43 lab=vin_vunder}
C {devices/opin.sym} 1980 40 0 0 {name=p40 lab=brout_filt}
C {devices/code.sym} 330 -30 0 0 {name=brownout_ana only_toplevel=false value="

.include mag/rcx/brownout_ana_rcx.spice

xIana vin_brout otrip_decoded[7] otrip_decoded[6] otrip_decoded[5] otrip_decoded[4] otrip_decoded[3] otrip_decoded[2]
+ otrip_decoded[1] otrip_decoded[0] vin_vunder vbg_1v2 ena avdd ibg_200n itest avss dvdd isrc_sel dvss vtrip_decoded[7] vtrip_decoded[6]
+ vtrip_decoded[5] vtrip_decoded[4] vtrip_decoded[3] vtrip_decoded[2] vtrip_decoded[1] vtrip_decoded[0] dcomp brout_filt osc_ck osc_ena vunder outb
+ outb_unbuf brownout_ana

"}
