quit -sim

vlib work
vmap work work

vcom ../FromTextFile.vhd 
vcom ../pam_demodulation/assert_pack.vhd 
vcom ../feedf_consts_pack.vhd 
vcom gadarg.vhd
vcom tb_gadarg.vhd


vsim -novopt -t ps work.tb
do wave.do



