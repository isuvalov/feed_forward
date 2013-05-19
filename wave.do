onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_value
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_ce
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt_reg
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/corri_o
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/corrq_o
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt2
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -format Analog-Step -height 70 -max 16000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
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
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/clk
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/reset
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/pilot_valid
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/samplei_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/sampleq_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/o_interp_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/o_interp_ce_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/o_interp_ce_w2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/sm_qam_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/cnt_interp
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/cnt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/mod_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/mod_samplesq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/bits
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/s_samplei_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/s_sampleq_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/cnt_delay
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_upper_inst/cnt_pilot
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {732479938 ps} 0}
configure wave -namecolwidth 356
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
WaveRestoreZoom {704778637 ps} {760206733 ps}
