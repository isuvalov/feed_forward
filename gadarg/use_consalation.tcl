source argand.tcl
global vsimPriv
# Proc to add the appropriate menu item to any wave window
#
proc wave_hook {w} {
  add_menu $w plots
  add_menuitem $w plots Polar [list argand $w]
}

# Hook this stuff into every new ModelSim wave window
#
lappend PrefMain(user_hook) wave_hook



#set privArgand(lindex,trace) [list privArgand_proc trace lindex]
#set privArgand(lindex,trace) [list 0 trace lindex]
#trace variable vsimPriv(acttime) w $privArgand(lindex,trace)

#set vsimPriv() {14500 14600 14700 14800 14900 15000 15100}

add button SCATTERPLOT {argand} NoDisable

