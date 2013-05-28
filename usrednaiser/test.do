quit -sim

vlib work
vmap work work

vcom feedf_consts_pack.vhd
vcom bih_filter_integrator.vhd 
vcom usrednaiser.vhd
vcom tb.vhd 


vsim -novopt -t ps work.tb
do wave.do



