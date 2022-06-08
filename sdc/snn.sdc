###############################################################################
# Created by write_sdc
# Wed Jun  8 12:59:01 2022
###############################################################################
current_design snn
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {in1[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {reset}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[8]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_oeb[9]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spike_out[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {spike_out[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {state1[7]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {io_oeb[9]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[8]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[7]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[6]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[5]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[4]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[3]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[2]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[1]}]
set_load -pin_load 0.0334 [get_ports {io_oeb[0]}]
set_load -pin_load 0.0334 [get_ports {spike_out[1]}]
set_load -pin_load 0.0334 [get_ports {spike_out[0]}]
set_load -pin_load 0.0334 [get_ports {state1[7]}]
set_load -pin_load 0.0334 [get_ports {state1[6]}]
set_load -pin_load 0.0334 [get_ports {state1[5]}]
set_load -pin_load 0.0334 [get_ports {state1[4]}]
set_load -pin_load 0.0334 [get_ports {state1[3]}]
set_load -pin_load 0.0334 [get_ports {state1[2]}]
set_load -pin_load 0.0334 [get_ports {state1[1]}]
set_load -pin_load 0.0334 [get_ports {state1[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {reset}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {in1[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 5.0000 [current_design]
