onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/pilot_ce_test
add wave -noupdate /tb/pilot_ce_test_1w
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_ce
add wave -noupdate /tb/pilot_start
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_value
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_ce
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt
add wave -noupdate /tb/modem_rx_top_inst/bit_value_rx
add wave -noupdate /tb/modem_rx_top_inst/bit_value_rx_ce
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt_reg
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/samplei_to_demod
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleq_to_demod
add wave -noupdate /tb/modem_rx_top_inst/start_rotate_ce_1w
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/print_event
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/samplei_moveback
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/sampleq_moveback(15) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(14) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(13) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(12) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(11) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(10) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(9) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(8) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(7) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(6) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(5) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(4) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(3) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(2) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(1) {-radix decimal} /tb/modem_rx_top_inst/sampleq_moveback(0) {-radix decimal}} /tb/modem_rx_top_inst/sampleq_moveback
add wave -noupdate /tb/modem_rx_top_inst/pilot_valid_2w
add wave -noupdate -radix decimal /tb/samplei_tx
add wave -noupdate -radix decimal /tb/sampleq_tx
add wave -noupdate /tb/pilot_ce_test
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/corri_o
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/corrq_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
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
add wave -noupdate /tb/modem_rx_top_inst/delayer_de/p_rd
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/start_delayer_cnt
add wave -noupdate /tb/modem_rx_top_inst/start_pilotu
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/delayer_de/p_wr
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/clk
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/reset
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/ce
add wave -noupdate -format Analog-Step -height 80 -max 9000.0 -min -9000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/ai
add wave -noupdate -format Analog-Step -height 80 -max 9000.0 -min -9000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aq
add wave -noupdate -format Analog-Step -height 40 -max 9000.0 -min -9000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/bi(15) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(14) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(13) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(12) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(11) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(10) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(9) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(8) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(7) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(6) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(5) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(4) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(3) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(2) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(1) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/bi(0) {-radix unsigned}} /tb/modem_rx_top_inst/scalar_mult_inst/bi
add wave -noupdate -format Analog-Step -height 40 -max 9000.0 -min -9000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/bq
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/sum_ce
add wave -noupdate -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(31) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(30) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(29) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(28) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(27) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(26) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(25) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(24) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(23) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(22) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(21) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(20) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(19) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(18) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(17) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(16) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(15) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(14) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(13) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(12) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(11) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(10) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(9) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(8) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(7) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(6) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(5) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(4) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(3) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(2) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(1) {-radix unsigned} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(0) {-radix unsigned}} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/scalar_mult_inst/sumq_o
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
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/clk
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/reset
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/realpilot_event
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/start_pilotu
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/sync_find
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/start_pilotu_have
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/s_start_pilotu
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/start_delayer_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/stm
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev_a
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_best
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev
add wave -noupdate -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilotsync_inst/main_cnt(13) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(12) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(11) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(10) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(9) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(8) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(7) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(6) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(5) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(4) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(3) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(2) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(1) {-radix unsigned} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilotsync_inst/main_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev_sum
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/s_sync_find
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/one_p
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotu_have
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotu
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/g_start_delayer_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu_have
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/m_start_delayer_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/m_realpilot_event
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/good_come
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/start_rotate_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/start_rotate_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/start_rotate_q
add wave -noupdate /tb/modem_rx_top_inst/pilot_valid
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/cnt
add wave -noupdate /tb/modem_rx_top_inst/down_ce
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/clk
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_ce
add wave -noupdate -format Analog-Step -height 50 -max 500.0 -min -500.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(9) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(8) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(7) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(6) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(5) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(4) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(3) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(2) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(1) {-radix decimal} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase(0) {-radix decimal}} /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/bit_value
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/out_ce
add wave -noupdate /tb/modem_tx_top_i/bits_gen
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/after_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/i_ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/start_rotate_i(15) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(14) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(13) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(12) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(11) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(10) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(9) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(8) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(7) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(6) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(5) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(4) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(3) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(2) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(1) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(0) {-radix decimal}} /tb/modem_rx_top_inst/start_rotate_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/start_rotate_q
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/start_rotate_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/samplei_moveback
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleq_moveback
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_val_filt_mult(36) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(35) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(34) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(33) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(32) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(31) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(30) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(29) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(28) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(27) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(26) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(25) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(24) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(23) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(22) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(21) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(20) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(19) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(18) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(17) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(16) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(15) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(14) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(13) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(12) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(11) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(10) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(9) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(8) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(7) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(6) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(5) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(4) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(3) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(2) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(1) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt_mult(0) {-radix decimal}} /tb/modem_rx_top_inst/freq_val_filt_mult
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/start_rotate_i(15) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(14) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(13) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(12) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(11) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(10) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(9) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(8) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(7) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(6) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(5) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(4) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(3) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(2) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(1) {-radix decimal} /tb/modem_rx_top_inst/start_rotate_i(0) {-radix decimal}} /tb/modem_rx_top_inst/start_rotate_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/start_rotate_q
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_init_phasei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_init_phaseq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/init_phase
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/init_phase_mul
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/d_i_ce
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/error
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/clk
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/reset
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/rd_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/bits_i
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/pilot_ce
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/samplei_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/sampleq_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/cnt_interp
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/o_interp_ce
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/o_interp_ce_w2
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/sm_qam_ce
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/bits
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/lfsr_reg
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/bits_cnt
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/mod_samplesi
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/mod_samplesq
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/cnt
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/cnt_1w
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/qw_rd_1w
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/qw_rd
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_mux
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/s_samplei_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/s_sampleq_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/m_samplei_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/m_sampleq_o
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/adc_array_im
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/adc_array_re
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_mem_i
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_mem_q
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/first_read
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/s_pilot_ce
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/s_pilot_ce_1w
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/s_pilot_ce_2w
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/s_pilot_ce_a
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/o_interp_ce_w1
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/duplicate_iq
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/delay_cnt
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/stm
add wave -noupdate /tb/modem_tx_top_i/bits_gen
add wave -noupdate /tb/testlfsr_i/error
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/ai(15) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(14) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(13) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(12) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(11) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(10) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(9) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(8) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(7) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(6) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(5) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(4) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(3) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(2) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(1) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/ai(0) {-radix decimal}} /tb/modem_rx_top_inst/scalar_mult_inst/ai
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/bi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/bq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/sum_ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(31) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(30) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(29) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(28) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(27) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(26) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(25) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(24) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/sumq_o
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(31) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(30) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(29) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(28) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(27) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(26) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(25) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(24) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(23) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(22) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(21) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(20) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(19) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(18) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(17) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(16) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(15) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(14) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(13) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(12) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(11) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(10) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(9) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(8) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(7) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(6) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(5) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(4) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(3) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(2) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(1) {-radix decimal} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi(0) {-radix decimal}} /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/sum_regq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/mul_regi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/mul_regq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aibi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aqbq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aibq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aqbi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aibi_m_aqbq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aibq_p_aqbi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aibi_p_aqbq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aqbi_m_aibq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w1
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w2
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w3
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w4
add wave -noupdate /tb/testlfsr_i/clk
add wave -noupdate /tb/testlfsr_i/ce
add wave -noupdate /tb/testlfsr_i/lfsr_mask
add wave -noupdate /tb/testlfsr_i/datain
add wave -noupdate /tb/testlfsr_i/error
add wave -noupdate /tb/testlfsr_i/shift_rg
add wave -noupdate /tb/testlfsr_i/s_shift_rgm
add wave -noupdate /tb/modem_tx_top_i/clk
add wave -noupdate /tb/modem_tx_top_i/reset
add wave -noupdate /tb/modem_tx_top_i/pilot_ce_test
add wave -noupdate /tb/modem_tx_top_i/samplei_tx_o
add wave -noupdate /tb/modem_tx_top_i/sampleq_tx_o
add wave -noupdate /tb/modem_tx_top_i/samplei_tx
add wave -noupdate /tb/modem_tx_top_i/sampleq_tx
add wave -noupdate /tb/modem_tx_top_i/bits_gen2
add wave -noupdate /tb/modem_tx_top_i/rd_req
add wave -noupdate /tb/modem_tx_top_i/pos_cnt
add wave -noupdate /tb/modem_tx_top_i/bits_gen
add wave -noupdate /tb/modem_tx_top_i/usedw
add wave -noupdate /tb/modem_tx_top_i/gen_ce
add wave -noupdate /tb/modem_tx_top_i/gen_ce_1w
add wave -noupdate /tb/modem_tx_top_i/testlfsr_i/error
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1780970657 ps} 0}
configure wave -namecolwidth 466
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
WaveRestoreZoom {1780845412 ps} {1781470826 ps}
