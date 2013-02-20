--
-- VHDL Architecture Modic_Pipeline_lib.Register_Tracker_Control_OR.Register_Tracker_Control_OR
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:59:36 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_Tracker_Control_OR IS
  PORT( a, b : IN std_logic;
    output : OUT std_logic );
END ENTITY Register_Tracker_Control_OR;

--
ARCHITECTURE Register_Tracker_Control_OR OF Register_Tracker_Control_OR IS
BEGIN
  PROCESS(a,b)
  BEGIN
    output <= a or b;
  END PROCESS;
END ARCHITECTURE Register_Tracker_Control_OR;

