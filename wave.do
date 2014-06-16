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
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/samplei_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_valid
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleq_pilot
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/samplei_pilot(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleq_pilot(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesq(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesi(15)
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 27733.0 -min -27733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesq
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 27733.0 -min -27733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/test_samplesi
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
add wave -noupdate -group freq_estimator -color Blue -itemcolor Blue /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -group freq_estimator -color Blue -itemcolor Blue -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_q
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
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi(15)
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq(15)
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/samplei_pilot(15)
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sampleq_pilot(15)
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_s_piloti
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/samplei_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sampleq_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wind_cnt
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotii
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotii
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotqq
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotiq
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 37733.0 -min -37733.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotqi
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotqq
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotiq
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 216217000.0 -min -216217000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotqi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2i_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2q_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_ii
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_qq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_iq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_qi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_q
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
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_piloti
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotq
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmskq
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/analog_pilotmski
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_s_piloti
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotin
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotqn
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_conj
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_ii
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_iq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wait_freq_fin_need
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
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
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/samplei_norm
add wave -noupdate -group freq_estimator /tb/samplei_tx
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/samplei_delay
add wave -noupdate -group freq_estimator -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -group freq_estimator -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
add wave -noupdate -group freq_estimator /tb/error
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_ce
add wave -noupdate -group freq_estimator -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/memq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/mem2q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/samples_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_wr
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/p_rd2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/from_m2_q
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
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotii
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotqq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotiq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotqi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2i_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilotmsk2q_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_ii
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_qq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_iq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_qi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/t_ml_q
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
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/acum_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_piloti
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_s_piloti
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/b_sc_pilotq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_pilotin
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sc_pilotqn
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/div_tab
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_sm_floor
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_i_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_prev
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_q_mul_conj
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/first_l_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angle_pilot_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/s_rx_p_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_ii
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_iq
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_qi
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smoofangels_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/wait_freq_fin_need
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/rdy_phase
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/sum_mult_preangle
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
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
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/calc_angle_ce_w
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/smp_cnt
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_q
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_i
add wave -noupdate /tb/error
add wave -noupdate /tb/testlfsr_i/error
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_tx_top_i/wrapper_tx_stream_i/test_seq
add wave -noupdate /tb/modem_rx_top_inst/start_rotate_ce
add wave -noupdate /tb/modem_rx_top_inst/start_rotate_ce_w
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/clk
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/reset
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce
add wave -noupdate -group scalar_mult -format Analog-Backstep -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/ai
add wave -noupdate -group scalar_mult -format Analog-Backstep -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/scalar_mult_inst/aq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/bi
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/bq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sum_ce
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sumi_o
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sumq_o
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sum_regi
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/sum_regq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/mul_regi
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/mul_regq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aibi
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aqbq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aibq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aqbi
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aibi_m_aqbq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aibq_p_aqbi
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aibi_p_aqbq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/aqbi_m_aibq
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w1
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w2
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w3
add wave -noupdate -group scalar_mult /tb/modem_rx_top_inst/scalar_mult_inst/ce_w4
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/clk
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/reset
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/realpilot_event
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/start_pilotu
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/sync_find
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/start_pilotu_have
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/s_start_pilotu
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
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotu_have
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/g_start_pilotu
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/g_start_delayer_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu_have_1w
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu_have
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_pilotu
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_start_delayer_cnt
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/m_realpilot_event
add wave -noupdate -group pilotsync /tb/modem_rx_top_inst/pilotsync_inst/good_come
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testlfsr_i/clk
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testlfsr_i/ce
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testlfsr_i/lfsr_mask
add wave -noupdate -expand -group lfsr -radix hexadecimal -subitemconfig {/tb/testlfsr_i/datain(1) {-radix hexadecimal} /tb/testlfsr_i/datain(0) {-radix hexadecimal}} /tb/testlfsr_i/datain
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testlfsr_i/error
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testlfsr_i/shift_rg
add wave -noupdate -expand -group lfsr -radix hexadecimal /tb/testlfsr_i/s_shift_rgm
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/clk
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/reset
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/after_pilot_start
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_ce
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesi
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesq
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_init_phasei
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_init_phaseq
add wave -noupdate -expand -group iterative_demod -radix decimal -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(15) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(14) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(13) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(12) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(11) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(10) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(9) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(8) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(7) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(6) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(5) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(4) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(3) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(2) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(1) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi(0) {-radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesi
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesq
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/out_ce
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_1w
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_1w
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im
add wave -noupdate -expand -group iterative_demod -radix decimal -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(15) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(14) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(13) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(12) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(11) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(10) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(9) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(8) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(7) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(6) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(5) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(4) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(3) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(2) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(1) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti(0) {-radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/sample_roti
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/sample_rotq
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_re
add wave -noupdate -expand -group iterative_demod -radix decimal -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/table_im(7) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(6) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(5) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(4) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(3) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(2) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(1) {-radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im(0) {-radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/table_im
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_ree
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_ime
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ce_1w
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ce_table
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ce_acum
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1256796194 ps} 0}
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
WaveRestoreZoom {1256727487 ps} {1257007350 ps}
