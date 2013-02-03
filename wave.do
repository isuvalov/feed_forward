onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb/freq_estimator_inst/clk
add wave -noupdate -radix decimal /tb/freq_estimator_inst/reset
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilot_start
add wave -noupdate -radix decimal /tb/freq_estimator_inst/i_ce
add wave -noupdate -format Analog-Step -height 80 -max 25000.0 -min -25000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/i_samplesi(15) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(14) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(13) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(12) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(11) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(10) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(9) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(8) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(7) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(6) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(5) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(4) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(3) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(2) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(1) {-radix decimal} /tb/freq_estimator_inst/i_samplesi(0) {-radix decimal}} /tb/freq_estimator_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 25000.0 -min -25000.0 -radix decimal /tb/freq_estimator_inst/i_samplesq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/freq_ce
add wave -noupdate -radix decimal /tb/freq_estimator_inst/o_freq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/stm
add wave -noupdate -radix decimal /tb/cur_file
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pwr_stm
add wave -noupdate -radix decimal /tb/freq_estimator_inst/memi
add wave -noupdate -radix decimal /tb/freq_estimator_inst/memq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/mem2i
add wave -noupdate -radix decimal /tb/freq_estimator_inst/mem2q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/samples_cnt
add wave -noupdate -radix unsigned /tb/freq_estimator_inst/p_wr
add wave -noupdate -radix unsigned /tb/freq_estimator_inst/p_rd
add wave -noupdate -radix unsigned /tb/freq_estimator_inst/p_rd2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/i_samplesi_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/i_samplesq_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/from_m_i
add wave -noupdate -radix decimal /tb/freq_estimator_inst/from_m_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/from_m2_i
add wave -noupdate -radix decimal /tb/freq_estimator_inst/from_m2_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/wr
add wave -noupdate -radix decimal /tb/freq_estimator_inst/start_calc
add wave -noupdate -radix decimal /tb/freq_estimator_inst/wr_st_was
add wave -noupdate -radix decimal /tb/freq_estimator_inst/i_ce_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/i_ce_w2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_cnt_calc_to_angle_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_cnt_calc_to_angle
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_cnt_calc
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_cnt
add wave -noupdate /tb/freq_estimator_inst/smp_cnt
add wave -noupdate -radix decimal /tb/freq_estimator_inst/wind_cnt
add wave -noupdate -format Analog-Step -height 40 -max 20000.0 -min -20000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/pilotii(15) {-radix decimal} /tb/freq_estimator_inst/pilotii(14) {-radix decimal} /tb/freq_estimator_inst/pilotii(13) {-radix decimal} /tb/freq_estimator_inst/pilotii(12) {-radix decimal} /tb/freq_estimator_inst/pilotii(11) {-radix decimal} /tb/freq_estimator_inst/pilotii(10) {-radix decimal} /tb/freq_estimator_inst/pilotii(9) {-radix decimal} /tb/freq_estimator_inst/pilotii(8) {-radix decimal} /tb/freq_estimator_inst/pilotii(7) {-radix decimal} /tb/freq_estimator_inst/pilotii(6) {-radix decimal} /tb/freq_estimator_inst/pilotii(5) {-radix decimal} /tb/freq_estimator_inst/pilotii(4) {-radix decimal} /tb/freq_estimator_inst/pilotii(3) {-radix decimal} /tb/freq_estimator_inst/pilotii(2) {-radix decimal} /tb/freq_estimator_inst/pilotii(1) {-radix decimal} /tb/freq_estimator_inst/pilotii(0) {-radix decimal}} /tb/freq_estimator_inst/pilotii
add wave -noupdate -format Analog-Step -height 40 -max 20000.0 -min -20000.0 -radix decimal /tb/freq_estimator_inst/pilotqq
add wave -noupdate -format Analog-Step -height 40 -max 20000.0 -min -20000.0 -radix decimal /tb/freq_estimator_inst/pilotiq
add wave -noupdate -format Analog-Step -height 40 -max 20000.0 -min -20000.0 -radix decimal /tb/freq_estimator_inst/pilotqi
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilotmski
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilotmskq
add wave -noupdate -format Analog-Step -height 80 -max 26000.0 -min -26000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/pilotmski_w1(16) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(15) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(14) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(13) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(12) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(11) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(10) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(9) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(8) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(7) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(6) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(5) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(4) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(3) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(2) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(1) {-height 15 -radix decimal} /tb/freq_estimator_inst/pilotmski_w1(0) {-height 15 -radix decimal}} /tb/freq_estimator_inst/pilotmski_w1
add wave -noupdate -format Analog-Step -height 80 -max 26000.0 -min -26000.0 -radix decimal /tb/freq_estimator_inst/pilotmskq_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilotmsk2i_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilotmsk2q_w1
add wave -noupdate -radix decimal -subitemconfig {/tb/freq_estimator_inst/ml_ii(31) {-radix decimal} /tb/freq_estimator_inst/ml_ii(30) {-radix decimal} /tb/freq_estimator_inst/ml_ii(29) {-radix decimal} /tb/freq_estimator_inst/ml_ii(28) {-radix decimal} /tb/freq_estimator_inst/ml_ii(27) {-radix decimal} /tb/freq_estimator_inst/ml_ii(26) {-radix decimal} /tb/freq_estimator_inst/ml_ii(25) {-radix decimal} /tb/freq_estimator_inst/ml_ii(24) {-radix decimal} /tb/freq_estimator_inst/ml_ii(23) {-radix decimal} /tb/freq_estimator_inst/ml_ii(22) {-radix decimal} /tb/freq_estimator_inst/ml_ii(21) {-radix decimal} /tb/freq_estimator_inst/ml_ii(20) {-radix decimal} /tb/freq_estimator_inst/ml_ii(19) {-radix decimal} /tb/freq_estimator_inst/ml_ii(18) {-radix decimal} /tb/freq_estimator_inst/ml_ii(17) {-radix decimal} /tb/freq_estimator_inst/ml_ii(16) {-radix decimal} /tb/freq_estimator_inst/ml_ii(15) {-radix decimal} /tb/freq_estimator_inst/ml_ii(14) {-radix decimal} /tb/freq_estimator_inst/ml_ii(13) {-radix decimal} /tb/freq_estimator_inst/ml_ii(12) {-radix decimal} /tb/freq_estimator_inst/ml_ii(11) {-radix decimal} /tb/freq_estimator_inst/ml_ii(10) {-radix decimal} /tb/freq_estimator_inst/ml_ii(9) {-radix decimal} /tb/freq_estimator_inst/ml_ii(8) {-radix decimal} /tb/freq_estimator_inst/ml_ii(7) {-radix decimal} /tb/freq_estimator_inst/ml_ii(6) {-radix decimal} /tb/freq_estimator_inst/ml_ii(5) {-radix decimal} /tb/freq_estimator_inst/ml_ii(4) {-radix decimal} /tb/freq_estimator_inst/ml_ii(3) {-radix decimal} /tb/freq_estimator_inst/ml_ii(2) {-radix decimal} /tb/freq_estimator_inst/ml_ii(1) {-radix decimal} /tb/freq_estimator_inst/ml_ii(0) {-radix decimal}} /tb/freq_estimator_inst/ml_ii
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_qq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_iq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_qi
add wave -noupdate -radix decimal /tb/freq_estimator_inst/s_piloti
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sc_pilotq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/s_pilotin
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sc_pilotqn
add wave -noupdate -format Analog-Step -height 80 -max 8000.0 -min -8000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/ml_i(16) {-radix decimal} /tb/freq_estimator_inst/ml_i(15) {-radix decimal} /tb/freq_estimator_inst/ml_i(14) {-radix decimal} /tb/freq_estimator_inst/ml_i(13) {-radix decimal} /tb/freq_estimator_inst/ml_i(12) {-radix decimal} /tb/freq_estimator_inst/ml_i(11) {-radix decimal} /tb/freq_estimator_inst/ml_i(10) {-radix decimal} /tb/freq_estimator_inst/ml_i(9) {-radix decimal} /tb/freq_estimator_inst/ml_i(8) {-radix decimal} /tb/freq_estimator_inst/ml_i(7) {-radix decimal} /tb/freq_estimator_inst/ml_i(6) {-radix decimal} /tb/freq_estimator_inst/ml_i(5) {-radix decimal} /tb/freq_estimator_inst/ml_i(4) {-radix decimal} /tb/freq_estimator_inst/ml_i(3) {-radix decimal} /tb/freq_estimator_inst/ml_i(2) {-radix decimal} /tb/freq_estimator_inst/ml_i(1) {-radix decimal} /tb/freq_estimator_inst/ml_i(0) {-radix decimal}} /tb/freq_estimator_inst/ml_i
add wave -noupdate -radix unsigned /tb/freq_estimator_inst/l_cnt_calc
add wave -noupdate -format Analog-Step -height 80 -max 8000.0 -min -8000.0 -radix decimal /tb/freq_estimator_inst/ml_q
add wave -noupdate /tb/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate -format Analog-Step -height 80 -max 10000.0 -min -10000.0 -radix decimal /tb/freq_estimator_inst/t_ml_i
add wave -noupdate -format Analog-Step -height 80 -max 10000.0 -min -10000.0 -radix decimal /tb/freq_estimator_inst/t_ml_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sum_ce
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sum_ce_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sum_ce_w2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sum_ce_w3
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_ce
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_ce_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_ce_w2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_calc
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_calc_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_calc_w2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_calc_w3
add wave -noupdate -radix decimal /tb/freq_estimator_inst/l_calc_w4
add wave -noupdate -radix decimal -subitemconfig {/tb/freq_estimator_inst/acum_i(25) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(24) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(23) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(22) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(21) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(20) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(19) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(18) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(17) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(16) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(15) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(14) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(13) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(12) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(11) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(10) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(9) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(8) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(7) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(6) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(5) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(4) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(3) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(2) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(1) {-height 15 -radix decimal} /tb/freq_estimator_inst/acum_i(0) {-height 15 -radix decimal}} /tb/freq_estimator_inst/acum_i
add wave -noupdate -radix decimal /tb/freq_estimator_inst/acum_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/acum_phase
add wave -noupdate -format Analog-Step -height 100 -max 38000.0 -min -10000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/ml_sum_i(16) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(15) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(14) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(13) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(12) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(11) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(10) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(9) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(8) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(7) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(6) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(5) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(4) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(3) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(2) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(1) {-radix decimal} /tb/freq_estimator_inst/ml_sum_i(0) {-radix decimal}} /tb/freq_estimator_inst/ml_sum_i
add wave -noupdate -format Analog-Step -height 100 -max 38000.0 -min -10000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/ml_sum_q(16) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(15) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(14) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(13) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(12) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(11) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(10) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(9) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(8) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(7) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(6) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(5) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(4) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(3) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(2) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(1) {-radix decimal} /tb/freq_estimator_inst/ml_sum_q(0) {-radix decimal}} /tb/freq_estimator_inst/ml_sum_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/div_tab
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_i_mul
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_q_mul
add wave -noupdate -radix decimal /tb/freq_estimator_inst/first_l
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angle_sm_floor
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_i_mul_prev
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_q_mul_prev
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_q_mul_conj
add wave -noupdate -radix decimal /tb/freq_estimator_inst/first_l_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/ml_sum_ce_w3
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angle_pilot_ce
add wave -noupdate -format Analog-Step -height 80 -max 20000.0 -min -20000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/rx_p_i(16) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(15) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(14) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(13) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(12) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(11) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(10) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(9) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(8) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(7) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(6) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(5) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(4) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(3) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(2) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(1) {-height 15 -radix decimal} /tb/freq_estimator_inst/rx_p_i(0) {-height 15 -radix decimal}} /tb/freq_estimator_inst/rx_p_i
add wave -noupdate -format Analog-Step -height 80 -max 20000.0 -min -20000.0 -radix decimal /tb/freq_estimator_inst/rx_p_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/s_rx_p_i
add wave -noupdate -radix decimal /tb/freq_estimator_inst/s_rx_p_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/rx_p_ii
add wave -noupdate -radix decimal /tb/freq_estimator_inst/rx_p_qq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/rx_p_iq
add wave -noupdate -radix decimal /tb/freq_estimator_inst/rx_p_qi
add wave -noupdate -format Analog-Step -height 80 -max 413000000.0 -min -413000000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/smoofangels_i(33) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(32) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(31) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(30) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(29) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(28) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(27) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(26) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(25) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(24) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(23) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(22) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(21) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(20) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(19) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(18) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(17) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(16) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(15) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(14) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(13) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(12) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(11) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(10) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(9) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(8) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(7) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(6) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(5) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(4) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(3) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(2) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(1) {-height 15 -radix decimal} /tb/freq_estimator_inst/smoofangels_i(0) {-height 15 -radix decimal}} /tb/freq_estimator_inst/smoofangels_i
add wave -noupdate -format Analog-Step -height 80 -max 413000000.0 -min -413000000.0 -radix decimal -subitemconfig {/tb/freq_estimator_inst/smoofangels_q(33) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(32) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(31) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(30) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(29) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(28) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(27) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(26) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(25) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(24) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(23) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(22) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(21) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(20) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(19) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(18) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(17) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(16) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(15) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(14) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(13) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(12) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(11) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(10) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(9) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(8) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(7) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(6) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(5) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(4) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(3) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(2) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(1) {-radix decimal} /tb/freq_estimator_inst/smoofangels_q(0) {-radix decimal}} /tb/freq_estimator_inst/smoofangels_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/wait_freq_fin_need
add wave -noupdate -radix decimal /tb/freq_estimator_inst/rdy_phase
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sum_mult_preangle
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_q_choose2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/angels_to_sum_sum_div3
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pi_div_2_val
add wave -noupdate -radix decimal /tb/freq_estimator_inst/need_pi2_sub
add wave -noupdate -radix decimal /tb/freq_estimator_inst/div_done_w2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/div_done_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/div_done
add wave -noupdate -radix decimal /tb/freq_estimator_inst/div_sign
add wave -noupdate -radix decimal /tb/freq_estimator_inst/div_done2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/sum_mult_preangle_cnt
add wave -noupdate -radix decimal /tb/freq_estimator_inst/calc_angle_ce
add wave -noupdate -radix decimal /tb/freq_estimator_inst/calc_angle_ce_choose2
add wave -noupdate -radix decimal /tb/freq_estimator_inst/calc_angle_ce_choose
add wave -noupdate -radix decimal /tb/freq_estimator_inst/calc_angle_ce_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/calc_angle_ce_w
add wave -noupdate -radix decimal /tb/freq_estimator_inst/freq_calc_fin_w1
add wave -noupdate -radix decimal /tb/freq_estimator_inst/freq_calc_fin
add wave -noupdate -radix decimal /tb/freq_estimator_inst/freq_calc_fin_pre
add wave -noupdate -radix decimal /tb/freq_estimator_inst/a_calc_ce
add wave -noupdate -radix decimal /tb/freq_estimator_inst/a_calc_ce_cnt
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilot_q
add wave -noupdate -radix decimal /tb/freq_estimator_inst/pilot_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {210924000 ps} 0}
configure wave -namecolwidth 364
configure wave -valuecolwidth 161
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
WaveRestoreZoom {0 ps} {7875 us}
