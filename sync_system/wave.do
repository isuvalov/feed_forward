onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/pilotsync_inst/clk
add wave -noupdate /tb/pilotsync_inst/reset
add wave -noupdate /tb/pilotsync_inst/realpilot_event
add wave -noupdate /tb/pilotsync_inst/start_pilotU
add wave -noupdate /tb/pilotsync_inst/sync_find
add wave -noupdate -radix unsigned /tb/pilotsync_inst/phase_cnt_pre
add wave -noupdate -radix unsigned -childformat {{/tb/pilotsync_inst/phase_cnt(12) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(11) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(10) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(9) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(8) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(7) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(6) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(5) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(4) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(3) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(2) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(1) -radix unsigned} {/tb/pilotsync_inst/phase_cnt(0) -radix unsigned}} -subitemconfig {/tb/pilotsync_inst/phase_cnt(12) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(11) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(10) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(9) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(8) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(7) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(6) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(5) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(4) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(3) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(2) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(1) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt(0) {-height 15 -radix unsigned}} /tb/pilotsync_inst/phase_cnt
add wave -noupdate -radix unsigned /tb/pilotsync_inst/phase_cnt_get
add wave -noupdate -radix unsigned /tb/pilotsync_inst/realpilot_event_1w
add wave -noupdate -radix unsigned /tb/pilotsync_inst/filtit_ce
add wave -noupdate -radix unsigned /tb/pilotsync_inst/pilot_come
add wave -noupdate -radix unsigned /tb/pilotsync_inst/phase_cnt_getE
add wave -noupdate -radix unsigned /tb/pilotsync_inst/phase_cnt_getadd
add wave -noupdate -radix unsigned -childformat {{/tb/pilotsync_inst/phase_cnt_filt(14) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(13) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(12) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(11) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(10) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(9) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(8) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(7) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(6) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(5) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(4) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(3) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(2) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(1) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_filt(0) -radix unsigned}} -subitemconfig {/tb/pilotsync_inst/phase_cnt_filt(14) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(13) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(12) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(11) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(10) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(9) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(8) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(7) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(6) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(5) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(4) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(3) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(2) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(1) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_filt(0) {-height 15 -radix unsigned}} /tb/pilotsync_inst/phase_cnt_filt
add wave -noupdate -radix unsigned /tb/cnt
add wave -noupdate -radix unsigned /tb/cntreg
add wave -noupdate -radix unsigned -childformat {{/tb/pilotsync_inst/phase_cnt_recalc(12) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(11) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(10) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(9) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(8) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(7) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(6) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(5) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(4) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(3) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(2) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(1) -radix unsigned} {/tb/pilotsync_inst/phase_cnt_recalc(0) -radix unsigned}} -subitemconfig {/tb/pilotsync_inst/phase_cnt_recalc(12) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(11) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(10) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(9) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(8) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(7) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(6) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(5) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(4) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(3) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(2) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(1) {-height 15 -radix unsigned} /tb/pilotsync_inst/phase_cnt_recalc(0) {-height 15 -radix unsigned}} /tb/pilotsync_inst/phase_cnt_recalc
add wave -noupdate -radix unsigned /tb/pilotsync_inst/phase_cnt_wait
add wave -noupdate -radix decimal /tb/pilotsync_inst/phase_gradient
add wave -noupdate -radix unsigned /tb/pilotsync_inst/phase_gradient_abs
add wave -noupdate /tb/pilotsync_inst/local_reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {720643201 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 246
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
WaveRestoreZoom {0 ps} {1419306 ns}
