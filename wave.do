onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/pilot_ce_test
add wave -noupdate /tb/pilot_ce_test_1w
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_ce
add wave -noupdate -format Analog-Step -height 30 -max 33000.0 -min -33000.0 -radix decimal /tb/shift_dataflow_inst/dds_cos
add wave -noupdate -format Analog-Step -height 30 -max 33000.0 -min -33000.0 -radix decimal /tb/shift_dataflow_inst/dds_sin
add wave -noupdate /tb/pilot_start
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_value
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -format Analog-Step -height 30 -max 33000.0 -min -33000.0 -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -format Analog-Step -height 30 -max 33000.0 -min -33000.0 -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_ce
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt_reg
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/corri_o
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/corrq_o
add wave -noupdate -height 40 -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -height 40 -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt2
add wave -noupdate -height 50 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -height 70 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/delayer_de/p_rd
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/start_delayer_cnt
add wave -noupdate /tb/modem_rx_top_inst/start_pilotu
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/delayer_de/p_wr
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/clk
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/reset
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/ai
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aq
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/bi(15) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(14) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(13) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(12) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(11) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(10) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(9) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(8) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(7) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(6) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(5) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(4) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(3) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(2) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(1) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(0) {-radix unsigned}} /tb/modem_rx_top_inst/scalar_mult_inst/bi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/bq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/sum_ce
add wave -noupdate -format Analog-Step -height 50 -max 10000000.0 -min -10000000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(31) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(30) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(29) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(28) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(27) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(26) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(25) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(24) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(23) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(22) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(21) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(20) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(19) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(18) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(17) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(16) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(15) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(14) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(13) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(12) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(11) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(10) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(9) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(8) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(7) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(6) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(5) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(4) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(3) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(2) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(1) {-height 15 -radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(0) {-height 15 -radix unsigned}} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o
add wave -noupdate -format Analog-Step -height 50 -max 10000000.0 -min -10000000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/sumq_o
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/sum_regq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/mul_regi
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/mul_regq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aibi
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aqbq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aibq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aqbi
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aibi_m_aqbq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aibq_p_aqbi
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aibi_p_aqbq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/aqbi_m_aibq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/ce_w1
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/ce_w2
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/ce_w3
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/ce_w4
add wave -noupdate -divider {New Divider}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {13292644000 ps} 0}
configure wave -namecolwidth 377
configure wave -valuecolwidth 87
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
WaveRestoreZoom {9246643357 ps} {10039650350 ps}
