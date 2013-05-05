onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/clk
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -min -16000.0 -radix decimal /tb/test_tx_inst/adc_array_re
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -min -16000.0 -radix decimal /tb/test_tx_inst/adc_array_im
add wave -noupdate -radix unsigned /tb/test_tx_inst/cnt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/reset
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei(11) {-radix decimal} /tb/modem_rx_top_inst/samplei(10) {-radix decimal} /tb/modem_rx_top_inst/samplei(9) {-radix decimal} /tb/modem_rx_top_inst/samplei(8) {-radix decimal} /tb/modem_rx_top_inst/samplei(7) {-radix decimal} /tb/modem_rx_top_inst/samplei(6) {-radix decimal} /tb/modem_rx_top_inst/samplei(5) {-radix decimal} /tb/modem_rx_top_inst/samplei(4) {-radix decimal} /tb/modem_rx_top_inst/samplei(3) {-radix decimal} /tb/modem_rx_top_inst/samplei(2) {-radix decimal} /tb/modem_rx_top_inst/samplei(1) {-radix decimal} /tb/modem_rx_top_inst/samplei(0) {-radix decimal}} /tb/modem_rx_top_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleq
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/good_values
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleifilt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleqfilt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -format Analog-Step -height 100 -max 16000.0 -min -16000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei_delay(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/samplei_delay
add wave -noupdate -format Analog-Step -height 100 -max 16000.0 -min -16000.0 -radix decimal /tb/modem_rx_top_inst/sampleq_delay
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate -format Analog-Step -height 30 -max 20000.0 -min -20000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei_norm(15) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(14) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(13) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(12) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(11) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(10) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(9) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(8) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(7) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(6) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(5) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(4) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(3) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(2) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(1) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(0) {-radix decimal}} /tb/modem_rx_top_inst/samplei_norm
add wave -noupdate -format Analog-Step -height 30 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/p_wr
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/p_rd
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_value(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_value
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_val_filt(23) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(22) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(21) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(20) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(19) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(18) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(17) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(16) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(15) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(14) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(13) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(12) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(11) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(10) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(9) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(8) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(7) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(6) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(5) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(4) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(3) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(2) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(1) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(0) {-radix decimal}} /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f_1w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f_2w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate -format Analog-Step -height 80 -max 45000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(15) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(14) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(13) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(12) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(11) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(10) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(9) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(8) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(7) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(6) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(5) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(4) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(3) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(2) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(1) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(0) {-radix decimal}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate -format Analog-Step -height 60 -max 60000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
add wave -noupdate -radix decimal /tb/test_tx_inst/adc_array_im
add wave -noupdate -radix decimal /tb/test_tx_inst/adc_array_re
add wave -noupdate -radix unsigned /tb/test_tx_inst/cnt_1w
add wave -noupdate /tb/test_tx_inst/m_samplei_o
add wave -noupdate /tb/test_tx_inst/m_sampleq_o
add wave -noupdate -radix decimal /tb/test_tx_inst/test_mem_i
add wave -noupdate /tb/test_tx_inst/qw_rd_1w
add wave -noupdate /tb/samplei_tx
add wave -noupdate /tb/sampleq_tx
add wave -noupdate /tb/test_tx_inst/sim_load_from_file
add wave -noupdate /tb/samplei_tx0
add wave -noupdate /tb/sampleq_tx0
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/i_ce
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/i_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/o_pilot_start
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/o_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/o_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/out_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/delaylinei
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/delaylineq
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/samplei_delay(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/samplei_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/sampleq_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/max_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/done_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/maxiq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/divisor
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/serial_divide_uu_inst/dividend_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/quotient
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_cntdelay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_delayv
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_delay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/p_wr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/p_rd
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/max_ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxi
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/pwr_stm
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxi
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxiq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/abs_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/abs_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_ce_1w
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_max_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/p_wr
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
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
add wave -noupdate -format Analog-Step -height 80 -max 55000.0 -min -55000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate -format Analog-Step -height 80 -max 55000.0 -min -55000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
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
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
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
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
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
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate -format Analog-Step -height 40 -max 6000.0 -min -6000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/corri_o(15) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(14) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(13) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(12) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(11) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(10) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(9) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(8) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(7) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(6) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(5) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(4) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(3) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(2) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(1) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(0) {-radix decimal}} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o
add wave -noupdate -format Analog-Step -height 40 -max 6000.0 -min -6000.0 -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/corrq_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt2
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate -format Analog-Step -height 50 -max 80000000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(31) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(30) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(29) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(28) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(27) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(26) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(25) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(24) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(23) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(22) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(21) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(20) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(19) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(18) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(17) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(16) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate -format Analog-Step -height 50 -max 80000000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate -format Analog-Step -height 50 -max 70000000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -format Analog-Step -height 40 -max 9000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/cor_test(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate -format Analog-Step -height 50 -max 8500.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(15) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(14) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(13) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(12) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(11) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(10) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(9) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(8) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(7) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(6) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(5) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(4) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(3) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(2) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(1) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(0) {-radix hexadecimal}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/clk
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -min -16000.0 -radix decimal /tb/test_tx_inst/adc_array_re
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -min -16000.0 -radix decimal /tb/test_tx_inst/adc_array_im
add wave -noupdate -radix unsigned /tb/test_tx_inst/cnt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/reset
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei(11) {-radix decimal} /tb/modem_rx_top_inst/samplei(10) {-radix decimal} /tb/modem_rx_top_inst/samplei(9) {-radix decimal} /tb/modem_rx_top_inst/samplei(8) {-radix decimal} /tb/modem_rx_top_inst/samplei(7) {-radix decimal} /tb/modem_rx_top_inst/samplei(6) {-radix decimal} /tb/modem_rx_top_inst/samplei(5) {-radix decimal} /tb/modem_rx_top_inst/samplei(4) {-radix decimal} /tb/modem_rx_top_inst/samplei(3) {-radix decimal} /tb/modem_rx_top_inst/samplei(2) {-radix decimal} /tb/modem_rx_top_inst/samplei(1) {-radix decimal} /tb/modem_rx_top_inst/samplei(0) {-radix decimal}} /tb/modem_rx_top_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleq
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/good_values
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleifilt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleqfilt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -format Analog-Step -height 100 -max 16000.0 -min -16000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei_delay(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/samplei_delay
add wave -noupdate -format Analog-Step -height 100 -max 16000.0 -min -16000.0 -radix decimal /tb/modem_rx_top_inst/sampleq_delay
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate -format Analog-Step -height 30 -max 20000.0 -min -20000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei_norm(15) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(14) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(13) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(12) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(11) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(10) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(9) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(8) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(7) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(6) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(5) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(4) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(3) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(2) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(1) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(0) {-radix decimal}} /tb/modem_rx_top_inst/samplei_norm
add wave -noupdate -format Analog-Step -height 30 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/p_wr
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/p_rd
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_value(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_value
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_val_filt(23) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(22) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(21) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(20) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(19) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(18) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(17) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(16) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(15) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(14) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(13) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(12) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(11) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(10) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(9) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(8) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(7) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(6) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(5) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(4) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(3) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(2) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(1) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(0) {-radix decimal}} /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f_1w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f_2w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate -format Analog-Step -height 80 -max 45000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(15) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(14) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(13) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(12) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(11) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(10) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(9) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(8) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(7) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(6) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(5) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(4) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(3) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(2) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(1) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(0) {-radix decimal}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -format Analog-Step -height 60 -max 60000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
add wave -noupdate -radix decimal /tb/test_tx_inst/adc_array_im
add wave -noupdate -radix decimal /tb/test_tx_inst/adc_array_re
add wave -noupdate -radix unsigned /tb/test_tx_inst/cnt_1w
add wave -noupdate /tb/test_tx_inst/m_samplei_o
add wave -noupdate /tb/test_tx_inst/m_sampleq_o
add wave -noupdate -radix decimal /tb/test_tx_inst/test_mem_i
add wave -noupdate /tb/test_tx_inst/qw_rd_1w
add wave -noupdate /tb/samplei_tx
add wave -noupdate /tb/sampleq_tx
add wave -noupdate /tb/test_tx_inst/sim_load_from_file
add wave -noupdate /tb/samplei_tx0
add wave -noupdate /tb/sampleq_tx0
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/i_ce
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/i_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/o_pilot_start
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/o_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/o_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/out_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/delaylinei
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/delaylineq
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/samplei_delay(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/samplei_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/sampleq_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/max_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/done_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/maxiq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/divisor
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/serial_divide_uu_inst/dividend_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/quotient
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_cntdelay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_delayv
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_delay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/p_wr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/p_rd
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/max_ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxi
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/pwr_stm
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxi
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxiq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/abs_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/abs_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_ce_1w
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_max_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/p_wr
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
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
add wave -noupdate -format Analog-Step -height 80 -max 55000.0 -min -55000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate -format Analog-Step -height 80 -max 55000.0 -min -55000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
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
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
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
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
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
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate -format Analog-Step -height 40 -max 6000.0 -min -6000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/corri_o(15) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(14) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(13) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(12) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(11) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(10) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(9) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(8) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(7) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(6) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(5) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(4) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(3) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(2) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(1) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(0) {-radix decimal}} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o
add wave -noupdate -format Analog-Step -height 40 -max 6000.0 -min -6000.0 -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/corrq_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt2
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate -format Analog-Step -height 50 -max 80000000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(31) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(30) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(29) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(28) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(27) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(26) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(25) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(24) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(23) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(22) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(21) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(20) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(19) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(18) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(17) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(16) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate -format Analog-Step -height 50 -max 80000000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate -format Analog-Step -height 50 -max 70000000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -format Analog-Step -height 40 -max 9000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/cor_test(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate -format Analog-Step -height 50 -max 8500.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(15) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(14) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(13) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(12) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(11) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(10) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(9) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(8) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(7) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(6) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(5) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(4) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(3) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(2) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(1) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(0) {-radix hexadecimal}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/clk
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -min -16000.0 -radix decimal /tb/test_tx_inst/adc_array_re
add wave -noupdate -format Analog-Step -height 50 -max 16000.0 -min -16000.0 -radix decimal /tb/test_tx_inst/adc_array_im
add wave -noupdate -radix unsigned /tb/test_tx_inst/cnt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/reset
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei(11) {-radix decimal} /tb/modem_rx_top_inst/samplei(10) {-radix decimal} /tb/modem_rx_top_inst/samplei(9) {-radix decimal} /tb/modem_rx_top_inst/samplei(8) {-radix decimal} /tb/modem_rx_top_inst/samplei(7) {-radix decimal} /tb/modem_rx_top_inst/samplei(6) {-radix decimal} /tb/modem_rx_top_inst/samplei(5) {-radix decimal} /tb/modem_rx_top_inst/samplei(4) {-radix decimal} /tb/modem_rx_top_inst/samplei(3) {-radix decimal} /tb/modem_rx_top_inst/samplei(2) {-radix decimal} /tb/modem_rx_top_inst/samplei(1) {-radix decimal} /tb/modem_rx_top_inst/samplei(0) {-radix decimal}} /tb/modem_rx_top_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleq
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/good_values
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleifilt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/sampleqfilt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -format Analog-Step -height 100 -max 16000.0 -min -16000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei_delay(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/samplei_delay(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/samplei_delay
add wave -noupdate -format Analog-Step -height 100 -max 16000.0 -min -16000.0 -radix decimal /tb/modem_rx_top_inst/sampleq_delay
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate -format Analog-Step -height 30 -max 20000.0 -min -20000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/samplei_norm(15) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(14) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(13) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(12) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(11) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(10) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(9) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(8) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(7) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(6) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(5) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(4) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(3) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(2) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(1) {-radix decimal} /tb/modem_rx_top_inst/samplei_norm(0) {-radix decimal}} /tb/modem_rx_top_inst/samplei_norm
add wave -noupdate -format Analog-Step -height 30 -max 20000.0 -min -20000.0 -radix decimal /tb/modem_rx_top_inst/sampleq_norm
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/p_wr
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/p_rd
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_value(23) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(22) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(21) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(20) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(19) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(18) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(17) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_value(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_value
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_val_filt(23) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(22) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(21) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(20) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(19) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(18) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(17) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(16) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(15) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(14) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(13) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(12) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(11) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(10) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(9) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(8) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(7) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(6) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(5) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(4) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(3) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(2) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(1) {-radix decimal} /tb/modem_rx_top_inst/freq_val_filt(0) {-radix decimal}} /tb/modem_rx_top_inst/freq_val_filt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/wr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f_1w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_ce_f_2w
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pwr_stm
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/stm
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -format Analog-Step -height 50 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate -format Analog-Step -height 80 -max 45000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(15) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(14) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(13) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(12) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(11) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(10) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(9) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(8) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(7) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(6) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(5) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(4) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(3) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(2) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(1) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(0) {-radix decimal}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -format Analog-Step -height 60 -max 60000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
add wave -noupdate -radix decimal /tb/test_tx_inst/adc_array_im
add wave -noupdate -radix decimal /tb/test_tx_inst/adc_array_re
add wave -noupdate -radix unsigned /tb/test_tx_inst/cnt_1w
add wave -noupdate /tb/test_tx_inst/m_samplei_o
add wave -noupdate /tb/test_tx_inst/m_sampleq_o
add wave -noupdate -radix decimal /tb/test_tx_inst/test_mem_i
add wave -noupdate /tb/test_tx_inst/qw_rd_1w
add wave -noupdate /tb/samplei_tx
add wave -noupdate /tb/sampleq_tx
add wave -noupdate /tb/test_tx_inst/sim_load_from_file
add wave -noupdate /tb/samplei_tx0
add wave -noupdate /tb/sampleq_tx0
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/i_ce
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/i_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/i_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/o_pilot_start
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/o_samplesi
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/normalizer_inst/o_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/out_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/delaylinei
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/delaylineq
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/samplei_delay(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/samplei_delay
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/sampleq_delay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/samplei_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/sampleq_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/max_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/done_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/maxiq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/divisor
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/serial_divide_uu_inst/dividend_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/quotient
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_cntdelay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_delayv
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/pilot_start_delay
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/p_wr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/p_rd
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/max_ce
add wave -noupdate -radix decimal -subitemconfig {/tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(15) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(14) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(13) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(12) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(11) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(10) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(9) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(8) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(7) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(6) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(5) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(4) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(3) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(2) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(1) {-radix decimal} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq(0) {-radix decimal}} /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxiq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxi
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/maxq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/pwr_stm
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxi
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_maxiq
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/abs_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/abs_samplesq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/i_ce_1w
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/s_max_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/normalizer_inst/get_max_values_inst/p_wr
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/reset
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/pilot_start
add wave -noupdate /tb/modem_rx_top_inst/freq_estimator_inst/i_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesi
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/i_samplesq
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
add wave -noupdate -format Analog-Step -height 80 -max 55000.0 -min -55000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(16) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(15) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(14) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(13) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(12) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(11) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(10) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(9) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(8) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(7) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(6) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(5) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(4) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(3) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(2) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(1) {-height 15 -radix decimal} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1(0) {-height 15 -radix decimal}} /tb/modem_rx_top_inst/freq_estimator_inst/pilotmski_w1
add wave -noupdate -format Analog-Step -height 80 -max 55000.0 -min -55000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/pilotmskq_w1
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
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_i
add wave -noupdate -format Analog-Step -height 80 -max 32000.0 -min -32000.0 -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/rx_p_q
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
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_uns
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_uns
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb_w1
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_divb
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_i_choose2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_q_choose2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div2
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_estimator_inst/angels_to_sum_sum_div3
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
add wave -noupdate -divider {New Divider}
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/clk
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/reset
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce
add wave -noupdate -format Analog-Step -height 40 -max 6000.0 -min -6000.0 -radix decimal -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/corri_o(15) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(14) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(13) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(12) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(11) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(10) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(9) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(8) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(7) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(6) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(5) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(4) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(3) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(2) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(1) {-radix decimal} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o(0) {-radix decimal}} /tb/modem_rx_top_inst/pilot_finder_inst/corri_o
add wave -noupdate -format Analog-Step -height 40 -max 6000.0 -min -6000.0 -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/corrq_o
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/pilot_start
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt2
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p2
add wave -noupdate -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_p1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_w1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt_max
add wave -noupdate -format Analog-Step -height 50 -max 80000000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(31) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(30) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(29) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(28) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(27) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(26) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(25) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(24) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(23) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(22) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(21) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(20) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(19) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(18) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(17) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(16) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/samplei_sq
add wave -noupdate -format Analog-Step -height 50 -max 80000000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_sq
add wave -noupdate -format Analog-Step -height 50 -max 70000000.0 -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/sample_sq
add wave -noupdate -format Analog-Step -height 40 -max 9000.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/cor_test(15) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(14) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(13) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(12) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(11) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(10) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(9) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(8) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(7) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(6) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(5) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(4) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(3) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(2) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(1) {-radix unsigned} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test(0) {-radix unsigned}} /tb/modem_rx_top_inst/pilot_finder_inst/cor_test
add wave -noupdate -format Analog-Step -height 50 -max 8500.0 -radix unsigned -subitemconfig {/tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(15) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(14) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(13) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(12) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(11) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(10) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(9) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(8) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(7) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(6) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(5) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(4) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(3) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(2) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(1) {-radix hexadecimal} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt(0) {-radix hexadecimal}} /tb/modem_rx_top_inst/pilot_finder_inst/correlation_sqrt
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/samplei_corr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sampleq_corr
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_sqrt_ce
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/sample_ce_w1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/cor_filtered_mult
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/more_than_porog
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/pilot_finder_inst/time_out1
add wave -noupdate -radix hexadecimal /tb/modem_rx_top_inst/pilot_finder_inst/extremum_stm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1051332000 ps} 0}
configure wave -namecolwidth 425
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
WaveRestoreZoom {107563910 ps} {858486110 ps}
