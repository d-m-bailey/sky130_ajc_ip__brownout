# sky130_ajc_ip__brownout
Brown-out and under-voltage detector for SKY130

This circuit is designed to produce an alarm signal `out` (asserted low) when the power supply `avdd` falls below a selectable trip voltage via `otrip[2:0]`, ranging from 2.4V to 3.0V.

To clone this repository:

`git clone https://github.com/ajcci/sky130_ajc_ip__brownout`

To view a schematic after cloning the repository:

```
cd sky130_ajc_ip__brownout
xschem cace/dccurrent_avdd.sch
```

Run CACE to see simulation results against a set of specifications:

`cace-gui`

![](sky130_ajc_ip__brownout.png)

Demo of the a temporary glitch on `avdd` (orange), causing the `out` (blue) to assert a reset.  The green trace is `osc_ck`, the internal clock that times the one-shot timer window.  Due to long simulation times, the one-shot timer is significantly shortened from 4096 cycles to 16 cycles using a test mode.
![](brownout_demo.png)

## Layout
The layout was drawn in Magic, so it is best viewed and edited in Magic.

Open layout using Magic by typing the following in the `mag` directory:

`magic -d XR -rcfile $PDK_ROOT/$PDK/libs.tech/magic/sky130A.magicrc sky130_ajc_ip__brownout.mag`

Alternatively, if using Klayout, in base directory, enter the following in the terminal:

`klayout -e gds/sky130_ajc_ip__brownout.gds`

![](sky130_ajc_ip__brownout_layout.png)
Layout of `sky130_ajc_ip__brownout`, approximate size is 230um x 230um sq.

The gds file is located at `gds/sky130_ajc_ip__brownout.gds`

## Design-Rule-Check (DRC)
DRC is automatic in Magic. Design passes all rules in Magic except the 'MV diffusion spacing rules'. However, according to Tim Edwards at eFabless Inc., these are not actual violations and are false positives, see picture below.

![](magic_drc_violation.png)
DRC rule violations that are false positives (not actual violations) related to 'MV diffusion spacing'


Check the design using Klayout sky130 DRC deck for consistency:
1. In the Magic Tcl interpreter, run `gds write sky130_ajc_ip__brownout.gds` to stream out a gds file from Magic.
2. Load `sky130_ajc_ip__brownout.gds` into Klayout by running `klayout sky130ajc_ip__brownout.gds`
3. Run sky130A DRC rule deck (assumes Klayout environment is already setup for sky130 pdk, not described here)


![](brownout_drc_sky130A.png)
Output from Klayout showing no DRC rule violations (all green) for sky130A DRC runset

Some special 'manufacturing rules' are not checked in Magic, so a special 'mr' rule deck in Klayout is used to check for those violations.  Simply load the `sky130A_mr` DRC deck and run to produce the all-pass result pictured below:


![](brownout_drc_sky130A_mr.png)
Output from Klayout showing no DRC rule violations for sky130A 'mr' DRC rules



## Layout vs Schematic (LVS)
Run using Magic for layout-to-spice netlist extraction, and then Netgen for netlist comparison vs schematic.

Steps taken to perform LVS:

1. Created a blackbox for the digital block `brownout_dig` and replaced the xspice model of `brownout_dig` with the blackbox `brownout_dig`.  In the symbol `brownout_dig.sym`, set `type=primitive`, so that when netlisting out, brownout_dig will be instantiated but not defined (i.e. no `subckt brownout_dig` is writting out).  This is important later for the Verilog gate-level netlist of brownout_dig to properly define the definition for brownout_dig.  Save the new top-level schematic as `sky130_ajc_ip__brownout_lvs`.  Netlist out `sky130_ajc_ip__brownout_lvs` in xschem and rename the netlist as `sky130_ajc_ip__brownout_lvs.xschem`.  Edit `sky130_ajc_ip__brownout_lvs.xschem` and add the following lines to the file (change $PDK_ROOT/$PDK to the location of your setup):

```
.include $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
```

2. Manually delete the bulk node 'avss' connection of the pnp device in the xschem netlist `sky130_ajc_ip__brownout_lvs.xschem`.

Search for this line in the file:
`XQ1 avss avss net7 avss sky130_fd_pr__pnp_05v5_W0p68L0p68 m=1 mult=1`

and change it to the following:

`XQ1 avss avss net7 sky130_fd_pr__pnp_05v5_W0p68L0p68 m=1 mult=1`

This step is necessary because the 'combined' models of the sky130 pdk uses a 4-port connection to sky130_fd_pr__pnp_05v5_W0p68L0p68, but Magic only extracts 3 ports, so we manually delete the bulk node (4th port).

3. Extract the layout in Magic using the following commands in the Tcl interpreter:

```
extract all
ext2spice lvs
ext2spice
```

Magic should generate a file named `sky130_ajc_ip__brownout.spice`

4. Locate the final gate-level Verilog netlist of brownout_dig.  In this case, it is located at

`openlane/brownout_dig/runs/RUN_2024-04-11_23-19-37/47-openroad-fillinsertion/brownout_dig.pnl.v`

5. Put the files `sky130_ajc_ip__brownout.spice` (Magic-extracted netlist), `sky130_ajc_ip__brownout_lvs.xschem` (xschem netlist), and `brownout_dig.pnl.v` in the same directory, in this case `mag/lvs`.

6. Create a new run script for Netgen, in this case called `runlvs`, and put the following contents inside:

```
set layout [readnet spice "sky130_ajc_ip__brownout.spice"]
set source [readnet spice "$env(PDK_ROOT)/$env(PDK)/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice"]
readnet verilog brownout_dig.pnl.v $source
readnet spice "sky130_ajc_ip__brownout_lvs.xschem" $source
lvs "$layout sky130_ajc_ip__brownout" "$source sky130_ajc_ip__brownout_lvs" $env(PDK_ROOT)/$env(PDK)/libs.tech/netgen/$env(PDK)_setup.tcl lvs.report
```

7. Enter the following in the terminal to run LVS:

`netgen -batch source runlvs`

Netgen should produce the following output:

```
Contents of circuit 1:  Circuit: 'sky130_ajc_ip__brownout'
Circuit sky130_ajc_ip__brownout contains 170 device instances.
  Class: sky130_fd_pr__cap_mim_m3_2 instances:   1
  Class: sky130_fd_sc_hd__inv_4 instances:   5
  Class: sky130_fd_pr__pnp_05v5_W0p68L0p68 instances:   1
  Class: brownout_dig          instances:   1
  Class: schmitt_trigger       instances:   1
  Class: sky130_fd_sc_hvl__lsbufhv2lv_1 instances:   2
  Class: sky130_fd_pr__nfet_g5v0d10v5 instances:  63
  Class: sky130_fd_sc_hvl__inv_1 instances:  17
  Class: sky130_fd_sc_hd__inv_16 instances:   4
  Class: sky130_fd_sc_hvl__lsbuflv2hv_1 instances:  18
  Class: sky130_fd_pr__res_xhigh_po_1p41 instances:  10
  Class: sky130_fd_pr__pfet_g5v0d10v5 instances:  45
  Class: ibias_gen             instances:   1
  Class: rc_osc                instances:   1
Circuit contains 118 nets.
Contents of circuit 2:  Circuit: 'sky130_ajc_ip__brownout_lvs'
Circuit sky130_ajc_ip__brownout_lvs contains 170 device instances.
  Class: sky130_fd_pr__cap_mim_m3_2 instances:   1
  Class: sky130_fd_sc_hd__inv_4 instances:   5
  Class: sky130_fd_pr__pnp_05v5_W0p68L0p68 instances:   1
  Class: brownout_dig          instances:   1
  Class: schmitt_trigger       instances:   1
  Class: sky130_fd_sc_hvl__lsbufhv2lv_1 instances:   2
  Class: sky130_fd_pr__nfet_g5v0d10v5 instances:  63
  Class: sky130_fd_sc_hvl__inv_1 instances:  17
  Class: sky130_fd_sc_hd__inv_16 instances:   4
  Class: sky130_fd_sc_hvl__lsbuflv2hv_1 instances:  18
  Class: sky130_fd_pr__res_xhigh_po_1p41 instances:  10
  Class: sky130_fd_pr__pfet_g5v0d10v5 instances:  45
  Class: ibias_gen             instances:   1
  Class: rc_osc                instances:   1
Circuit contains 123 nets.

Circuit 1 contains 170 devices, Circuit 2 contains 170 devices.
Circuit 1 contains 118 nets,    Circuit 2 contains 118 nets.


Final result: 
Circuits match uniquely.
.
Logging to file "lvs.report" disabled
LVS Done.
```

8. Optional step to check the file `lvs.report` shows that the Verilog gate-level netlist, which defines brownout_dig was indeed included in the LVS check:


```
Subcircuit summary:
Circuit 1: brownout_ana                    |Circuit 2: brownout_ana                    
-------------------------------------------|-------------------------------------------
sky130_fd_sc_hd__inv_16 (4)                |sky130_fd_sc_hd__inv_16 (4)                
sky130_fd_sc_hvl__lsbufhv2lv_1 (2)         |sky130_fd_sc_hvl__lsbufhv2lv_1 (2)         
sky130_fd_pr__nfet_g5v0d10v5 (186->49)     |sky130_fd_pr__nfet_g5v0d10v5 (186->49)     
sky130_fd_pr__pfet_g5v0d10v5 (223->45)     |sky130_fd_pr__pfet_g5v0d10v5 (223->45)     
sky130_fd_sc_hvl__inv_1 (17)               |sky130_fd_sc_hvl__inv_1 (17)               
sky130_fd_pr__res_xhigh_po_1p41 (29->10)   |sky130_fd_pr__res_xhigh_po_1p41 (10)       
sky130_fd_sc_hd__inv_4 (5)                 |sky130_fd_sc_hd__inv_4 (5)                 
schmitt_trigger (1)                        |schmitt_trigger (1)                        
sky130_fd_sc_hvl__lsbuflv2hv_1 (18)        |sky130_fd_sc_hvl__lsbuflv2hv_1 (18)        
rc_osc (1)                                 |rc_osc (1)                                 
sky130_fd_pr__cap_mim_m3_2 (6->1)          |sky130_fd_pr__cap_mim_m3_2 (6->1)          
ibias_gen (1)                              |ibias_gen (1)                              
sky130_fd_pr__pnp_05v5_W0p68L0p68 (1)      |sky130_fd_pr__pnp_05v5_W0p68L0p68 (1)      
Number of devices: 155                     |Number of devices: 155                     
Number of nets: 108                        |Number of nets: 108                        
---------------------------------------------------------------------------------------
Netlists match uniquely with port errors.

Subcircuit pins:
Circuit 1: brownout_ana                    |Circuit 2: brownout_ana                    
-------------------------------------------|-------------------------------------------
comparator_1/vt                            |(no matching pin)                          
comparator_0/vt                            |(no matching pin)                          
avss                                       |avss                                       
vin_vunder                                 |vin_vunder                                 
vin_brout                                  |vin_brout                                  
avdd                                       |avdd                                       
vbg_1v2                                    |vbg_1v2                                    
ena                                        |ena                                        
isrc_sel                                   |isrc_sel                                   
itest                                      |itest                                      
ibg_200n                                   |ibg_200n                                   
osc_ck                                     |osc_ck                                     
osc_ena                                    |osc_ena                                    
outb_unbuf                                 |outb_unbuf                                 
vtrip_decoded[7]                           |vtrip_decoded[7]                           
otrip_decoded[7]                           |otrip_decoded[7]                           
vtrip_decoded[6]                           |vtrip_decoded[6]                           
otrip_decoded[6]                           |otrip_decoded[6]                           
vtrip_decoded[5]                           |vtrip_decoded[5]                           
otrip_decoded[5]                           |otrip_decoded[5]                           
vtrip_decoded[4]                           |vtrip_decoded[4]                           
vtrip_decoded[3]                           |vtrip_decoded[3]                           
otrip_decoded[4]                           |otrip_decoded[4]                           
otrip_decoded[3]                           |otrip_decoded[3]                           
vtrip_decoded[2]                           |vtrip_decoded[2]                           
otrip_decoded[2]                           |otrip_decoded[2]                           
vtrip_decoded[1]                           |vtrip_decoded[1]                           
otrip_decoded[1]                           |otrip_decoded[1]                           
vtrip_decoded[0]                           |vtrip_decoded[0]                           
otrip_decoded[0]                           |otrip_decoded[0]                           
dcomp                                      |dcomp                                      
vunder                                     |vunder                                     
brout_filt                                 |brout_filt                                 
outb                                       |outb                                       
dvdd                                       |dvdd                                       
dvss                                       |dvss                                       
comparator_0/vt                            |(no matching pin)                          
comparator_1/vt                            |(no matching pin)                          
---------------------------------------------------------------------------------------
Cell pin lists for brownout_ana and brownout_ana altered to match.
Device classes brownout_ana and brownout_ana are equivalent.
  Flattening non-matched subcircuits brownout_ana brownout_ana
Flattening unmatched subcell sky130_fd_pr__nfet_g5v0d10v5_PXF6AN in circuit sky130_ajc_ip__brownout (0)(1 instance)
Flattening unmatched subcell sky130_fd_pr__nfet_g5v0d10v5_V6EN4F in circuit sky130_ajc_ip__brownout (0)(1 instance)
Flattening unmatched subcell sky130_fd_pr__nfet_g5v0d10v5_XTZQRT in circuit sky130_ajc_ip__brownout (0)(1 instance)

Class sky130_ajc_ip__brownout (0):  Merged 14 parallel devices.
Subcircuit summary:
Circuit 1: sky130_ajc_ip__brownout         |Circuit 2: sky130_ajc_ip__brownout_lvs     
-------------------------------------------|-------------------------------------------
sky130_fd_pr__nfet_g5v0d10v5 (214->63)     |sky130_fd_pr__nfet_g5v0d10v5 (214->63)     
brownout_dig (1)                           |brownout_dig (1)                           
sky130_fd_sc_hd__inv_16 (4)                |sky130_fd_sc_hd__inv_16 (4)                
sky130_fd_sc_hvl__lsbufhv2lv_1 (2)         |sky130_fd_sc_hvl__lsbufhv2lv_1 (2)         
sky130_fd_pr__pfet_g5v0d10v5 (223->45)     |sky130_fd_pr__pfet_g5v0d10v5 (223->45)     
sky130_fd_sc_hvl__inv_1 (17)               |sky130_fd_sc_hvl__inv_1 (17)               
sky130_fd_pr__res_xhigh_po_1p41 (10)       |sky130_fd_pr__res_xhigh_po_1p41 (10)       
sky130_fd_sc_hd__inv_4 (5)                 |sky130_fd_sc_hd__inv_4 (5)                 
schmitt_trigger (1)                        |schmitt_trigger (1)                        
sky130_fd_sc_hvl__lsbuflv2hv_1 (18)        |sky130_fd_sc_hvl__lsbuflv2hv_1 (18)        
rc_osc (1)                                 |rc_osc (1)                                 
sky130_fd_pr__cap_mim_m3_2 (6->1)          |sky130_fd_pr__cap_mim_m3_2 (6->1)          
ibias_gen (1)                              |ibias_gen (1)                              
sky130_fd_pr__pnp_05v5_W0p68L0p68 (1)      |sky130_fd_pr__pnp_05v5_W0p68L0p68 (1)      
Number of devices: 170                     |Number of devices: 170                     
Number of nets: 118                        |Number of nets: 118                        
---------------------------------------------------------------------------------------
Netlists match uniquely.

Subcircuit pins:
Circuit 1: sky130_ajc_ip__brownout         |Circuit 2: sky130_ajc_ip__brownout_lvs     
-------------------------------------------|-------------------------------------------
avss                                       |avss                                       
avdd                                       |avdd                                       
vbg_1v2                                    |vbg_1v2                                    
vin_brout                                  |vin_brout                                  
vin_vunder                                 |vin_vunder                                 
dvdd                                       |dvdd                                       
ibg_200n                                   |ibg_200n                                   
itest                                      |itest                                      
vunder                                     |vunder                                     
outb                                       |outb                                       
timed_out                                  |timed_out                                  
isrc_sel                                   |isrc_sel                                   
dcomp                                      |dcomp                                      
brout_filt                                 |brout_filt                                 
osc_ck                                     |osc_ck                                     
force_dis_rc_osc                           |force_dis_rc_osc                           
force_ena_rc_osc                           |force_ena_rc_osc                           
force_short_oneshot                        |force_short_oneshot                        
otrip[2]                                   |otrip[2]                                   
otrip[1]                                   |otrip[1]                                   
otrip[0]                                   |otrip[0]                                   
vtrip[2]                                   |vtrip[2]                                   
vtrip[1]                                   |vtrip[1]                                   
vtrip[0]                                   |vtrip[0]                                   
ena                                        |ena                                        
dvss                                       |dvss                                       
---------------------------------------------------------------------------------------
Cell pin lists are equivalent.
Device classes sky130_ajc_ip__brownout and sky130_ajc_ip__brownout_lvs are equivalent.

Final result: Circuits match uniquely.
.

```
Last part of lvs.report showing LVS match as well as Verilog gate-level netlist (which defines `brownout_dig`)  being included in the check.





## Parasitic Resistance and Capacitance Extraction (RCX)
Perform RCX using Magic after passing DRC and LVS.  The purpose is to check how parasitics (interconnect resistance and capacitance) from layout affects the circuit.

This circuit includes a digital route which is not included in RCX because we will rely on Openlane to make sure timing is done correctly in the digital route.  Therefore, only the analog section of the circuit is extracted.

Open up `brownout_ana.mag` (analog section of `sky130_ajc_ip__brownout`) and enter the following in the Tcl interpreter to generate an extracted spice netlist with parasitic resistance and capacitance included in the netlist:

```
flatten brownout_ana_rcx
load brownout_ana_rcx
select top cell
extract path extfiles
extract all
ln -s extfiles/brownout_ana_rcx.ext (enter this line in terminal)
ext2sim labels on
ext2sim
extresist tolerance 0.001
extresist
ext2spice lvs
ext2spice cthresh 0.1
ext2spice extresist on
ext2spice -p extfiles
```
A netlist should be created named `brownout_ana_rcx.spice`, which has a top-level subckt named `brownout_ana_rcx`.  Create the directory `mag/rcx` and put `brownout_ana_rcx.spice` in there.  As a side note, `extresist tolerance 0.001` was used here to reduce the number of nodes created by the extraction algorithm, which created convergence problems for Ngspice later during simulation.  Changing `extresist tolerance 10` to `extresist tolerance 0.001`, for this circuit, roughly reduced the number of nodes by 30%.

In order to use `brownout_ana_rcx` in a simulation, do the following:
1. Create a blackbox schematic named `brownout_ana_rcx` with all the associated pins and pin-order exactly the same as `brownout_ana.sym`
2. Create an accompanying symbol named `brownout_ana_rcx.sym`
3. Within the schematic `brownout_ana_rcx.sch`, add a `devices/code.sym` block from the xschem library
4. In the `code.sym` block, instantiate `brownout_ana_rcx` and include the extracted netlist subckt definition (in this case it is located at `mag/rcx/brownout_ana_rcx.spice`):

```
name=brownout_ana only_toplevel=false value="

.include mag/rcx/brownout_ana_rcx.spice

xIana vin_brout otrip_decoded[7] otrip_decoded[6] otrip_decoded[5] otrip_decoded[4] otrip_decoded[3] otrip_decoded[2]
+ otrip_decoded[1] otrip_decoded[0] vin_vunder vbg_1v2 ena avdd ibg_200n itest avss dvdd isrc_sel dvss vtrip_decoded[7] vtrip_decoded[6]
+ vtrip_decoded[5] vtrip_decoded[4] vtrip_decoded[3] vtrip_decoded[2] vtrip_decoded[1] vtrip_decoded[0] dcomp brout_filt osc_ck osc_ena vunder outb
+ outb_unbuf brownout_ana
"
```

Open up `sky130_ajc_ip__brownout` and substitute `brownout_ana.sym` with `brownout_ana_rcx.sym` (see pictures below):

![](brownout_ana.png)
Original `sky130_ajc_ip__brownout` showing `brownout_ana` (schematic-based, no RC parasitics)

![](brownout_ana_rcx.png)
New `sky130_ajc_ip__brownout` showing `brownout_ana_rcx` (extracted from layout, with RC parasitics)

Save it and run CACE the usual way __without__ selecting `R-C Extracted` from the `cace-gui` window.  Once again, this is done because this circuit uses xspice models to simulate the behavior of the digital route and the digital route was not extracted from the layout for faster simulation (as well as a higher likelihood of simulation convergence).

Without any changes to Ngspice parameters, the extracted netlist will run into __'Timestep too small'__ issues due to limitations of the simulator, and cause the simulation to quit prematurely.

To make it run all the way through, add the following two options to reduce the tolerance of the simulation, albeit reduces accuracy of the simulation results:

```
.option reltol=1e-3
.option abstol=1e-3
```

Results after RCX simulation is shown in the figure below. All pass.
![](sky130_ajc_ip__brownout_cace_rcx.png)
RCX netlist with .options reltol=1e-3 abstol=1e-3

### Digital Route DRC & LVS
DRC and LVS is performed by Openlane during synthesis.  It performs LVS by extracting the digital route using Magic, and then comparing it to the verilog file generated after fill-insersion.  Here is the result:
![](brownout_openlane.png)


### Simulation convergence issues
During the design phase it was discovered that the resistor string made up of xhigh_po resistors (2kohm/sq) confuses Ngspice when too many of them are in series.  There are a total of 70 resistors in the resistor ladder, and each resistor models second-order effects related to the substrate using hyperbolic-tangent functions (shown below).  Manually removing the `tanh` model and substuiting back in a basic resistor solves the convergence issues during simulation.  This is not seen as a risk as this is not a precision circuit.

```
rbody t1 t2 resbody r = {rbody*(1-bp2+bp2*sqrt(1+(bq2*abs(v(t1,t2))*Efac)**2))*
+ (sub1+sub2*tanh(sub3*(min(v(sub,r1)+v(sub,r1),sub4)+sub5))) / (sub1+sub2*tanh(sub3*sub5)) }
```

The above excerpt can be located at
`$PDK_ROOT/$PDK/libs.tech/combined/continuous/models_resistors.spice`

Replacing the above definition of `rbody` with the following, eliminates convergence or simulator-going-haywire >
```
rbody t1 t2 resbody r = rbody
```

Note that `resbody` is a model that defines tempco so the model retains tempo variations.
