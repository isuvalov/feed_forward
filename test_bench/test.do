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

vcom ../divider/serial_divide_uu.vhd 
vcom ../dds_synthesizers/sine_lut_16_x_16.vhd
vcom ../dds_synthesizers/dds_synthesizer_pipe.vhd 

vcom ../modem_tx/tx_insert_pilots.vhd
vcom ../modem_tx/modem_tx_top.vhd

vcom ../bih_filter_freq.vhd
vcom ../modem_rx/sinfilt_rxfilter.vhd 
vcom ../modem_rx/calc_freq_of_sin.vhd


vcom tb.vhd

vsim -novopt -t ps work.tb

setenv MTI_TF_LIMIT 1000

do wave.do