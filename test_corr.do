quit -sim

vlib work
vmap work work

vcom -novopt -work work feedf_consts_pack.vhd 
vcom -novopt -work work pilot_correlator.vhd 

vcom -novopt -work work tb_corr.vhd

vsim -novopt -t ps work.tb
do wave_corr.do
#run -all


