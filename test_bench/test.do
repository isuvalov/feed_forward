quit -sim

vlib work
vmap work work

vcom ../cores/fifo_zero_latency.vhd

vcom ../modem_tx/math_real.vhd
vcom ../modem_tx/start_sin_gen.vhd 

vcom ../ToTextFile.vhd

vcom ../lfsr/LFSRgenerator.vhd
vcom ../lfsr/testLFSR.vhd 


vcom ../feedf_consts_pack.vhd 

vcom ../qam4_mapper.vhd
vcom ../rcc_up_filter.vhd
vcom ../rcc_up_filter_rx.vhd 
vcom ../ce_manager.vhd 

vcom ../sqrt32to16_altera.vhd
vcom ../bih_filter_integrator_sign.vhd 
vcom ../bih_filter_integrator.vhd 
vcom ../bih_filter_freq.vhd
vcom ../pilot_correlator.vhd
vcom ../pilot_finder.vhd 
vcom ../remove_zero.vhd
vcom ../pilot_finder.vhd
vcom ../delayer.vhd 
vcom ../complex_mult.vhd

vcom ../divider/serial_divide_uu.vhd 
vcom ../dds_synthesizers/sine_lut_16_x_16.vhd
vcom ../dds_synthesizers/dds_synthesizer_pipe.vhd 

vcom ../modem_tx/tx_insert_pilots.vhd
vcom ../modem_tx/modem_tx_top.vhd

vcom ../bih_filter_freq.vhd
vcom ../modem_rx/sinfilt_rxfilter.vhd 
vlog ../pam_demodulation/cordic_v/cordic.v
vcom ../pam_demodulation/cordic_v/cordic_wrapper.vhd
vcom ../modem_rx/calc_freq_of_sin.vhd

vcom ../farrow/make_powers.vhd 
vcom ../farrow/farrow_32bit.vhd
vcom ../farrow/gardner_ted.vhd 
vcom ../farrow/to_zero_fraction.vhd 


vcom ../sync_system/pilot_sync_every_time_ver4.vhd 

vcom ../modem_rx/modem_rx_top.vhd

vcom tb.vhd

vsim -novopt -t ps work.tb

setenv MTI_TF_LIMIT 1000

do wave.do
