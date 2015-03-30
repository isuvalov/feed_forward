quit -sim

vlib work
vmap work work

vcom ../ToTextFile.vhd
vcom ../FromTextFile.vhd 
vcom make_powers.vhd 
vcom farrow_32bit.vhd
vcom tb.vhd


vsim -novopt -t ps work.tb
do wave.do



