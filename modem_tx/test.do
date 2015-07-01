quit -sim

vlib work
vmap work work

vcom math_real.vhd
vcom start_sin_gen.vhd 

vcom ../ToTextFile.vhd

vcom ../lfsr/LFSRgenerator.vhd
vcom ../lfsr/testLFSR.vhd 


vcom ../feedf_consts_pack.vhd 

vcom ../qam4_mapper.vhd
vcom ../rcc_up_filter.vhd
vcom ../rcc_up_filter_rx.vhd 
vcom ../ce_manager.vhd 

vcom tx_insert_pilots.vhd
vcom modem_tx_top.vhd

vcom tb.vhd

vsim -novopt -t ps work.tb

setenv MTI_TF_LIMIT 1000

do wave.do
