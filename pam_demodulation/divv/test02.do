quit -sim

vlib work
vmap work work

vcom pipe_div.vhd
vcom tb.vhd

vsim -novopt -t ps work.tb

do wave.do
