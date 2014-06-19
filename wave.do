onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate /tb/testLFSR_i/datain
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
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_valid
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesQ(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesI(15)
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 27733.0 -min -27733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesQ
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 27733.0 -min -27733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesI
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ
add wave -noupdate -group freq_estimator -color Blue -itemcolor Blue /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -group freq_estimator -color Blue -itemcolor Blue -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/start_calc
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wr_st_was
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ(15)
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot(15)
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot(15)
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_s_pilotI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sampleQ_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wind_cnt
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotII
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotII
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotQQ
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotIQ
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotQI
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotQQ
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotIQ
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotQI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2I_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2Q_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_II
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_QQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_IQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_QI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w4
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQ
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmskQ
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmskI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_s_pilotI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotIn
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQn
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_conj
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_II
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_IQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/WAIT_FREQ_FIN_need
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pi_div_2_val
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/need_pi2_sub
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_sign
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_W
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/sampleI_norm
add wave -noupdate -group freq_estimator /tb/sampleI_tx
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/sampleQ_norm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/sampleI_delay
add wave -noupdate -group freq_estimator -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -group freq_estimator -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate -group freq_estimator /tb/error
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesQ_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/start_calc
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wr_st_was
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc_to_angle
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt_calc
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wind_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotII
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotQQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotIQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotQI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskI_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskQ_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2I_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2Q_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_II
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_QQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_IQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_QI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/l_calc_w4
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_s_pilotI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotIn
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotQn
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_I_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_Q_mul_conj
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_II
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_IQ
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_QI
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/WAIT_FREQ_FIN_need
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divB
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_I_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_Q_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pi_div_2_val
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/need_pi2_sub
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_sign
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_done2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_W
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_Q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/PILOT_I
add wave -noupdate /tb/error
add wave -noupdate /tb/testLFSR_i/error
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_seq
add wave -noupdate /tb/modem_rx_top_inst/start_rotate_ce
add wave -noupdate /tb/modem_rx_top_inst/start_rotate_ce_W
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/clk
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/reset
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce
add wave -noupdate -group scalar_mult -format Analog-Backstep -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aI
add wave -noupdate -group scalar_mult -format Analog-Backstep -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/bI
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/bQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sum_ce
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sumI_o
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sumQ_o
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sum_regI
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sum_regQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/mul_regI
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/mul_regQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aIbI
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aQbQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aIbQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aQbI
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aIbI_m_aQbQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aIbQ_p_aQbI
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aIbI_p_aQbQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aQbI_m_aIbQ
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w1
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w2
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w3
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w4
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/clk
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/reset
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/realpilot_event
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/start_pilotU
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/sync_find
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/start_pilotU_have
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/s_start_pilotU
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/start_delayer_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/stm
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev_a
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_best
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/main_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/main_cnt_prev_sum
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/s_sync_find
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/one_p
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotU_have
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotU
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/g_start_delayer_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotU_have_1w
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotU_have
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotU
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_delayer_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_realpilot_event
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/good_come
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/clk
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/ce
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/LFSR_Mask
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/datain
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/error
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/shift_rg
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testLFSR_i/s_shift_rgM
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/clk
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/reset
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/after_pilot_start
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_ce
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_init_phaseI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_init_phaseQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/out_ce
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_1w
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotI
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_re
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_im
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_imE
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ce_1w
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ce_table
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ce_acum
add wave -noupdate -expand -group complex_mult_ii /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/clk
add wave -noupdate -expand -group complex_mult_ii /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/i_ce
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/A_I
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/B_Q
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/C_I
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/D_Q
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/o_I
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/o_Q
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/out_ce
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/A_I_1w
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/B_Q_1w
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/A_I_2w
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/B_Q_2w
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/AC
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/AD
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/BC
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/BD
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/ACmBD
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/ADpBC
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/ACpBD
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/BCmAD
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/ce_1w
add wave -noupdate -expand -group complex_mult_ii -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/complex_mult_q_ii/ce_2w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2062476000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 283
configure wave -valuecolwidth 94
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
WaveRestoreZoom {2024460826 ps} {2141182575 ps}
