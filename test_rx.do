quit -sim

vlib work
vmap work work

vcom -novopt -work work FromTextFile.vhd 
vcom -novopt -work work ToTextFile.vhd 


vcom -novopt -work work divider/serial_divide_uu.vhd 

vcom -novopt -work work feedf_consts_pack.vhd 
vcom -novopt -work work ce_manager.vhd 
vcom -novopt -work work qam4_mapper.vhd  
vcom -novopt -work work rcc_up_filter.vhd 
vcom -novopt -work work freq_estimator.vhd 

vcom -novopt -work work pilot_correlator.vhd 
vcom -novopt -work work bih_filter_integrator_sign.vhd 
vcom -novopt -work work bih_filter_integrator.vhd 
vcom -novopt -work work sqrt32to16_altera.vhd
vcom -novopt -work work rcc_up_filter.vhd
vcom -novopt -work work pilot_finder.vhd 
vcom -novopt -work work receiver.vhd 

vcom -novopt -work work tb.vhd

vsim -novopt -t ps work.tb
do wave.do
restart -f; run 7.5 ms


