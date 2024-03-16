To generate xspice subckt from extracted Magic spice file, run the following command:

Assumes brownout_dig.spice is the extracted netlist from Magic after a brownout_dig.v is routed by openlane

`python3 my_spi2xspice.py sky130_fd_sc_hd__tt_025C_1v80.lib brownout_dig.spice brownout_dig.out.spice`

OUTPUT (xspice): `brownout_dig.out.spice`
