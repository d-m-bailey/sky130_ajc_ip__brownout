# NOTE: PDK_ROOT, PDK and CACE_ROOT are set in the local environment by CACE
#
# This is an example script to drive LVS; because this is a simple
# example, there is no specific benefit of using this instead of the
# default handling in CACE.

set PDK_ROOT $::env(PDK_ROOT)
set PDK $::env(PDK)
set CACE_ROOT $::env(CACE_ROOT)

set circuit1 [readnet spice $CACE_ROOT/netlist/layout/sky130_ajc_ip__brownout.spice]
set circuit2 [readnet spice $CACE_ROOT/netlist/schematic/sky130_ajc_ip__brownout.spice]

readnet spice $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/spice/sky130_fd_sc_hd.spice $circuit2  

readnet spice $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hvl/spice/sky130_fd_sc_hvl.spice $circuit2  

readnet spice $PDK_ROOT/$PDK/libs.ref/sky130_fd_sc_hd/spice/sky130_ef_sc_hd__decap_12.spice $circuit2  

readnet spice $CACE_ROOT/netlist/brownout_dig.spice $circuit2

lvs "$circuit1 sky130_ajc_ip__brownout" "$circuit2 sky130_ajc_ip__brownout" $PDK_ROOT/$PDK/libs.tech/netgen/${PDK}_setup.tcl sky130_ajc_ip__brownout_comp.out -json
