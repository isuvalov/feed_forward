onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/pilotsync_inst/clk
add wave -noupdate /tb/pilotsync_inst/reset
add wave -noupdate /tb/pilotsync_inst/realpilot_event
add wave -noupdate /tb/pilotsync_inst/pilot_not_here
add wave -noupdate /tb/pilotsync_inst/start_pilotU
add wave -noupdate /tb/pilotsync_inst/sync_find
add wave -noupdate /tb/pilotsync_inst/main_cnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9518338286 ps} 0}
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
WaveRestoreZoom {7471917364 ps} {11564771636 ps}
