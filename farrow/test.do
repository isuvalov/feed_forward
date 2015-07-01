quit -sim

vlib work
vmap work work

vcom ../ToTextFile.vhd
vcom ../FromTextFile.vhd 
vcom make_powers.vhd 
vcom farrow_32bit_b.vhd

vcom ../feedf_consts_pack.vhd
vcom ../bih_filter_freq.vhd

vcom gardner_ted.vhd 
vcom gardner_ted_stm.vhd 

vcom to_zero_fraction.vhd 

vcom tb.vhd


vsim -novopt -t ps work.tb
#do wave.do
do wave_gardner.do 


