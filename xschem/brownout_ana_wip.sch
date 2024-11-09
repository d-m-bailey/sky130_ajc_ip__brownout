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
N 1080 260 1120 260 {
lab=#net1}
N 960 260 1000 260 {
lab=#net2}
N 590 260 660 260 {
lab=dcomp3v3uv}
N 840 260 880 260 {
lab=vlu}
N 960 -60 1000 -60 {
lab=#net3}
N 840 -60 880 -60 {
lab=vl}
N 590 -60 660 -60 {
lab=dcomp3v3}
N 1350 60 1350 90 {
lab=dcomp_filt}
N 1350 150 1350 170 {
lab=dvss}
N 1180 60 1420 60 {
lab=dcomp_filt}
N 1720 40 1780 40 {
lab=vsch}
N 860 -60 860 60 {
lab=vl}
N 860 60 1120 60 {
lab=vl}
N 1860 40 1900 40 {
lab=#net4}
N 190 -100 290 -100 {
lab=#net5}
N 190 -100 190 50 {
lab=#net5}
N 150 80 150 130 {
lab=avss}
N 190 110 190 130 {
lab=avss}
N 120 130 190 130 {
lab=avss}
N -810 260 -770 260 {
lab=#net6}
N -910 260 -890 260 {
lab=outb_unbuf}
N -690 260 -370 260 {
lab=outb}
C {devices/lab_pin.sym} -220 -60 0 0 {name=p1 lab=avdd}
C {devices/lab_pin.sym} 80 -60 0 1 {name=p2 lab=vin_brout}
C {devices/lab_pin.sym} -220 -40 0 0 {name=p6 lab=ena_avdd}
C {devices/lab_pin.sym} -220 20 0 0 {name=p7 lab=avss}
C {devices/lab_pin.sym} 290 -60 0 0 {name=p8 lab=avdd}
C {devices/lab_pin.sym} 290 -40 0 0 {name=p9 lab=ibias0}
C {devices/lab_pin.sym} 290 0 0 0 {name=p13 lab=vin_brout}
C {devices/lab_pin.sym} 290 40 0 0 {name=p14 lab=avss}
C {devices/lab_pin.sym} 290 -200 0 0 {name=p15 lab=avdd}
C {devices/lab_pin.sym} 290 -140 0 0 {name=p16 lab=isrc_sel_avdd}
C {devices/lab_pin.sym} 290 -160 0 0 {name=p20 lab=vbg_1v2}
C {devices/lab_pin.sym} 290 -80 0 0 {name=p21 lab=avss}
C {devices/ipin.sym} -180 -220 0 0 {name=p12 lab=vbg_1v2}
C {devices/ipin.sym} -180 -200 0 0 {name=p22 lab=avdd}
C {devices/ipin.sym} -180 -180 0 0 {name=p23 lab=avss}
C {devices/ipin.sym} -180 -160 0 0 {name=p24 lab=dvdd}
C {devices/ipin.sym} -180 -140 0 0 {name=p25 lab=dvss}
C {devices/ipin.sym} -850 -210 0 0 {name=p26 lab=ena}
C {devices/ipin.sym} -850 -150 0 0 {name=p3 lab=isrc_sel}
C {devices/lab_pin.sym} 290 -120 0 0 {name=p17 lab=ena_avdd}
C {devices/ipin.sym} 290 -180 0 0 {name=p19 lab=ibg_200n}
C {devices/lab_pin.sym} 290 20 0 0 {name=p28 lab=vbg_1v2}
C {devices/lab_pin.sym} 290 -20 0 0 {name=p11 lab=ena_avdd}
C {sky130_fd_sc_hvl__lsbufhv2lv_1.sym} 750 -60 0 0 {name=xIlvls4 LVPWR=dvdd VGND=dvss VNB=dvss VPB=avdd VPWR=avdd prefix=sky130_fd_sc_hvl__ }
C {devices/lab_pin.sym} 590 -160 0 1 {name=p31 lab=ibias1}
C {devices/opin.sym} 590 -180 0 0 {name=p18 lab=itest}
C {sky130_fd_sc_hvl__lsbuflv2hv_1.sym} -760 -270 0 0 {name=xIlvls0[7:0] LVPWR=dvdd VGND=dvss VNB=dvss VPB=avdd VPWR=avdd prefix=sky130_fd_sc_hvl__ }
C {devices/ipin.sym} -850 -270 2 1 {name=p36 lab=otrip_decoded[7:0]}
C {devices/lab_pin.sym} -670 -270 2 0 {name=p37 sig_type=std_logic lab=otrip_decoded_avdd[7:0]}
C {sky130_fd_sc_hvl__lsbuflv2hv_1.sym} -760 -210 0 0 {name=xIlvls1 LVPWR=dvdd VGND=dvss VNB=dvss VPB=avdd VPWR=avdd prefix=sky130_fd_sc_hvl__ }
C {devices/lab_pin.sym} -670 -210 0 1 {name=p38 lab=ena_avdd}
C {sky130_fd_sc_hvl__lsbuflv2hv_1.sym} -760 -150 0 0 {name=xIlvls2 LVPWR=dvdd VGND=dvss VNB=dvss VPB=avdd VPWR=avdd prefix=sky130_fd_sc_hvl__ }
C {devices/lab_pin.sym} -670 -150 0 1 {name=p39 lab=isrc_sel_avdd}
C {devices/lab_pin.sym} -220 -20 0 0 {name=p27 lab=otrip_decoded_avdd[7:0]}
C {rstring_mux.sym} -70 -20 0 0 {name=xIrsmux}
C {comparator.sym} 440 -10 0 0 {name=xIcomp_brout}
C {ibias_gen.sym} 440 -140 0 0 {name=xIbiasgen}
C {devices/lab_wire.sym} 650 -60 0 0 {name=p10 sig_type=std_logic lab=dcomp3v3}
C {devices/opin.sym} 590 -270 0 0 {name=p41 lab=vin_brout}
C {sky130_fd_sc_hvl__lsbuflv2hv_1.sym} -760 -90 0 0 {name=xIlvls3[7:0] LVPWR=dvdd VGND=dvss VNB=dvss VPB=avdd VPWR=avdd prefix=sky130_fd_sc_hvl__ }
C {devices/ipin.sym} -850 -90 2 1 {name=p46 lab=vtrip_decoded[7:0]}
C {devices/lab_pin.sym} -670 -90 2 0 {name=p47 sig_type=std_logic lab=vtrip_decoded_avdd[7:0]}
C {devices/lab_pin.sym} -220 0 0 0 {name=p48 lab=vtrip_decoded_avdd[7:0]}
C {devices/lab_pin.sym} 80 -40 0 1 {name=p49 lab=vin_vunder}
C {devices/lab_pin.sym} 290 260 0 0 {name=p50 lab=avdd}
C {devices/lab_pin.sym} 290 280 0 0 {name=p51 lab=ibias1}
C {devices/lab_pin.sym} 290 320 0 0 {name=p52 lab=vin_vunder}
C {devices/lab_pin.sym} 290 360 0 0 {name=p53 lab=avss}
C {devices/lab_pin.sym} 290 340 0 0 {name=p54 lab=vbg_1v2}
C {devices/lab_pin.sym} 290 300 0 0 {name=p55 lab=ena_avdd}
C {devices/opin.sym} 590 -250 0 0 {name=p43 lab=vin_vunder}
C {devices/lab_wire.sym} 870 -60 0 0 {name=p59 sig_type=std_logic lab=vl}
C {sky130_fd_pr/res_xhigh_po_1p41.sym} 1150 60 3 0 {name=R1
L=700
model=res_xhigh_po_1p41
spiceprefix=X
mult=1}
C {devices/lab_pin.sym} 1350 170 2 1 {name=p29 lab=dvss}
C {sky130_fd_pr/cap_mim_m3_2.sym} 1350 120 0 0 {name=C2 model=cap_mim_m3_2 W=30 L=30 MF=6 spiceprefix=X}
C {devices/lab_wire.sym} 1320 60 0 0 {name=p56 sig_type=std_logic lab=dcomp_filt}
C {schmitt_trigger.sym} 1570 60 0 0 {name=xIschmitt}
C {devices/lab_pin.sym} 1420 40 0 0 {name=p57 lab=dvdd}
C {devices/lab_pin.sym} 1420 80 0 0 {name=p58 lab=dvss}
C {devices/lab_wire.sym} 1770 40 0 0 {name=p60 sig_type=std_logic lab=vsch}
C {devices/opin.sym} 1980 40 0 0 {name=p40 lab=brout_filt}
C {sky130_stdcells/inv_4.sym} 1820 40 0 0 {name=xIinv7 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} 1940 40 0 0 {name=xIinv8 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_pin.sym} 1150 80 1 1 {name=p61 lab=avss}
C {devices/lab_wire.sym} 860 260 0 0 {name=p4 sig_type=std_logic lab=vlu}
C {sky130_fd_pr/pnp_05v5.sym} 170 80 0 0 {name=Q1
model=pnp_05v5_W0p68L0p68
m=1
spiceprefix=X
}
C {devices/lab_pin.sym} 120 130 0 0 {name=p5 lab=avss}
C {comparator.sym} 440 310 0 0 {name=xIcomp_vunder}
C {devices/lab_pin.sym} 590 -200 0 1 {name=p30 lab=ibias0}
C {sky130_fd_sc_hvl__lsbufhv2lv_1.sym} 750 260 0 0 {name=xIlvls3 LVPWR=dvdd VGND=dvss VNB=dvss VPB=avdd VPWR=avdd prefix=sky130_fd_sc_hvl__ }
C {sky130_stdcells/inv_4.sym} 1040 260 0 0 {name=xIinv3 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} 1160 260 0 0 {name=xIinv4 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} 1200 260 0 0 {name=p45 lab=vunder}
C {sky130_stdcells/inv_4.sym} 920 260 0 0 {name=xIinv2 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {devices/lab_wire.sym} 660 260 0 0 {name=p34 sig_type=std_logic lab=dcomp3v3uv}
C {devices/opin.sym} 1080 -60 0 0 {name=p35 lab=dcomp}
C {sky130_stdcells/inv_4.sym} 920 -60 0 0 {name=xIinv5 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} 1040 -60 0 0 {name=xIinv6 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {devices/ipin.sym} -910 260 0 0 {name=p42 lab=outb_unbuf}
C {sky130_stdcells/inv_4.sym} -850 260 0 0 {name=xIinv0 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {sky130_stdcells/inv_16.sym} -730 260 0 0 {name=xIinv1 VGND=dvss VNB=dvss VPB=dvdd VPWR=dvdd prefix=sky130_fd_sc_hd__ }
C {devices/opin.sym} -370 260 0 0 {name=p44 lab=outb}
C {devices/lab_pin.sym} 290 200 0 0 {name=p62 lab=dvss}
C {devices/lab_pin.sym} 290 160 0 0 {name=p63 lab=dvdd}
C {devices/ipin.sym} 290 180 0 0 {name=p64 lab=osc_ena}
C {devices/opin.sym} 590 160 0 0 {name=p65 lab=osc_ck}
C {rc_osc.sym} 440 180 0 0 {name=xIosc}
