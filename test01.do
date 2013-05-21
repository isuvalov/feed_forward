quit -sim

vlib work
vmap work work

vcom feedf_consts_pack.vhd 

vcom qam4_mapper.vhd
vcom rcc_up_filter.vhd
vcom rcc_up_filter_rx.vhd 
vcom ce_manager.vhd 
vcom generate_test_tx.vhd 


vcom bih_filter_integrator.vhd 
vcom bih_filter_freq.vhd 
vcom sqrt32to16_altera.vhd
vcom pilot_correlator.vhd
vcom pilot_finder.vhd 
vcom modem_rx_top.vhd 

vcom tb_01.vhd

vsim -novopt -t ps work.tb
do wave_tb01.do

run 1 ms


