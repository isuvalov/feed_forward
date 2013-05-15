onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/test_tx_inst/pilot_ce
add wave -noupdate /tb/modem_rx_top_inst/clk
add wave -noupdate /tb/modem_rx_top_inst/freq_ce
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_value
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start_norm
add wave -noupdate /tb/modem_rx_top_inst/s_pilot_start
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/freq_val_filt_mult_1w
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/dds_cos
add wave -noupdate -radix decimal /tb/modem_rx_top_inst/dds_sin
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_ce
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt
add wave -noupdate -radix unsigned /tb/modem_rx_top_inst/time_for_freqcalc_cnt_reg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10803878 ps} 0}
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
WaveRestoreZoom {0 ps} {102954600 ps}
