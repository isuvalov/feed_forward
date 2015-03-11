onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/calc_freq_of_sin_i/clk
add wave -noupdate /tb/calc_freq_of_sin_i/reset
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/calc_freq_of_sin_i/i_sampleI
add wave -noupdate /tb/calc_freq_of_sin_i/i_sampleQ
add wave -noupdate /tb/calc_freq_of_sin_i/o_freq_ce
add wave -noupdate -format Analog-Step -height 50 -max 1000.0 -min -1000.0 -radix decimal /tb/calc_freq_of_sin_i/o_freq
add wave -noupdate /tb/calc_freq_of_sin_i/o_freq
add wave -noupdate /tb/calc_freq_of_sin_i/sign
add wave -noupdate /tb/calc_freq_of_sin_i/sign_1w
add wave -noupdate /tb/calc_freq_of_sin_i/f_ce
add wave -noupdate /tb/calc_freq_of_sin_i/width_cnt
add wave -noupdate /tb/calc_freq_of_sin_i/width_cnt_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {840084561 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {757978723 ps} {981382979 ps}
