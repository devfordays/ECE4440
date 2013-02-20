--
-- VHDL Architecture Modic_Pipeline_lib.Register_Tracker.Register_Tracker
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:56:54 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_Tracker IS
  PORT( RA0, RA1, ResA, WA: IN std_logic_vector(3 DOWNTO 0);
    R0, R1, W, WWB, clock: IN std_logic;
    hold: OUT std_logic := '0' );
END ENTITY Register_Tracker;

--
ARCHITECTURE Register_Tracker OF Register_Tracker IS
  CONSTANT one : std_logic := '1';
  signal register_reserve_output : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal register_reserve_input : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal aout, bout : std_logic := '0';
BEGIN
  MUXA : entity work.Register_Tracker_Control_MUX(Register_Tracker_Control_MUX)
    port map(register_reserve_output, RA0, R0, aout);
      
  MUXB : entity work.Register_Tracker_Control_MUX(Register_Tracker_Control_MUX)
    port map(register_reserve_output, RA1, R1, bout);
      
  ORA : entity work.Register_Tracker_Control_OR(Register_Tracker_Control_OR)
    port map(aout, bout, hold);
      
  Reg16 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map(register_reserve_input, register_reserve_output, clock, one); 
      
  Logic : entity work.Register_Tracker_Control_Logic(Register_Tracker_Control_Logic)
    port map(ResA, WA, register_reserve_output, W, WWB, register_reserve_input);
  

END ARCHITECTURE Register_Tracker;

