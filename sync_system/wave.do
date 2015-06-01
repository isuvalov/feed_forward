onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/pilotsync_inst/clk
add wave -noupdate /tb/pilotsync_inst/reset
add wave -noupdate /tb/pilotsync_inst/realpilot_event
add wave -noupdate /tb/pilotsync_inst/pilot_not_here
add wave -noupdate /tb/pilotsync_inst/start_pilotU
add wave -noupdate /tb/pilotsync_inst/sync_find
add wave -noupdate -radix decimal -childformat {{/tb/pilotsync_inst/main_cnt(17) -radix decimal} {/tb/pilotsync_inst/main_cnt(16) -radix decimal} {/tb/pilotsync_inst/main_cnt(15) -radix decimal} {/tb/pilotsync_inst/main_cnt(14) -radix decimal} {/tb/pilotsync_inst/main_cnt(13) -radix decimal} {/tb/pilotsync_inst/main_cnt(12) -radix decimal} {/tb/pilotsync_inst/main_cnt(11) -radix decimal} {/tb/pilotsync_inst/main_cnt(10) -radix decimal} {/tb/pilotsync_inst/main_cnt(9) -radix decimal} {/tb/pilotsync_inst/main_cnt(8) -radix decimal} {/tb/pilotsync_inst/main_cnt(7) -radix decimal} {/tb/pilotsync_inst/main_cnt(6) -radix decimal} {/tb/pilotsync_inst/main_cnt(5) -radix decimal} {/tb/pilotsync_inst/main_cnt(4) -radix decimal} {/tb/pilotsync_inst/main_cnt(3) -radix decimal} {/tb/pilotsync_inst/main_cnt(2) -radix decimal} {/tb/pilotsync_inst/main_cnt(1) -radix decimal} {/tb/pilotsync_inst/main_cnt(0) -radix decimal}} -subitemconfig {/tb/pilotsync_inst/main_cnt(17) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(16) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(15) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(14) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(13) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(12) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(11) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(10) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(9) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(8) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(7) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(6) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(5) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(4) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(3) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(2) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(1) {-height 15 -radix decimal} /tb/pilotsync_inst/main_cnt(0) {-height 15 -radix decimal}} /tb/pilotsync_inst/main_cnt
add wave -noupdate /tb/pilotsync_inst/lockcnt
add wave -noupdate /tb/pilotsync_inst/stm
add wave -noupdate -radix unsigned /tb/pilotsync_inst/abscnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {332769231 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 184
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {2100 us}
