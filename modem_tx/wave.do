onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/start_sin_gen_i/clk
add wave -noupdate -radix decimal -childformat {{/tb/start_sin_gen_i/sin_quarter(0) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(1) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(2) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(3) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(4) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(5) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(6) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(7) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(8) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(9) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(10) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(11) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(12) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(13) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(14) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(15) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(16) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(17) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(18) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(19) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(20) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(21) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(22) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(23) -radix decimal} {/tb/start_sin_gen_i/sin_quarter(24) -radix decimal}} -expand -subitemconfig {/tb/start_sin_gen_i/sin_quarter(0) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(1) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(2) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(3) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(4) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(5) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(6) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(7) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(8) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(9) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(10) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(11) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(12) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(13) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(14) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(15) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(16) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(17) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(18) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(19) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(20) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(21) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(22) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(23) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_quarter(24) {-height 15 -radix decimal}} /tb/start_sin_gen_i/sin_quarter
add wave -noupdate -expand /tb/start_sin_gen_i/cnt
add wave -noupdate -radix unsigned /tb/start_sin_gen_i/cnt_q_period
add wave -noupdate -radix unsigned /tb/start_sin_gen_i/cnt_q_period_inv
add wave -noupdate /tb/start_sin_gen_i/sin_val
add wave -noupdate /tb/start_sin_gen_i/sin_val_inv
add wave -noupdate -format Analog-Step -height 50 -max 32768.0 -radix decimal -childformat {{/tb/start_sin_gen_i/sin_val(15) -radix decimal} {/tb/start_sin_gen_i/sin_val(14) -radix decimal} {/tb/start_sin_gen_i/sin_val(13) -radix decimal} {/tb/start_sin_gen_i/sin_val(12) -radix decimal} {/tb/start_sin_gen_i/sin_val(11) -radix decimal} {/tb/start_sin_gen_i/sin_val(10) -radix decimal} {/tb/start_sin_gen_i/sin_val(9) -radix decimal} {/tb/start_sin_gen_i/sin_val(8) -radix decimal} {/tb/start_sin_gen_i/sin_val(7) -radix decimal} {/tb/start_sin_gen_i/sin_val(6) -radix decimal} {/tb/start_sin_gen_i/sin_val(5) -radix decimal} {/tb/start_sin_gen_i/sin_val(4) -radix decimal} {/tb/start_sin_gen_i/sin_val(3) -radix decimal} {/tb/start_sin_gen_i/sin_val(2) -radix decimal} {/tb/start_sin_gen_i/sin_val(1) -radix decimal} {/tb/start_sin_gen_i/sin_val(0) -radix decimal}} -subitemconfig {/tb/start_sin_gen_i/sin_val(15) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(14) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(13) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(12) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(11) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(10) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(9) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(8) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(7) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(6) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(5) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(4) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(3) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(2) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(1) {-height 15 -radix decimal} /tb/start_sin_gen_i/sin_val(0) {-height 15 -radix decimal}} /tb/start_sin_gen_i/sin_val
add wave -noupdate -format Analog-Step -height 70 -max 32768.0 -min -32768.0 -radix decimal /tb/start_sin_gen_i/sin_val_mux
add wave -noupdate -radix decimal /tb/start_sin_gen_i/sin_val_mux
add wave -noupdate /tb/start_sin_gen_i/i_ce
add wave -noupdate /tb/start_sin_gen_i/i_reset
add wave -noupdate /tb/start_sin_gen_i/o_ce
add wave -noupdate /tb/samples
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7123815268 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 219
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
WaveRestoreZoom {7036175433 ps} {7408157844 ps}
