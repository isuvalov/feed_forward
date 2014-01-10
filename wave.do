onerror {resume}
quietly WaveActivateNextPane {} 0
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
add wave -noupdate /tb/modem_rx_top_inst/sampleI_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/sampleQ_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/sampleI_norm
add wave -noupdate /tb/modem_rx_top_inst/sampleQ_norm
add wave -noupdate /tb/modem_rx_top_inst/sampleI_delay
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_valid
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot(15)
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot(15)
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesQ(15)
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesI(15)
add wave -noupdate -format Analog-Step -height 50 -max 27733.0 -min -27733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesQ
add wave -noupdate -format Analog-Step -height 50 -max 27733.0 -min -27733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesI
add wave -noupdate -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ
add wave -noupdate -color Blue -itemcolor Blue /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -color Blue -itemcolor Blue -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_Q
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
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(15)
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ(15)
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot(15)
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot(15)
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_s_pilotI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wind_cnt
add wave -noupdate -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotII
add wave -noupdate -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotII
add wave -noupdate -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotQQ
add wave -noupdate -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotIQ
add wave -noupdate -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotQI
add wave -noupdate -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotQQ
add wave -noupdate -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotIQ
add wave -noupdate -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotQI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2I_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2Q_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_II
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_QQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_IQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_QI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_Q
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
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQ
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmskQ
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmskI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_s_pilotI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotIn
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQn
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_conj
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_II
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_IQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/WAIT_FREQ_FIN_need
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose2
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
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_W
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_I
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
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/memQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/mem2Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_Q
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
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotII
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotQQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotIQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotQI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2I_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2Q_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_II
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_QQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_IQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_QI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_Q
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
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_s_pilotI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotIn
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQn
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_prev
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_conj
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_II
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_IQ
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QI
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/WAIT_FREQ_FIN_need
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_uns
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose2
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose2
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
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_W
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_Q
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_I
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {227068000 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {0 ps} {1015471800 ps}
