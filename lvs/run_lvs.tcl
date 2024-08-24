# Tcl script to run LVS on the Ajacci brownout detector

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/local/share/pdk}
if {[catch {set PDK $::env(PDK)}]} {set PDK sky130A}

set pdklib ${PDK_ROOT}/${PDK}
set techlibs ${pdklib}/libs.tech
set reflibs ${pdklib}/libs.ref

set setupfile ${techlibs}/netgen/sky130A_setup.tcl
set hvlib ${reflibs}/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice
set hdlib ${reflibs}/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice
set eflib ${reflibs}/sky130_fd_sc_hd/spice/sky130_ef_sc_hd__decap_12.spice

set circuit1 [readnet spice ../netlist/layout/sky130_ajc_ip__brownout.spice]
set circuit2 [readnet spice $hvlib]
readnet spice $hdlib $circuit2
readnet spice $eflib $circuit2
readnet spice ../netlist/brownout_dig.spice $circuit2
readnet spice ../netlist/schematic/sky130_ajc_ip__brownout.spice $circuit2

lvs "$circuit1 sky130_ajc_ip__brownout" "$circuit2 sky130_ajc_ip__brownout" \
        $setupfile sky130_ajc_ip__brownout_comp.out
