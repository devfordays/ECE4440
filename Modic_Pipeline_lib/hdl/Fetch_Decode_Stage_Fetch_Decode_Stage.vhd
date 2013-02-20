--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_Decode_Stage.Fetch_Decode_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 09:41:32 02/ 6/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_Decode_Stage IS
  PORT(jump, stall, mdelay, reset, int, clock: IN std_logic;
    mdata, jaddr: IN std_logic_vector(15 DOWNTO 0);
    maddr: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"
    
    
    
  );
    
END ENTITY Fetch_Decode_Stage;

--
ARCHITECTURE Fetch_Decode_Stage OF Fetch_Decode_Stage IS
  CONSTANT one : std_logic := '1';
  signal pc, pcincremented, nextpc: std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal maddr, instr, PCVal: std_logic_vector(15 DOWNTO 0) := "0000000000000000";
BEGIN
END ARCHITECTURE Fetch_Decode_Stage;

