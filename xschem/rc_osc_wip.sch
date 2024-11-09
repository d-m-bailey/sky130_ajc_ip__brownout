v {xschem version=3.4.5 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {Copyright 2024 Ajacci, Ltd. Co.
Apache License, Version 2.0 with Addendum, see NOTICE
Date: 03/6/2024   Rev: 0
Description: Schmitt trigger RC relaxation oscillator

REFERENCES:
“Relaxation oscillator” Wikipedia, Wikimedia Foundation, 18 December 2023, en.wikipedia.org/wiki/Relaxation_oscillator.
“Schmitt trigger” Wikipedia, Wikimedia Foundation, 20 January 2024, en.wikipedia.org/wiki/Schmitt_trigger.} -770 260 0 0 0.4 0.4 {}
N 40 -70 40 130 {
lab=m}
N 40 160 50 160 {
lab=dvss}
N 40 -100 50 -100 {
lab=dvdd}
N 50 -190 50 -100 {
lab=dvdd}
N 40 -190 40 -130 {
lab=dvdd}
N 0 -100 0 160 {
lab=in}
N 50 160 50 250 {
lab=dvss}
N 40 190 40 250 {
lab=dvss}
N 200 -70 200 130 {
lab=m}
N 200 160 210 160 {
lab=dvss}
N 200 -100 210 -100 {
lab=dvdd}
N 210 -190 210 -100 {
lab=dvdd}
N 200 -190 200 -130 {
lab=dvdd}
N 160 -100 160 160 {
lab=n}
N 210 160 210 250 {
lab=dvss}
N 200 190 200 250 {
lab=dvss}
N 360 -70 360 130 {
lab=n}
N 360 160 370 160 {
lab=dvss}
N 360 -100 370 -100 {
lab=dvdd}
N 370 -190 370 -100 {
lab=dvdd}
N 360 -190 360 -130 {
lab=dvdd}
N 320 -100 320 160 {
lab=m}
N 370 160 370 250 {
lab=dvss}
N 360 190 360 250 {
lab=dvss}
N 510 -70 510 130 {
lab=out}
N 510 160 520 160 {
lab=dvss}
N 510 -100 520 -100 {
lab=dvdd}
N 520 -190 520 -100 {
lab=dvdd}
N 510 -190 510 -130 {
lab=dvdd}
N 470 -100 470 160 {
lab=n}
N 520 160 520 250 {
lab=dvss}
N 510 190 510 250 {
lab=dvss}
N 40 -0 200 0 {
lab=m}
N 200 0 320 0 {
lab=m}
N 360 20 470 20 {
lab=n}
N -150 -30 510 -30 {
lab=out}
N -80 -140 -70 -140 {
lab=dvdd}
N -80 -190 -80 -140 {
lab=dvdd}
N -70 -190 -70 -170 {
lab=dvdd}
N -70 -110 -70 60 {
lab=in}
N 160 20 360 20 {
lab=n}
N -330 60 0 60 {
lab=in}
N -180 -160 -180 -150 {
lab=ena}
N -200 -160 -180 -160 {
lab=ena}
N -180 0 -180 10 {
lab=ena_b}
N -200 0 -180 0 {
lab=ena_b}
N -210 -110 -210 50 {
lab=#net1}
N -150 -110 -150 50 {
lab=out}
N -330 150 -330 250 {
lab=dvss}
N -800 250 520 250 {
lab=dvss}
N -800 -190 520 -190 {
lab=dvdd}
N -650 -190 -650 -100 {
lab=dvdd}
N -660 -190 -660 -130 {
lab=dvdd}
N -650 160 -650 250 {
lab=dvss}
N -660 190 -660 250 {
lab=dvss}
N -580 -240 -580 250 {
lab=dvss}
N -680 -260 -680 -210 {
lab=in}
N -680 -210 -330 -210 {
lab=in}
N -330 -210 -330 90 {
lab=in}
N 40 -260 40 -210 {
lab=#net1}
N -280 -210 40 -210 {
lab=#net1}
N -280 -210 -280 -30 {
lab=#net1}
N -280 -30 -210 -30 {
lab=#net1}
N -660 160 -650 160 {
lab=dvss}
N -660 -100 -650 -100 {
lab=dvdd}
N -700 -100 -700 160 {
lab=ena}
N -660 -70 -660 130 {
lab=ena_b}
C {sky130_fd_pr/nfet_01v8.sym} 20 160 0 0 {name=M1
W=1
L=0.5
nf=1 
mult=2
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 20 -100 0 0 {name=M3
W=1
L=0.5
nf=1
mult=6
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} -800 -190 2 1 {name=p1 lab=dvdd}
C {devices/ipin.sym} -800 250 2 1 {name=p2 lab=dvss}
C {sky130_fd_pr/nfet_01v8.sym} 180 160 0 0 {name=M2
W=1
L=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 180 -100 0 0 {name=M4
W=1
L=1
nf=1
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 340 160 0 0 {name=M5
W=1
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 340 -100 0 0 {name=M6
W=1
L=0.5
nf=1
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 490 160 0 0 {name=M7
W=1
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 490 -100 0 0 {name=M8
W=1
L=0.5
nf=1
mult=3
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/opin.sym} 510 -30 0 0 {name=p4 lab=out}
C {devices/lab_pin.sym} -30 -140 2 0 {name=p8 sig_type=std_logic lab=ena}
C {devices/lab_wire.sym} -20 60 0 0 {name=p5 sig_type=std_logic lab=in}
C {devices/lab_wire.sym} 130 0 0 0 {name=p9 sig_type=std_logic lab=m}
C {devices/lab_wire.sym} 280 20 0 0 {name=p10 sig_type=std_logic lab=n}
C {devices/lab_pin.sym} -200 -160 2 1 {name=p11 sig_type=std_logic lab=ena}
C {devices/lab_pin.sym} -200 0 2 1 {name=p12 sig_type=std_logic lab=ena_b}
C {devices/lab_pin.sym} -180 -110 1 1 {name=p13 sig_type=std_logic lab=dvss}
C {devices/lab_pin.sym} -180 50 1 1 {name=p14 sig_type=std_logic lab=dvdd}
C {sky130_fd_pr/nfet_01v8.sym} 760 170 0 0 {name=Mdum0
W=1
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 780 140 0 0 {name=p3 sig_type=std_logic lab=m}
C {devices/lab_wire.sym} 780 200 2 1 {name=p6 sig_type=std_logic lab=dvss}
C {devices/lab_wire.sym} 740 170 2 1 {name=p7 sig_type=std_logic lab=dvss}
C {devices/lab_wire.sym} 780 170 0 1 {name=p15 sig_type=std_logic lab=dvss}
C {sky130_fd_pr/nfet_01v8.sym} 920 170 0 0 {name=Mdum1
W=1
L=0.5
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 940 140 0 0 {name=p16 sig_type=std_logic lab=n}
C {devices/lab_wire.sym} 940 200 2 1 {name=p17 sig_type=std_logic lab=dvss}
C {devices/lab_wire.sym} 900 170 2 1 {name=p18 sig_type=std_logic lab=dvss}
C {devices/lab_wire.sym} 940 170 0 1 {name=p19 sig_type=std_logic lab=dvss}
C {sky130_fd_pr/pfet_01v8.sym} 760 60 0 0 {name=Mdum2
W=1
L=0.5
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_wire.sym} 740 60 2 1 {name=p20 sig_type=std_logic lab=dvdd}
C {devices/lab_wire.sym} 780 60 2 0 {name=p21 sig_type=std_logic lab=dvdd}
C {devices/lab_wire.sym} 780 90 2 1 {name=p22 sig_type=std_logic lab=m}
C {devices/lab_wire.sym} 780 30 0 0 {name=p23 sig_type=std_logic lab=n}
C {sky130_fd_pr/pfet_01v8.sym} -50 -140 0 1 {name=M12
W=1
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -180 -130 1 0 {name=M10
W=1
L=0.18
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -180 30 3 1 {name=M11
W=1
L=0.18
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 950 60 0 1 {name=Mdum3
W=1
L=0.18
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} -680 160 0 0 {name=M9
W=1
L=0.6
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} -680 -100 0 0 {name=M13
W=1
L=0.6
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} -700 40 2 1 {name=p24 lab=ena}
C {devices/lab_wire.sym} -660 50 0 1 {name=p25 sig_type=std_logic lab=ena_b}
