quit -sim

vlib work
vmap work work


vcom ../feedf_consts_pack.vhd
vcom ../bih_filter_freq.vhd
vlog -sv generate_strobs/system_strob_gen.v 
#vcom pilot_sync_every_time_ver3.vhd
vcom pilot_sync_every_time_ver4.vhd


vcom tb.vhd 


vsim -novopt -t ps work.tb -pli generate_strobs/system_strob_gen.dll
#vsim -novopt -t ps work.tb
do wave.do


