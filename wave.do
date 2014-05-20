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
add wave -noupdate /tb/modem_rx_top_inst/sampleI_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/sampleQ_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/clk
<<<<<<< HEAD
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
=======
add wave -noupdate /tb/modem_rx_top_inst/samplei_norm
add wave -noupdate /tb/samplei_tx
add wave -noupdate /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate /tb/modem_rx_top_inst/samplei_delay
>>>>>>> 4f8d220602d6e2e70f91851e4dfcb9e8615f22f5
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate /tb/error
<<<<<<< HEAD
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
=======
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
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/table_phaseerrors_inst/input_angles
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/table_phaseerrors_inst/phase_acum_mod
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/table_phaseerrors_inst/phi_error
add wave -noupdate /tb/modem_rx_top_inst/itertive_demod_inst/table_phaseerrors_inst/test_pos
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/itertive_demod_inst/table_phaseerrors_inst/val_engle
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {723324000 ps} 0}
configure wave -namecolwidth 478
>>>>>>> 4f8d220602d6e2e70f91851e4dfcb9e8615f22f5
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
<<<<<<< HEAD
WaveRestoreZoom {0 ps} {1015471800 ps}
=======
WaveRestoreZoom {703044010 ps} {1246083235 ps}
>>>>>>> 4f8d220602d6e2e70f91851e4dfcb9e8615f22f5
