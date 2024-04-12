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
Description: Brownout detector (analog & digital sections)} -570 180 0 0 0.4 0.4 {}
C {xschem/brownout_ana.sym} 0 10 0 0 {name=xIana}
C {devices/ipin.sym} -430 -420 2 1 {name=p1 lab=avdd}
C {devices/ipin.sym} -430 -400 2 1 {name=p2 lab=avss}
C {devices/ipin.sym} -430 -380 2 1 {name=p3 lab=dvdd}
C {devices/ipin.sym} -430 -360 2 1 {name=p4 lab=dvss}
C {devices/ipin.sym} -430 -340 2 1 {name=p5 lab=vbg_1v2}
C {devices/ipin.sym} -430 -320 2 1 {name=p6 lab=otrip[2:0]}
C {devices/ipin.sym} -430 -280 2 1 {name=p7 lab=ena}
C {devices/ipin.sym} -430 -240 2 1 {name=p8 lab=force_dis_rc_osc}
C {devices/ipin.sym} -430 -220 2 1 {name=p9 lab=force_short_oneshot}
C {devices/ipin.sym} -430 -200 2 1 {name=p10 lab=isrc_sel}
C {devices/ipin.sym} -430 -180 2 1 {name=p11 lab=ibg_200n}
C {devices/lab_pin.sym} -150 -100 0 0 {name=p12 lab=otrip_decoded_7_,otrip_decoded_6_,otrip_decoded_5_,otrip_decoded_4_,otrip_decoded_3_,otrip_decoded_2_,otrip_decoded_1_,otrip_decoded_0_}
C {devices/lab_pin.sym} 150 -100 0 1 {name=p13 lab=vin_brout}
C {devices/lab_pin.sym} -150 -80 0 0 {name=p14 lab=vbg_1v2}
C {devices/lab_pin.sym} -150 -40 0 0 {name=p15 lab=avdd}
C {devices/lab_pin.sym} 150 -60 0 1 {name=p16 lab=itest}
C {devices/lab_pin.sym} -150 -60 0 0 {name=p17 lab=ena}
C {devices/lab_pin.sym} -150 0 0 0 {name=p18 lab=avss}
C {devices/lab_pin.sym} -150 -20 0 0 {name=p19 lab=ibg_200n}
C {devices/lab_pin.sym} -150 20 0 0 {name=p20 lab=dvdd}
C {devices/lab_pin.sym} -150 60 0 0 {name=p21 lab=dvss}
C {devices/lab_pin.sym} -150 40 0 0 {name=p22 lab=isrc_sel}
C {devices/lab_pin.sym} 150 -20 0 1 {name=p23 lab=brout_filt}
C {devices/lab_pin.sym} 150 0 0 1 {name=p24 lab=osc_ck}
C {devices/lab_pin.sym} -150 100 0 0 {name=p25 lab=osc_ena}
C {devices/lab_pin.sym} -150 120 0 0 {name=p27 lab=outb_unbuf}
C {devices/lab_pin.sym} 150 20 0 1 {name=p28 lab=vunder}
C {devices/lab_pin.sym} 150 40 0 1 {name=p29 lab=outb}
C {devices/opin.sym} 180 -280 0 0 {name=p30 lab=vin_brout}
C {devices/opin.sym} 180 -380 0 0 {name=p33 lab=outb}
C {devices/opin.sym} 180 -360 0 0 {name=p34 lab=osc_ck}
C {devices/opin.sym} 180 -300 0 0 {name=p36 lab=brout_filt}
C {devices/opin.sym} 180 -320 0 0 {name=p37 lab=itest}
C {devices/opin.sym} 180 -240 0 0 {name=p39 lab=timed_out}
C {devices/lab_pin.sym} 150 -80 0 1 {name=p26 lab=vin_vunder}
C {devices/ipin.sym} -430 -300 2 1 {name=p41 lab=vtrip[2:0]}
C {devices/opin.sym} 180 -260 0 0 {name=p38 lab=vin_vunder}
C {devices/opin.sym} 180 -220 0 0 {name=p31 lab=vunder}
C {devices/lab_pin.sym} -150 80 0 0 {name=p32 lab=vtrip_decoded_7_,vtrip_decoded_6_,vtrip_decoded_5_,vtrip_decoded_4_,vtrip_decoded_3_,vtrip_decoded_2_,vtrip_decoded_1_,vtrip_decoded_0_}
C {devices/ipin.sym} -430 -260 2 1 {name=p35 lab=force_ena_rc_osc}
C {devices/lab_pin.sym} 150 -40 0 1 {name=p40 lab=dcomp}
C {devices/opin.sym} 180 -340 0 0 {name=p42 lab=dcomp}
C {xschem/brownout_dig.sym} -100 -590 0 0 {name=xIdig}
C {devices/lab_pin.sym} -250 -690 0 0 {name=p43 lab=dvdd}
C {devices/lab_pin.sym} -250 -670 0 0 {name=p44 lab=dvss}
C {devices/lab_pin.sym} -250 -650 0 0 {name=p45 lab=otrip[2:0]}
C {devices/lab_pin.sym} -250 -630 0 0 {name=p46 lab=vtrip[2:0]}
C {devices/lab_pin.sym} -250 -610 0 0 {name=p47 lab=ena}
C {devices/lab_pin.sym} -250 -590 0 0 {name=p48 lab=force_ena_rc_osc}
C {devices/lab_pin.sym} 50 -690 0 1 {name=p49 lab=osc_ena}
C {devices/lab_pin.sym} -250 -570 0 0 {name=p50 lab=force_dis_rc_osc}
C {devices/lab_pin.sym} 50 -670 0 1 {name=p51 lab=outb_unbuf}
C {devices/lab_pin.sym} -250 -550 0 0 {name=p52 lab=force_short_oneshot}
C {devices/lab_pin.sym} -250 -530 0 0 {name=p54 lab=dcomp}
C {devices/lab_pin.sym} -250 -510 0 0 {name=p56 lab=brout_filt}
C {devices/lab_pin.sym} 50 -610 0 1 {name=p57 lab=timed_out}
C {devices/lab_pin.sym} -250 -490 0 0 {name=p58 lab=osc_ck}
C {devices/lab_pin.sym} 50 -650 0 1 {name=p53 lab=otrip_decoded_7_,otrip_decoded_6_,otrip_decoded_5_,otrip_decoded_4_,otrip_decoded_3_,otrip_decoded_2_,otrip_decoded_1_,otrip_decoded_0_}
C {devices/lab_pin.sym} 50 -630 0 1 {name=p55 lab=vtrip_decoded_7_,vtrip_decoded_6_,vtrip_decoded_5_,vtrip_decoded_4_,vtrip_decoded_3_,vtrip_decoded_2_,vtrip_decoded_1_,vtrip_decoded_0_}
