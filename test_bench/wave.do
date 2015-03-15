onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group dds /tb/dds_I_inst/clk_i
add wave -noupdate -group dds /tb/dds_I_inst/rst_i
add wave -noupdate -group dds -radix decimal /tb/dds_I_inst/ftw_i
add wave -noupdate -group dds /tb/dds_I_inst/phase_i
add wave -noupdate -group dds /tb/dds_I_inst/phase_o
add wave -noupdate -group dds /tb/dds_I_inst/ampl_o
add wave -noupdate -group dds -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/dds_I_inst/ampl_o
add wave -noupdate -group dds /tb/dds_I_inst/ftw_accu
add wave -noupdate -group dds /tb/dds_I_inst/ftw_accu_w1
add wave -noupdate -group dds /tb/dds_I_inst/phase_w3
add wave -noupdate -group dds /tb/dds_I_inst/phase_w2
add wave -noupdate -group dds /tb/dds_I_inst/phase_w1
add wave -noupdate -group dds /tb/dds_I_inst/phase
add wave -noupdate -group dds /tb/dds_I_inst/lut_in
add wave -noupdate -group dds /tb/dds_I_inst/lut_out
add wave -noupdate -group dds /tb/dds_I_inst/lut_out_delay
add wave -noupdate -group dds /tb/dds_I_inst/lut_out_inv_delay
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_2_or_4
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_2_or_4_w1
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_2_or_4_w2
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_3_or_4
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_3_or_4_delay
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_3_or_4_2delay
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_3_or_4_2delay_w1
add wave -noupdate -group dds /tb/dds_I_inst/quadrant_3_or_4_2delay_w2
add wave -noupdate -group dds /tb/dds_I_inst/ram_value
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/clk
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/reset
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/i_ce
add wave -noupdate -group calc_freq -radix decimal /tb/calc_freq_of_sin_i/i_sampleI(15)
add wave -noupdate -group calc_freq -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal -childformat {{/tb/calc_freq_of_sin_i/i_sampleI(15) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(14) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(13) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(12) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(11) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(10) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(9) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(8) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(7) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(6) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(5) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(4) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(3) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(2) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(1) -radix decimal} {/tb/calc_freq_of_sin_i/i_sampleI(0) -radix decimal}} -subitemconfig {/tb/calc_freq_of_sin_i/i_sampleI(15) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(14) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(13) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(12) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(11) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(10) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(9) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(8) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(7) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(6) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(5) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(4) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(3) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(2) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(1) {-height 15 -radix decimal} /tb/calc_freq_of_sin_i/i_sampleI(0) {-height 15 -radix decimal}} /tb/calc_freq_of_sin_i/i_sampleI
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/i_sampleI
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/i_sampleQ
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/o_freq_ce
add wave -noupdate -group calc_freq -radix decimal /tb/calc_freq_of_sin_i/o_freq
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/sign
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/sign_1w
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/f_ce
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/sampleI_filt
add wave -noupdate -group calc_freq -radix unsigned /tb/calc_freq_of_sin_i/periods_cnt
add wave -noupdate -group calc_freq -radix unsigned /tb/calc_freq_of_sin_i/width_cnt
add wave -noupdate -group calc_freq -radix unsigned /tb/calc_freq_of_sin_i/width_cnt_reg_shift
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/s_freq_ce
add wave -noupdate -group calc_freq -radix unsigned /tb/calc_freq_of_sin_i/s_freq
add wave -noupdate -group calc_freq /tb/calc_freq_of_sin_i/phase_for_dds_ce
add wave -noupdate -group calc_freq -radix decimal /tb/calc_freq_of_sin_i/phase_for_dds
add wave -noupdate -group calc_freq -radix decimal /tb/calc_freq_of_sin_i/phase_for_dds_test
add wave -noupdate -group calc_freq -radix decimal /tb/calc_freq_of_sin_i/measure_phase_for_dds
add wave -noupdate -group calc_freq -radix unsigned /tb/calc_freq_of_sin_i/width_cnt_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8641460262 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 310
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
WaveRestoreZoom {8410710413 ps} {10083646821 ps}
