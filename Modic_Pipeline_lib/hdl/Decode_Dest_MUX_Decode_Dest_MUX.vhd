--
-- VHDL Architecture Modic_Pipeline_lib.Decode_Dest_MUX.Decode_Dest_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:15:33 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_Dest_MUX IS
  PORT (DM : IN std_logic;
    instr, zero : IN std_logic_vector(3 DOWNTO 0);
    dest : OUT std_logic_vector(3 DOWNTO 0) );
END ENTITY Decode_Dest_MUX;

--
ARCHITECTURE Decode_Dest_MUX OF Decode_Dest_MUX IS
BEGIN
  PROCESS(DM, instr)
  BEGIN
    IF DM = '0' THEN
      dest <= instr;
    ELSE
      dest <= zero;
    END IF;
  END PROCESS;
END ARCHITECTURE Decode_Dest_MUX;

