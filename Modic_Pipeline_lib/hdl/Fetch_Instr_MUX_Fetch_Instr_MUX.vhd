--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_Instr_MUX.Fetch_Instr_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 18:28:39 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_Instr_MUX IS
  PORT( mdata:IN std_logic_vector(15 DOWNTO 0);
    reset, int, mdelay, stall, jump: IN std_logic;
    instr: OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Fetch_Instr_MUX;

--
ARCHITECTURE Fetch_Instr_MUX OF Fetch_Instr_MUX IS
BEGIN
  --PROCESS(mdata, reset, int, mdelay, stall, jump)
  PROCESS(mdata, reset, int, mdelay, stall)
  BEGIN
    --IF reset = '0' and int = '0' and mdelay = '0' and stall = '0' and jump = '0' THEN
      IF reset = '0' and int = '0' and mdelay = '0' and stall = '0' THEN

      instr <= mdata;
    ELSE
      instr <= "0000000000000000";
    END IF;
  END PROCESS;
END ARCHITECTURE Fetch_Instr_MUX;

