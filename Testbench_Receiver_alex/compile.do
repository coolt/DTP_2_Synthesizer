# create work library
vlib work

# compile project files
vcom -2002 -explicit -work work ../../source/empfang.vhd
vcom -2002 -explicit -work work ../../source/distribution_controller.vhdl
vcom -2002 -explicit -work work ../../source/bcd_7seg_alex.vhd
vcom -2002 -explicit -work work ../../source/top_level.vhd
vcom -2002 -explicit -work work ../../source/testbench_top_level.vhd

# run the simulation
vsim -t 1ns -lib work work.testbench_top_level
do ../scripts/wave.do
run 3000.0 ns
