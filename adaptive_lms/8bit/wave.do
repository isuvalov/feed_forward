onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal /testbench/uut/xin
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal /testbench/uut/dxin
add wave -noupdate /testbench/uut/clock
add wave -noupdate /testbench/uut/err
add wave -noupdate /testbench/uut/yout
add wave -noupdate /testbench/uut/adapt_en
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal -childformat {{/testbench/uut/e(7) -radix decimal} {/testbench/uut/e(6) -radix decimal} {/testbench/uut/e(5) -radix decimal} {/testbench/uut/e(4) -radix decimal} {/testbench/uut/e(3) -radix decimal} {/testbench/uut/e(2) -radix decimal} {/testbench/uut/e(1) -radix decimal} {/testbench/uut/e(0) -radix decimal}} -subitemconfig {/testbench/uut/e(7) {-height 15 -radix decimal} /testbench/uut/e(6) {-height 15 -radix decimal} /testbench/uut/e(5) {-height 15 -radix decimal} /testbench/uut/e(4) {-height 15 -radix decimal} /testbench/uut/e(3) {-height 15 -radix decimal} /testbench/uut/e(2) {-height 15 -radix decimal} /testbench/uut/e(1) {-height 15 -radix decimal} /testbench/uut/e(0) {-height 15 -radix decimal}} /testbench/uut/e
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal /testbench/uut/e_t
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal /testbench/uut/y_o
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal /testbench/uut/x_1
add wave -noupdate -format Analog-Step -height 50 -max 128.0 -min -128.0 -radix decimal /testbench/uut/x_N
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_in
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_N_in
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/ue_in
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/clock
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/y_out
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_out_t1
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_out_t2
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_out_t3
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_out_t4
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_N_out_t1
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_N_out_t2
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_N_out_t3
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/x_N_out_t4
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/ue_out_t1
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/ue_out_t2
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/ue_out_t3
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/ue_out_t4
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/y_out_t1
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/y_out_t2
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/y_out_t3
add wave -noupdate -expand -group core_filt /testbench/uut/cflt/y_out_t4
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {183520000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 190
configure wave -valuecolwidth 100
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 us}
