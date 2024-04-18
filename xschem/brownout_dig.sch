v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {devices/ipin.sym} -20 -20 0 0 {name=p1 lab=VPWR}
C {devices/ipin.sym} -20 0 0 0 {name=p2 lab=VGND}
C {devices/ipin.sym} -20 20 0 0 {name=p3 lab=otrip[2:0]}
C {devices/ipin.sym} -20 40 0 0 {name=p4 lab=vtrip[2:0]}
C {devices/ipin.sym} -20 60 0 0 {name=p5 lab=ena}
C {devices/ipin.sym} -20 80 0 0 {name=p6 lab=force_ena_rc_osc}
C {devices/ipin.sym} -20 100 0 0 {name=p7 lab=force_dis_rc_osc}
C {devices/ipin.sym} -20 120 0 0 {name=p8 lab=force_short_oneshot}
C {devices/ipin.sym} -20 140 0 0 {name=p9 lab=dcomp}
C {devices/ipin.sym} -20 160 0 0 {name=p10 lab=brout_filt}
C {devices/ipin.sym} -20 180 0 0 {name=p11 lab=osc_ck}
C {devices/opin.sym} 80 90 0 0 {name=p12 lab=osc_ena}
C {devices/opin.sym} 80 110 0 0 {name=p13 lab=outb_unbuf}
C {devices/opin.sym} 80 130 0 0 {name=p14 lab=otrip_decoded[7:0]}
C {devices/opin.sym} 80 150 0 0 {name=p15 lab=vtrip_decoded[7:0]}
C {devices/opin.sym} 80 170 0 0 {name=p16 lab=timed_out}
