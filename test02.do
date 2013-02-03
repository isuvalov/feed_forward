quit -sim

vlib work
vmap work work

vcom -novopt -work work FromTextFile.vhd 
vcom -novopt -work work ToTextFile.vhd 

vcom -novopt -work work feedf_consts_pack.vhd 

vcom -novopt -work work divider/serial_divide_uu.vhd 
vcom -novopt -work work dds_synthesizers/sine_lut_16_x_16.vhd
vcom -novopt -work work dds_synthesizers/dds_synthesizer_pipe.vhd 

vcom -novopt -work work qam4_mapper.vhd
vcom -novopt -work work rcc_up_filter.vhd
vcom -novopt -work work rcc_up_filter_rx.vhd 
vcom -novopt -work work ce_manager.vhd 
vcom -novopt -work work generate_test_tx.vhd 


vcom -novopt -work work bih_filter_integrator.vhd 
vcom -novopt -work work bih_filter_integrator_sign.vhd
vcom -novopt -work work small_lf_fir.vhd 
vcom -novopt -work work sqrt32to16_altera.vhd
vcom -novopt -work work pilot_correlator.vhd
vcom -novopt -work work pilot_finder.vhd 
vcom -novopt -work work freq_estimator.vhd 
vcom -novopt -work work get_max_values.vhd
vcom -novopt -work work normalizer.vhd 
vcom -novopt -work work modem_rx_top.vhd 

vcom -novopt -work work shift_dataflow.vhd 
vcom -novopt -work work tb_02.vhd

vsim -novopt -t ps work.tb


do wave_tb02.do
