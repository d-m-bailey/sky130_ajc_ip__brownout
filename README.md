# sky130_ajc_ip__brownout
Brown-out and under-voltage detector for SKY130

This circuit is designed to produce an alarm signal `out` (asserted low) when the power supply `avdd` falls below a selectable trip voltage via `otrip[2:0]`, ranging from 2.4V to 3.0V.

To clone this repository:

`git clone https://github.com/ajcci/sky130_ajc_ip__brownout`

To view a schematic after cloning the repository:

```
cd sky130_ajc_ip__brownout
xschem xschem/sky130_ajc_ip__brownout_tb.sch
```

Run CACE to see simulation results against a set of specifications:

`cace-gui`

![](sky130_ajc_ip__brownout.png)

![](brownout_demo.png)
