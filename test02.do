quit -sim

vlib work
vmap work work

vcom FromTextFile.vhd 
vcom ToTextFile.vhd 

vcom feedf_consts_pack.vhd 

vcom divider/serial_divide_uu.vhd 
vcom dds_synthesizers/sine_lut_16_x_16.vhd
vcom dds_synthesizers/dds_synthesizer_pipe.vhd 

vcom qam4_mapper.vhd
vcom rcc_up_filter.vhd
vcom rcc_up_filter_rx.vhd 
vcom ce_manager.vhd 
vcom generate_test_tx.vhd 
vcom wrapper_tx_stream.vhd

vcom complex_mult.vhd
vcom bih_filter_integrator.vhd 
vcom bih_filter_integrator_sign.vhd
vcom bih_filter_freq.vhd 
vcom small_lf_fir.vhd 
vcom sqrt32to16_altera.vhd
vcom pilot_correlator.vhd
vcom pilot_finder.vhd 
vcom freq_estimator.vhd 
vcom get_max_values.vhd
vcom normalizer.vhd 
vcom delayer.vhd 
vcom pilot_upper.vhd 
vcom scalar_mult.vhd
vcom remove_zero.vhd
vcom pilot_sync_every_time.vhd 
vcom complex_normalizer.vhd

vlog pam_demodulation/cordic_v/cordic.v
vcom pam_demodulation/cordic_v/cordic_wrapper.vhd 
vcom pam_demodulation/assert_pack.vhd 
vlog pam_demodulation/table_phaseerrors.v
vcom pam_demodulation/pam_demod.vhd
vcom pam_demodulation/short_lf_filter_ver2.vhd
vcom pam_demodulation/itertive_demod.vhd
vcom pam_demodulation/pam_demod_by_phase.vhd

vcom modem_rx_top.vhd 


vcom lfsr/LFSRgenerator.vhd
vcom lfsr/testLFSR.vhd 
vcom cores/fifo_zero_latency.vhd
vcom shift_dataflow.vhd 
vcom modem_tx_top.vhd 

vcom tb_04.vhd
#vcom tb_03.vhd

vsim -novopt -t ps work.tb

setenv MTI_TF_LIMIT 1000

do wave.do
