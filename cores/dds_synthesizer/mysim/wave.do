onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /dds_synthesizer_tb/dds_synth/clk_i
add wave -noupdate /dds_synthesizer_tb/dds_synth/rst_i
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/ftw_i
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/phase_i
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/phase_o
add wave -noupdate -format Analog-Step -height 100 -max 32000.0 -min -32000.0 -radix decimal /dds_synthesizer_tb/dds_synth/ampl_o
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/ftw_accu
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/phase
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/lut_in
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/lut_out
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/lut_out_delay
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/lut_out_inv_delay
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/quadrant_2_or_4
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/quadrant_3_or_4
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/quadrant_3_or_4_delay
add wave -noupdate -radix decimal /dds_synthesizer_tb/dds_synth/quadrant_3_or_4_2delay
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {24455000 ps} 0}
configure wave -namecolwidth 339
configure wave -valuecolwidth 101
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {210 us}
