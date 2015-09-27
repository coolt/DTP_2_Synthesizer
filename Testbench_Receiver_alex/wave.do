onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_top_level/t_clk
add wave -noupdate /testbench_top_level/t_reset_n
add wave -noupdate /testbench_top_level/t_dataIn
add wave -noupdate /testbench_top_level/dut/schiebe
add wave -noupdate -radix binary /testbench_top_level/dut/po_Data
add wave -noupdate -radix binary /testbench_top_level/dut/bcd1
add wave -noupdate -radix binary /testbench_top_level/dut/bcd2
add wave -noupdate -radix binary /testbench_top_level/dut/bcd3
add wave -noupdate -radix binary /testbench_top_level/dut/bcd4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 113
configure wave -valuecolwidth 116
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {125 ns}
