# argand.tcl
#
# Argand diagram (=constellation plot) for two vectors or numbers.
# It will be linked to the wave display in ModelSim.

# created, Jonathan Bromley  24 Apr 2002
#
# revised, Jonathan Bromley  24 Jun 2002
# * improved comments for release on Doulos website
# * replaced all [string equal] tests with ![string compare]
#   so it works OK with ModelSim pre-5.6 (Tcl 8.0)
# * replaced [string is double $x] tests with [catch {incr x 0}]
#   so it works OK with ModelSim pre-5.6 (Tcl 8.0)
# * moved "No data" message to top left corner of display to 
#   simplify display maintenance
# * removed some old code from experimental versions
#
# Updated from latest version of Modelsim, Doug Smith, December 2012
#



# ############################ SYNOPSIS ###############################
#                                                                     #
# This file contains just two procs, argand and privArgand_proc.      #
# It should be used in conjunction with the file modelsim.tcl         #
# which provides the code needed to hook this functionality into      #
# ModelSim's wave window.                                             #
#                                                                     #
#                                                                     #
#                ########### argand ###########                       #
#                                                                     #
# is used to set up a new constellation-plot window.  It will         #
# typically be called from a menu item.  It creates the window,       #
# sets up all necessary data structures, and returns the newly        #
# created window's pathname.                                          #
#                                                                     #
#                                                                     #
#           ########### privArgand_proc ###########                   #
#                                                                     #
# provides one centralised entry point for all other functionality.   #
# It is typically called from event handlers, to manage dynamic       #
# updating and repainting of the plot display.                        #
#                                                                     #
# #####################################################################



# ######################################################################
#                                                                      #
#                                 argand                               #
#                                                                      #
# ######################################################################
#
# Accept any arguments.  The first (and only!) argument is expected
# to be the name of the wave window in which we are created.  If no 
# argument, default to .wave
# Any arguments after the first are silently ignored.
#
proc argand {{win .wave} args} {

  # Globals in ModelSim that we need to look at:
  #
  global PathSeparator
  global vsimPriv
  
  # We concentrate all our private data in one global array, to 
  # avoid creating lots of different variable names that might
  # clash with existing variables:
  #
  global privArgand
  
  # Append .tree to the window name so that we locate the signal list.
  #
  set win [view wave]
  append win .tree

  # Check that the required list window really exists, fail if not.
  #
  if {![winfo exists $win]} {
    error "argand: source window $win doesn't exist"
  }
  if {[string compare WaveTree [winfo class $win]]} {
    error "argand: source window $win isn't a WaveTree"
  }

  # We hope the user has selected the two signals they want us to plot.
  
  # Find which signals are selected:
  #
  set selList [$win curselection]
  
  # check that there are exactly two:
  #
  if {[llength $selList] != 2} {
    error "argand: must select 2 signals to plot"
  }
  
  # Go through the (two!) signals checking they are appropriate
  # and remembering their vital statistics
  #
  foreach sig $selList {
  
    # check that they are both in decimal radix
    # (and thus are fairly likely to be numbers!!!)
    #
    if {[string compare [$win itemcget $sig -radix] decimal]} {
      error "argand: selected signals must have decimal radix"
    }
    
    # remember their full names, for display purposes later
    #
    lappend sigList [$win get4 $sig]

  }
  
  # Now we know the signal names, extract their tails (the
  # HDL declared name of the signal) for annotating the display
  #
  foreach sig $sigList {
    lappend tailList [lindex [split $sig $PathSeparator] end]
  }
  
  # Find an index number (small integer) to identify this plot
  # uniquely.  These indices simply increment as new plots are
  # created;  there is no need to recycle index numbers from 
  # plots that have been destroyed.
  #
  # The next unused index number is saved in our private global
  # array as privArgand(nextIndex).  If this is the first time 
  # the procedure has been run, that variable doesn't exist so
  # it needs to be created with a suitable default value.
  
  # Is this the first plot we have created?
  #
  if {![info exists privArgand(nextIndex)]} {
    set privArgand(nextIndex) 0
  }
  
  # Capture the index number we will use to identify this plot,
  # and increment nextIndex ready for the next one.
  #
  set index $privArgand(nextIndex)
  incr privArgand(nextIndex)

  # From now on, all data we create will be stored in elements
  # of the privArgand() array, with subscripts beginning with
  # the index integer followed by a comma.
  
  # Save away the signal names and source window.  We don't 
  # need to save the name tails;  they are used only to create
  # some text on the plot canvas.
  #
  set privArgand($index,fullNames) $sigList
  set privArgand($index,tree) $win

  
  # Create toplevel window, remember its name
  #
  set n [toplevel .argand$index]
  set privArgand($index,toplevel) $n

  # Create names for the enclosing frame (required for correct
  # colouring of sunken relief on canvas) and the canvas itself
  set privArgand($index,hull) $n.f
  set privArgand($index,plot) $n.f.c

  # Create the frame and canvas widgets
  #
  frame $n.f -borderwidth 2 -relief sunken -background white
  canvas $n.f.c -background black -borderwidth 0 \
                -highlightthickness 0 -width 200 -height 200
  pack $n.f -padx 0 -pady 0 -ipadx 0 -ipady 0 -fill both -expand 1
  pack $n.f.c -padx 0 -pady 0 -ipadx 0 -ipady 0 -fill both -expand 1

  # Create axes with labels
  #
  $n.f.c create line 0 100 200 100 \
                     -width 2 -fill darkgray -arrow last -tags axisX
  $n.f.c create line 100 200 100 0 \
                     -width 2 -fill darkgray -arrow last -tags axisY
  $n.f.c create text 195 95 -anchor se -text [lindex $tailList 0] \
                     -tag labelX -fill white -font bold
  $n.f.c create text 105 5 -anchor nw -text [lindex $tailList 1] \
                     -tag labelY -fill white -font bold

  # Create "no data" error message
  #
  $n.f.c create text 5 2 -anchor nw -text "No data!" \
                     -tag noData -fill red -font bold

  # Create polar plot:
  
  # radius vector
  #
  $n.f.c create line 100 100 100 100 -width 1 -fill green -tags vector
  
  # white cross at the end of it
  #
  $n.f.c create line 95 100 105 100 -width 3 -fill white -tags pointH
  $n.f.c create line 100 95 100 105 -width 3 -fill white -tags pointV

  # Set up variables describing the current location of the point.
  # This information is needed when moving the point to a new position.
  # Note the "uplevel #0" command to run privArgand_proc, since it is
  # usually run as an event handler and therefore expects to run in 
  # the global context.
  #
  uplevel #0 privArgand_proc getValues $index
  
  # Label the toplevel window
  #
  wm title $n "X=[lindex $tailList 0] Y=[lindex $tailList 1]"

  # Set up for a repaint on size change
  #
  bind $n.f.c <Configure> [list privArgand_proc repaint $index]

  # Hook it to wave window cursor changes by tracing changes
  # in ModelSim variable "vsimPriv(acttime)".  Remember details
  # of the trace handler so that it's possible to cancel it later.
  #
  set privArgand($index,trace) \
    [list privArgand_proc trace $index]
  trace variable vsimPriv(acttime) w $privArgand($index,trace)

  # Arrange cleanup on window destruction
  #
  wm protocol $n WM_DELETE_WINDOW [list privArgand_proc destroy $index]

  # Fix the display for the first time
  #
  uplevel #0 privArgand_proc repaint $index

  # Return the name of the toplevel window, in the same way that most
  # Tk widget creation commands do.
  #
  return $n
}



# ######################################################################
#                                                                      #
#                           privArgand_proc                            #
#                                                                      #
# ######################################################################
#
# All the real work is done by one or more options of procedure
# privArgand_proc.  By building just one "proc" with lots of options,
# we reduce the number of proc names that have to be added to the 
# already crowded name space, and reduce the risk of clashing with
# a proc name that already exists.

# privArgand_proc has two compulsory arguments, option and index.
#
# * option:
#   a string name specifying which function we want the proc
#   to perform on this run.  Valid names are:
#   * getValues
#     updates our internal copies of the plot's x,y signals
#     at the currently selected moment of simulation time,
#     by reading values from the appropriate wave window
#   * replot
#     re-create the display to account for changed x,y values
#   * repaint
#     re-create the display and its axes, to account for
#     user resizing of the window
#   * trace
#     Do all that's necessary to respond to a change of the 
#     currently selected moment of simulation time.  This is
#     achieved simply by calling privArgand_proc again
#     (recursively!) first with the getValues option and then
#     with the replot option.
#   * destroy
#     Do all necessary cleanup operations as required when one
#     of these plot windows is destroyed
#
# * index:
#   the index number of the plot window that is to be manipulated.
#
# Other arguments can be added if required, but they aren't used
# in this version.

proc privArgand_proc {option index args} {

  global privArgand
  global vsimPriv

  switch -glob -- $option {

    getValues { # ________________________________________ getValues ___
      
      # Look in the wave window to find the relevant signal values.
      # If one or both signals are absent, return 0 and do nothing.
      # If both signals are found, return 1 (true) and update the 
      # variables privArgand($index,X) and privArgand($index,Y).
      #
      # ########## NOTE ##############
      # The code given here to search the wave tree is useful because it
      # allows the scaling of the plot display to be influenced on-the-fly
      # by the height and scale factor of the analog waveform display.
      # We pay a heavy price for this flexibility, and in most cases it
      # will be better to use the ModelSim "examine" command to find
      # the values of signals at specific times.

      # Locate the tree.
      #
      set tree $privArgand($index,tree)

      # First, locate the two signals.  They may have been moved since
      # we set up the window, and ModelSim's "find" command would alter 
      # the user's selection, so we must search the wave window by hand.
      #
      foreach {x_fullName y_fullName} $privArgand($index,fullNames) {}
      set x_index {}
      set y_index {}
      for {set i 0} {$i < [$tree size]} {incr i} {
      
        # Use "string equal" if you have Tcl/Tk 8.3 (ModelSim 5.6 or above)
        #
        if {![string compare [$tree get4 $i] $x_fullName]} {set x_index $i}
        if {![string compare [$tree get4 $i] $y_fullName]} {set y_index $i}
      
      }
      
      # Assume all's well until proven otherwise...
      #
      set valOK 1
      
      # Did we find both?
      #
      if {(![string length $x_index]) || (![string length $y_index])} {
      
        # One or both signals has been deleted, can't get its value!
        set valOK 0
      
      } else {
      
        # Both signals are still available.  Get their values.
        # We must check that the values are proper numbers, to 
        # protect against "X" values etc.  In Tcl 8.3 or higher, we
        # can do this easily with the "string is double" command.  For
        # backwards compatibility we do it a different way here:  we try
        # to increment the value by zero, and use "catch" to detect
        # whether the increment failed.
      
        # Get the X-value
        #
        set privArgand($index,X) [$tree get3 $x_index]
        
        # Check it's a number
        #
        if {[catch {incr privArgand($index,X) 0}]} {
        
          # It's not a valid number
          #
          set privArgand($index,X) 0
          set valOK 0
          
        }
        
        # Same process for the Y-value
        #
        set privArgand($index,Y) [$tree get3 $y_index]
        if {[catch {incr privArgand($index,Y)}]} {
          set privArgand($index,Y) 0
          set valOK 0
        }
        
        # If we got valid numbers, find the scale factors.
        # This we determine from the height and scale factors
        # of the analog displays.
        #
        # Find maximum of the two trace heights:
        #
        set h [$tree itemcget $x_index -height]
        set hY [$tree itemcget $y_index -height]
        if {$h < $hY} {set h $hY}
        
        # Obtain scale factors for both traces
        #
        set s [$tree itemcget $x_index -scale]
        set privArgand($index,rangeX) [expr $h/($s*2)]
        set s [$tree itemcget $y_index -scale]
        set privArgand($index,rangeY) [expr $h/($s*2)]
      }

      # Do we need to change display state?
      #
      set privArgand($index,doState) 1
      if {[info exists privArgand($index,valOK)]} {
        if {$privArgand($index,valOK) == $valOK} {
          set privArgand($index,doState) 0 
        }
      }
      set privArgand($index,valOK) $valOK

    }

    
    rep* { # _______________________________________ replot, repaint ___
    
      # Repaint or replot the window.  First, find its canvas:
      #
      set c $privArgand($index,plot)

      # Determine the window's size
      #
      set w [winfo width $c]
      set h [winfo height $c]
      
      # Determine its origin (centre)
      #
      set x0 [expr $w/2]
      set y0 [expr $h/2]
      
      # Determine half-size (minimum of w/2, h/2)
      #
      set r $x0
      if {$r > $y0} {set r $y0}
      
      # Move axes if necessary (only for repaint, not replot)
      #
      if {![string compare $option repaint]} {
        $c coords axisX [expr $x0-$r] $y0 [expr $x0+$r] $y0
        $c coords axisY $x0 [expr $y0+$r] $x0 [expr $y0-$r]
        $c coords labelX [expr $x0+$r-5] [expr $y0-5]
        $c coords labelY [expr $x0+5] [expr $y0-$r+5]
      }

      # Sort out the vector plot
      #
      set x [expr $x0 + $r*$privArgand($index,X)/$privArgand($index,rangeX)]
      set y [expr $y0 - $r*$privArgand($index,Y)/$privArgand($index,rangeY)]
      $c coords vector $x0 $y0 $x $y
      $c coords pointH [expr $x-5] $y [expr $x+5] $y
      $c coords pointV $x [expr $y-5] $x [expr $y+5]
      
      
      # Could possibly add some code here to leave trails behind,
      # making a cumulative constellation plot.  The following line
      # is a possible method, but it has a nasty bug (try resizing
      # the window when this code is in use!).  It also creates very
      # large numbers of objects on the canvas, which probably leads to
      # significantly worse performance.
      #
      # $c lower [$c create rectangle $x $y $x $y -outline darkgray]      


      # Grey-out the display if necessary
      #
      if {$privArgand($index,doState)} {
      
        # The "valOK" state flag has changed.
        # Modify the display as appropriate.
        #
        if {$privArgand($index,valOK)} {
          $c lower noData
          $c configure -background black
          $c itemconfigure noData -fill black
          $c itemconfigure pointH -fill white
          $c itemconfigure pointV -fill white
          $c itemconfigure labelX -fill white
          $c itemconfigure labelY -fill white
          $c itemconfigure vector -fill green
        } else {
          $c raise noData
          $c configure -background darkgray
          $c itemconfigure noData -fill red
          $c itemconfigure pointH -fill darkgray
          $c itemconfigure pointV -fill darkgray
          $c itemconfigure labelX -fill darkgray
          $c itemconfigure labelY -fill darkgray
          $c itemconfigure vector -fill darkgray
        }
        
        # Note that the change has been effected.
        #
        set privArgand($index,doState) 0
        
      }
      
    }
    

    trace   { # ______________________________________________ trace ___

      # Cursor was moved or swapped, or simulation time advanced.
      # Update the display.
      privArgand_proc getValues $index
      privArgand_proc replot $index
    
    }

    
    destroy { # ____________________________________________ destroy ___
    
      # Clean up all our debris
      #
      trace vdelete vsimPriv(acttime) w $privArgand($index,trace)
      
      # Really get rid of the window
      #
      destroy $privArgand($index,toplevel)
      
      # Get rid of private globals specific to this window
      #
      foreach n [array names privArgand $index,*] {
        unset privArgand($n)
      }
    
    }

   
    default { # ____________________________________ catchall default ___
    
      uplevel error "\{privArgand_proc: bad option \"$option\":  \
        must be one of getValues, repaint, trace, destroy\}"
    
    }

  }

}
