quit -sim

vlib work
vmap work work

vcom -novopt -work work feedf_consts_pack.vhd 


vcom -novopt -work work qam4_mapper.vhd
vcom -novopt -work work rcc_up_filter.vhd
vcom -novopt -work work rcc_up_filter_rx.vhd 
vcom -novopt -work work ce_manager.vhd 
vcom -novopt -work work generate_test_tx.vhd 


vcom -novopt -work work bih_filter_integrator.vhd 
#vcom -novopt -work work sqrt32to16.vhd
vcom -novopt -work work sqrt32to16_altera.vhd
vcom -novopt -work work pilot_correlator.vhd
vcom -novopt -work work pilot_finder.vhd 
vcom -novopt -work work modem_rx_top.vhd 

vcom -novopt -work work tb_01.vhd

vsim -novopt -t ps work.tb
do wave_tb01.do

run 1 ms


