onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /tb/gadarg_i/clk
add wave -noupdate -radix decimal /tb/gadarg_i/reset
add wave -noupdate -radix decimal /tb/gadarg_i/i_ce
add wave -noupdate -radix decimal /tb/gadarg_i/i_sampleI
add wave -noupdate -radix decimal /tb/gadarg_i/i_sampleQ
add wave -noupdate -format Analog-Step -height 74 -max 29999.999999999996 -min -30000.0 -radix decimal /tb/gadarg_i/o_sampleI
add wave -noupdate -format Analog-Step -height 74 -max 29999.999999999996 -min -30000.0 -radix decimal /tb/gadarg_i/o_sampleQ
add wave -noupdate -radix decimal /tb/gadarg_i/WR0r_div
add wave -noupdate -radix decimal /tb/gadarg_i/WR0r_div_1w
add wave -noupdate -radix decimal /tb/gadarg_i/short_array0
add wave -noupdate -radix decimal /tb/gadarg_i/short_array
add wave -noupdate /tb/gadarg_i/stm
add wave -noupdate -radix decimal /tb/gadarg_i/WRr
add wave -noupdate -radix decimal /tb/gadarg_i/vi2r_mul
add wave -noupdate -radix decimal /tb/gadarg_i/vi2r_mul
add wave -noupdate -radix decimal /tb/gadarg_i/vr2r
add wave -noupdate -radix decimal /tb/gadarg_i/vr3r
add wave -noupdate -radix decimal /tb/gadarg_i/delay_line_with_step_i
add wave -noupdate -radix decimal /tb/gadarg_i/delay_line_with_step_q
add wave -noupdate -radix decimal /tb/gadarg_i/delay_line_I
add wave -noupdate -radix decimal /tb/gadarg_i/delay_line_Q
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_sumed_muls_i
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_sumed_muls_q
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_vr2r_mul
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_WRr
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_vr2r
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_vr3r
add wave -noupdate -radix decimal /tb/gadarg_i/mainloop/v_WR0r_div
add wave -noupdate -radix decimal -childformat {{/tb/gadarg_i/coefs_work(3) -radix decimal} {/tb/gadarg_i/coefs_work(2) -radix decimal} {/tb/gadarg_i/coefs_work(1) -radix decimal} {/tb/gadarg_i/coefs_work(0) -radix decimal}} -expand -subitemconfig {/tb/gadarg_i/coefs_work(3) {-height 15 -radix decimal} /tb/gadarg_i/coefs_work(2) {-height 15 -radix decimal} /tb/gadarg_i/coefs_work(1) {-height 15 -radix decimal} /tb/gadarg_i/coefs_work(0) {-height 15 -radix decimal}} /tb/gadarg_i/coefs_work
add wave -noupdate -radix decimal /tb/gadarg_i/coefs_ii
add wave -noupdate -radix decimal /tb/gadarg_i/coefs_qq
add wave -noupdate -radix decimal /tb/gadarg_i/coefs_iq
add wave -noupdate -radix decimal /tb/gadarg_i/coefs_qi
add wave -noupdate -radix decimal /tb/gadarg_i/c_mul_i
add wave -noupdate -radix decimal /tb/gadarg_i/c_mul_q
add wave -noupdate -radix unsigned /tb/gadarg_i/step_cnt
add wave -noupdate -radix decimal /tb/gadarg_i/c_mul_sum_i
add wave -noupdate -radix decimal /tb/gadarg_i/c_mul_sum_q
add wave -noupdate -radix decimal /tb/gadarg_i/sumed_muls_i
add wave -noupdate -radix decimal /tb/gadarg_i/sumed_muls_q
add wave -noupdate -radix decimal /tb/gadarg_i/sq_sumed_muls_i
add wave -noupdate -radix decimal /tb/gadarg_i/sq_sumed_muls_q
add wave -noupdate -radix decimal /tb/gadarg_i/vr2r
add wave -noupdate -radix decimal /tb/gadarg_i/vi2r
add wave -noupdate -radix decimal /tb/gadarg_i/vr2i
add wave -noupdate -radix decimal /tb/gadarg_i/vr3i
add wave -noupdate -radix decimal /tb/gadarg_i/vi3r
add wave -noupdate -radix decimal /tb/gadarg_i/vi2i
add wave -noupdate -radix decimal /tb/gadarg_i/vi3i
add wave -noupdate -radix decimal /tb/gadarg_i/WR0i_div
add wave -noupdate -radix decimal /tb/gadarg_i/WI0r_div
add wave -noupdate -radix decimal /tb/gadarg_i/WI0i_div
add wave -noupdate -radix decimal /tb/gadarg_i/WRi
add wave -noupdate -radix decimal /tb/gadarg_i/WIr
add wave -noupdate -radix decimal /tb/gadarg_i/WIi
add wave -noupdate /tb/gadarg_i/sampl_cnt
add wave -noupdate /tb/gadarg_i/work_cnt
add wave -noupdate /tb/gadarg_i/stm
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {56098324 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 250
configure wave -valuecolwidth 92
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {27535490 ps} {157655067 ps}
