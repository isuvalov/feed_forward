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
add wave -noupdate /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate /tb/modem_rx_top_inst/samplei_delay
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/error
add wave -noupdate /tb/error
add wave -noupdate /tb/testlfsr_i/error
add wave -noupdate -format Analog-Step -height 100 -max 299999.99999999994 -min -300000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/itertive_demod_inst/init_phase(19) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(18) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(17) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(16) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(15) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(14) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(13) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(12) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(11) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(10) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(9) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(8) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(7) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(6) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(5) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(4) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(3) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(2) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(1) {-radix decimal} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase(0) {-radix decimal}} /tb/modem_rx_top_inst/itertive_demod_inst/init_phase
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/after_pilot_start
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/i_samplesi
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/i_samplesq
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/i_init_phasei
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/i_init_phaseq
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/o_samples_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/out_ce
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/init_phase2
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/init_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/init_add_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_add_phase
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_phase_ok
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/sample_init_ok
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
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_demod
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_new_pi
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_delta_short
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_int0
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/phase_demod_acum_start
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
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/whole_dcnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1289102869 ps} 0}
configure wave -namecolwidth 356
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
WaveRestoreZoom {0 ps} {1583236200 ps}
