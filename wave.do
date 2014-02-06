onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate /tb/testlfsr_i/datain
add wave -noupdate /tb/error
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate /tb/modem_rx_top_inst/samplei_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/sampleq_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/samplei_norm
add wave -noupdate /tb/samplei_tx
add wave -noupdate /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate /tb/modem_rx_top_inst/samplei_delay
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/error
add wave -noupdate /tb/error
add wave -noupdate /tb/testlfsr_i/error
add wave -noupdate -format Analog-Step -height 100 -max 599999.99999999988 -min -600000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/itertive_demod_inst/init_phase(19) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(18) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(17) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(16) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(15) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(14) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(13) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(12) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(11) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(10) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(9) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(8) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(7) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(6) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(5) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(4) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(3) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(2) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(1) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(0) {-radix decimal}} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/saveit
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/saveit2
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/saveit3
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/saveit2_1w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/saveit_1w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/after_pilot_start
add wave -noupdate -format Analog-Step -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_samplesq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_init_phasei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_init_phaseq
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/o_samples_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/out_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/init_phase2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/init_phase
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/sample_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/init_add_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_add_phase
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/sample_phase_ok
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/sample_init_ok
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_phase_reg
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/samples_phase_mul
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/init_phase_mul
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_phase_short
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acummod
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phi_error
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/val_engle_reg
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/val_engle
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/filt_acum
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_delta_round
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_delta
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_new
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_demod
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_new_pi
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_delta_short
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_int0
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_start
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_p_err
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_p_err_1w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_p_erre
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_start_shift
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_start_div_mod
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_add_phase_a
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/init_add_phase_a
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/new_after_pilot_start_a
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/new_after_pilot_start_2w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/new_after_pilot_start_1w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/new_after_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/ce_correct
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/cccc
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/samplesi_reg
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/samplesq_reg
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/d_ce_correct_perr
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/i_ce
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/ce_1w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/ce_2w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/ce_3w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/d_i_ce
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/d_ce_1w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/d_ce_2w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/d_ce_3w
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/after_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/test_it
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/test_sample_cnt
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/s_phase_demod_acum_new_pi
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/dcnt
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/down_ce
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/after_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/whole_dcnt
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_seq
add wave -noupdate -format Analog-Step -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/i_samplesq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce
add wave -noupdate -format Analog-Backstep -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/ai
add wave -noupdate -format Analog-Backstep -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/bi
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/bq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/sum_ce
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/sumq_o
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/sum_regq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/mul_regi
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/mul_regq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aibi
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aqbq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aibq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aqbi
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aibi_m_aqbq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aibq_p_aqbi
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aibi_p_aqbq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/aqbi_m_aibq
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w1
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w2
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w3
add wave -noupdate /tb/modem_rx_top_inst/scalar_mult_inst/ce_w4
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_seq
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/realpilot_event
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/start_pilotu
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/sync_find
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/start_pilotu_have
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/s_start_pilotu
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/start_delayer_cnt
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/stm
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev_a
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_best
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/main_cnt
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev_sum
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/s_sync_find
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/one_p
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotu_have
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotu
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/g_start_delayer_cnt
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu_have_1w
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu_have
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/m_start_delayer_cnt
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/m_realpilot_event
add wave -noupdate /tb/modem_rx_top_inst/pilotsync_inst/good_come
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {819052341 ps} 0}
configure wave -namecolwidth 425
configure wave -valuecolwidth 94
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
WaveRestoreZoom {334314650 ps} {2087667650 ps}
