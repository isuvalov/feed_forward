quit -sim

vlib work
vmap work work


vlog cordic.v
vcom cordic_wrapper.vhd 

vcom ../../ToTextFile.vhd 
vcom ../../FromTextFile.vhd

vcom tb.vhd

vsim -novopt -t ps work.tb