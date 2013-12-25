add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/clk
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_ce
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/bit_value
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/out_ce
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/test
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt
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
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/samplei_pilot
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleq_pilot
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_valid
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_estimator_inst/o_freq(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/start_calc
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr_st_was
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wind_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotii
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotqq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotiq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotqi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2i_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2q_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_ii
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_qq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_iq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_qi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w4
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_piloti
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmskq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmski
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_s_piloti
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotin
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotqn
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_conj
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_ii
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_iq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wait_freq_fin_need
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pi_div_2_val
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/need_pi2_sub
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_sign
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_i
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/clk
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_ce
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/i_phase
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/bit_value
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/out_ce
add wave -noupdate /tb/modem_rx_top_inst/pam_demod_by_phase_i/test
add wave -noupdate /tb/error
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/start_calc
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr_st_was
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wind_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotii
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotqq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotiq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotqi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2i_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2q_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_ii
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_qq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_iq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_qi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w4
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_piloti
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_s_piloti
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotin
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotqn
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_conj
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_ii
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_iq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qi
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wait_freq_fin_need
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pi_div_2_val
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/need_pi2_sub
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_sign
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_done2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_i
