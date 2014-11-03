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
add wave -noupdate -height 50 -radix decimal /tb/modem_rx_top_inst/sampleI
add wave -noupdate -format Analog-Step -height 74 -max 999.99999999999989 -min -1000.0 -radix decimal /tb/modem_rx_top_inst/sampleQ
add wave -noupdate -format Analog-Step -height 50 -max 1000.0 -min -1000.0 -radix decimal /tb/modem_rx_top_inst/sampleI_zero
add wave -noupdate -format Analog-Step -height 50 -max 10000.0 -min -10000.0 -radix decimal /tb/modem_rx_top_inst/sampleIfilt2
add wave -noupdate -format Analog-Step -height 50 -max 10000.0 -min -10000.0 -radix decimal /tb/modem_rx_top_inst/sampleI_delay
add wave -noupdate -format Analog-Step -height 50 -max 10000.0 -min -10000.0 -radix decimal /tb/modem_rx_top_inst/sampleI_delay_fe
add wave -noupdate -format Analog-Step -height 50 -max 10000.0 -min -10000.0 -radix decimal /tb/modem_rx_top_inst/sampleI_delay_fe_reg
add wave -noupdate -format Analog-Step -height 50 -max 10000.0 -min -10000.0 -radix decimal -childformat {{/tb/modem_rx_top_inst/sampleI_moveback(15) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(14) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(13) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(12) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(11) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(10) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(9) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(8) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(7) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(6) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(5) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(4) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(3) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(2) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(1) -radix decimal} {/tb/modem_rx_top_inst/sampleI_moveback(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/sampleI_moveback(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/sampleI_moveback(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/sampleI_moveback
add wave -noupdate /tb/modem_rx_top_inst/sampleI_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/sampleQ_norm_1w
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/sampleI_norm
add wave -noupdate /tb/modem_rx_top_inst/sampleQ_norm
add wave -noupdate /tb/modem_rx_top_inst/sampleI_delay
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -color Blue -itemcolor Blue -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/o_freq
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/sampleI_pilot
add wave -noupdate -group freq_estimator /tb/modem_rx_top_inst/freq_estimator_inst/pilot_valid
add wave -noupdate -group freq_estimator -format Analog-Step -height 50 -max 20000.0 -min -20000.0 -radix decimal -childformat {{/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(15) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(14) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(13) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(12) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(11) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(10) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(9) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(8) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(7) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(6) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(5) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(4) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(3) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(2) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(1) -radix decimal} {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesI
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
add wave -noupdate -color Coral -itemcolor Coral /tb/modem_rx_top_inst/sync_find
add wave -noupdate -color Coral -itemcolor Coral -radix unsigned /tb/modem_rx_top_inst/pilotsync_inst/loss_cnt
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
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/clk
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/ce
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/LFSR_Mask
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/datain
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/error
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/shift_rg
add wave -noupdate -group lfsr -radix hexadecimal /tb/testLFSR_i/s_shift_rgM
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/clk
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/reset
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/after_pilot_start
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/i_ce
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_samplesQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_init_phaseI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/i_init_phaseQ
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/o_samplesQ
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/out_ce
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/ce_table
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/after_pilot_start_norm
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/init_phaseI_norm
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/init_phaseQ_norm
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_im_new
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/acum_re_new
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_re
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_im
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/after_pilot_start
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/after_pilot_start_norm
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/i_ce
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/ce_1w
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/ce_acum
add wave -noupdate -expand -group iterative_demod -format Analog-Step -height 70 -max 17000.0 -min -17000.0 -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/norm_samplesI
add wave -noupdate -expand -group iterative_demod -format Analog-Step -height 70 -max 17000.0 -min -17000.0 -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/norm_samplesQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/norm_samplesI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/norm_samplesQ
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/del_samplesQ
add wave -noupdate -expand -group iterative_demod /tb/modem_rx_top_inst/average_itertive_demod_i/ce_first_rot
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotQ
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotI_round
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/ssample_rotQ_round
add wave -noupdate -expand -group iterative_demod -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/table_reE
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_imE
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_re2E
add wave -noupdate -expand -group iterative_demod -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_im2E
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/clk
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/reset
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/i_ce
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/i_samplesI
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/i_samplesQ
add wave -noupdate -group abs_normalizer -format Analog-Step -height 50 -max 5000.0 -min -5000.0 -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/i_samplesI
add wave -noupdate -group abs_normalizer -format Analog-Step -height 50 -max 30000.0 -min -30000.0 -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesI
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_norm_samplesQ
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_samplesI
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/o_samplesQ
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/out_ce
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/delaylineI
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/delaylineQ
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/delay2lineI
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/delay2lineQ
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/iq_sq_root_1w
add wave -noupdate -group abs_normalizer -radix unsigned /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleI_delay
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delay
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesQ
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleI_2delay
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_2delay
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleI_delayE
add wave -noupdate -group abs_normalizer -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(31) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(30) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(29) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(28) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(27) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(26) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(25) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(24) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(23) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(22) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(21) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(20) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(19) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(18) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(17) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(16) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(31) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(30) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(29) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(28) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(27) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(26) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(25) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(24) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_delayE
add wave -noupdate -group abs_normalizer -radix unsigned /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/iq_sq_root_1wE
add wave -noupdate -group abs_normalizer -radix decimal -childformat {{/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(31) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(30) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(29) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(28) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(27) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(26) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(25) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(24) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(23) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(22) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(21) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(20) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(19) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(18) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(17) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(16) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(15) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(14) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(13) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(12) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(11) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(10) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(9) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(8) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(7) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(6) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(5) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(4) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(3) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(2) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(1) -radix decimal} {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(0) -radix decimal}} -subitemconfig {/tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(31) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(30) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(29) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(28) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(27) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(26) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(25) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(24) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesI_sm
add wave -noupdate -group abs_normalizer -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/s_samplesQ_sm
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleI_mult
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sampleQ_mult
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/max_ce
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/done_o
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/maxIQ
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/divisor
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/quotient
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/p_wr
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/p_rd
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/p_2wr
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/p_2rd
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sq_Q
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sq_I
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sq_Q_1w
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/sq_I_1w
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/iq_sq
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/ce_1w
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/ce_2w
add wave -noupdate -group abs_normalizer /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_i/iq_sq_root
add wave -noupdate -group table /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/clk
add wave -noupdate -group table /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/i_ce
add wave -noupdate -group table -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/sample_in_re
add wave -noupdate -group table -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/sample_in_im
add wave -noupdate -group table -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/o_ce
add wave -noupdate -group table -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/o_phase_error_re
add wave -noupdate -group table -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/table_demod_i/o_phase_error_im
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/clk
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/reset
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/i_ce
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/i_samplesI
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/i_samplesQ
add wave -noupdate -group abs_norm_int -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/o_norm_samplesI
add wave -noupdate -group abs_norm_int -radix decimal /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/o_norm_samplesQ
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/o_samplesI
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/o_samplesQ
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/out_ce
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/ce_delay
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/delaylineI
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/delaylineQ
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/delay2lineI
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/delay2lineQ
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleI_delay
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleQ_delay
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleI_delayE
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleQ_delayE
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleI_2delay
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleQ_2delay
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleI_mult
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sampleQ_mult
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/max_ce
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/done_o
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/maxIQ
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/divisor
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/quotient
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/p_wr
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/p_rd
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/p_2wr
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/p_2rd
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sq_Q
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sq_I
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sq_Q_1w
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/sq_I_1w
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/iq_sq
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/ce_1w
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/ce_2w
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/iq_sq_root
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/iq_sq_root_1w
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/s_samplesI
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/s_samplesQ
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/iq_sq_root_1wE
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/s_samplesQ_sm
add wave -noupdate -group abs_norm_int /tb/modem_rx_top_inst/average_itertive_demod_i/abs_normalizer_int/s_samplesI_sm
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/clk
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/reset
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/i_samplesI
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/i_samplesQ
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/out_ce
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/sync_find
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/event
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/sync_event
add wave -noupdate -group sync_ce -radix unsigned /tb/modem_rx_top_inst/find_ce_period_sync_i/sample_sq
add wave -noupdate -group sync_ce -format Analog-Step -height 60 -max 5661860.0 -radix unsigned /tb/modem_rx_top_inst/find_ce_period_sync_i/threshold
add wave -noupdate -group sync_ce /tb/modem_rx_top_inst/find_ce_period_sync_i/sq_mean
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/clk
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/reset
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/ce
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/sample
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/filtered
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/ce_out
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/acum_p
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/acum
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/acum_w1
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/acum0
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/sign_val
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/ce_w3
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/ce_w2
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/ce_w1
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/sample_w1
add wave -noupdate -group sync_ce_thr /tb/modem_rx_top_inst/find_ce_period_sync_i/bih_filter_integrator_sign_i/sample_w2
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/clk
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/reset
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/realpilot_event
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/start_pilotU
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/sync_find
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/pilot_event
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/cnt_timeout
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/stm
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/cnt
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/cntE
add wave -noupdate -expand -group sync2 /tb/modem_rx_top_inst/find_ce_period_sync_i/strob_sync_ver2_i/cntE_mean
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5201682 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 166
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
WaveRestoreZoom {0 ps} {694919400 ps}
