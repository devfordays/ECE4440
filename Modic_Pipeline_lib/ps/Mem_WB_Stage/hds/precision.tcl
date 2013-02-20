## SETUP
puts "Info: HDL Designer Synthesis run started"

## Set current project and folder
if {[string length [info commands new_project]]} {
   new_project -name Mem_WB_Stage -folder "C:/Users/Owner/Desktop/Past Classes/ECE 4435/HDS/Modic_Pipeline/Modic_Pipeline_lib/ps/Mem_WB_Stage"
} else {
   set_working_dir "C:/Users/Owner/Desktop/Past Classes/ECE 4435/HDS/Modic_Pipeline/Modic_Pipeline_lib/ps/Mem_WB_Stage"
}

## Implementation settings
MGS_Gui::notify_gui lock
setup_design -manufacturer "Altera" -family "Cyclone II" -part "EP2C70F896I" -speed "8" 

## Design Settings
setup_design -addio=true
setup_design -safe_fsm_type=none
setup_design -retiming=false
if {[catch {setup_design -2004c_compile_mode=false}]} {
catch {setup_design -frontend_2004=false}
}

setup_design -vhdl=false
setup_design -verilog=false
setup_design -edif=true

## Read in source files
catch {source "C:/Users/Owner/Desktop/Past Classes/ECE 4435/HDS/Modic_Pipeline/Modic_Pipeline_lib/ps/Mem_WB_Stage/hds/add_files.tcl"}
MGS_Gui::notify_gui unlock

## Compile & Synthesize
MGS_Gui::notify_gui lock
if {[catch compile]} {
   MGS_Gui::notify_gui unlock
} elseif {[catch synthesize]} {
   MGS_Gui::notify_gui unlock
} else {
   MGS_Gui::notify_gui unlock
}

puts "Info: HDL Designer Synthesis run finished"


