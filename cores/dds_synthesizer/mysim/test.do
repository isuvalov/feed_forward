quit -sim

vlib work
vmap work work

vcom -novopt -work work sine_lut_16_x_16.vhd 
vcom -novopt -work work dds_synthesizer.vhd 
vcom -novopt -work work dds_synthesizer_tb.vhd


vsim -novopt -t ps work.dds_synthesizer_tb
do wave.do



