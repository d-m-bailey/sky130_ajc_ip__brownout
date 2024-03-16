To generate xspice subckt from extracted Magic spice file, run the following command:

`python3 my_spi2xspice.py sky130_fd_sc_hd__tt_025C_1v80.lib brownout_dig.spice brownout_dig.out.spice`


NOTE:
Assumes brownout_dig.spice is the extracted netlist from Magic after a brownout_dig.v is routed by openlane
Output (xspice): `brownout_dig.out.spice`
