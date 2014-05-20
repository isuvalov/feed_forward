onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/cordic_wrapper_i/clk
add wave -noupdate /tb/cordic_wrapper_i/i_ce
add wave -noupdate -radix decimal /tb/cordic_wrapper_i/i_samplesi
add wave -noupdate -radix decimal /tb/cordic_wrapper_i/i_samplesq
add wave -noupdate /tb/cordic_wrapper_i/xx
add wave -noupdate /tb/cordic_wrapper_i/yy
add wave -noupdate /tb/cordic_wrapper_i/xx2
add wave -noupdate /tb/cordic_wrapper_i/yy2
add wave -noupdate /tb/cordic_wrapper_i/theta_o
add wave -noupdate /tb/cordic_wrapper_i/theta_o_p2
add wave -noupdate /tb/cordic_wrapper_i/theta_o_p1
add wave -noupdate /tb/cordic_wrapper_i/theta
add wave -noupdate /tb/cordic_wrapper_i/sign_a
add wave -noupdate /tb/cordic_wrapper_i/plus_half_pi
add wave -noupdate -radix decimal /tb/cordic_wrapper_i/phase
add wave -noupdate /tb/fromtextfile_i/clk
add wave -noupdate /tb/fromtextfile_i/ce
add wave -noupdate -radix decimal /tb/fromtextfile_i/datafromfile
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {300284 ps} 0}
configure wave -namecolwidth 227
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {7530577 ps} {8028917 ps}
