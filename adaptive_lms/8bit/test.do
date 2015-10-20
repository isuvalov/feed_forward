quit -sim

vlib work
vmap work work

vcom add16.vhd
vcom bin_to_7seg.vhd
vcom ch_filt_tap.vhd
vcom clock_div.vhd
vcom const_ch_filt.vhd
vcom core_filt.vhd
vcom d_to_a_1bit.vhd
vcom data_gen.vhd
vcom data_gen_translate.vhd
vcom Display_MSE.vhd
vcom filt_test_system.vhd
vcom mul8.vhd
vcom Mux.vhd
vcom saturation.vhd
vcom shift_15d.vhd
vcom shift_16d.vhd
vcom shift_1d_16.vhd
vcom test_data_gen.vhd
vcom tf_lms.vhd
vcom tr_seq_gen.vhd
vcom truncation.vhd
vcom u_scaling.vhd
vcom unit_calc.vhd
vcom test_filt_test_sys.vhd
vcom test_lms.vhd


vsim -novopt -t ps work.testbench

#setenv MTI_TF_LIMIT 1000

#do wave.do
