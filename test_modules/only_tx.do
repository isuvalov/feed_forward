quit -sim

vlib work
vmap work work

vcom ../FromTextFile.vhd 
vcom ../ToTextFile.vhd 


vcom ../feedf_consts_pack.vhd 

vcom ../lfsr/LFSRgenerator.vhd
vcom ../lfsr/testLFSR.vhd 
vcom ../cores/fifo_zero_latency.vhd

vcom ../qam4_mapper.vhd
vcom ../rcc_up_filter.vhd

vcom ../ce_manager.vhd 
vcom ../generate_test_tx.vhd 
vcom ../wrapper_tx_stream.vhd

vcom ../modem_tx_top.vhd 

vsim -novopt -t ps work.modem_tx_top
