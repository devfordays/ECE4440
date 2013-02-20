--
-- VHDL Architecture Modic_Pipeline_lib.Register_File_TriState.Register_File_TriState
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:08:23 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_File_TriState IS
  GENERIC(size:POSITIVE := 16);
  PORT(input:IN std_logic_vector(size - 1 DOWNTO 0);
    output:OUT std_logic_vector(size - 1 DOWNTO 0);
    e:IN std_logic);
END ENTITY Register_File_TriState;

--
ARCHITECTURE Register_File_TriState OF Register_File_TriState IS
BEGIN
  PROCESS(input,e)
  CONSTANT Highz : std_logic_vector(size - 1 DOWNTO 0) := (others => 'Z');
  BEGIN
    IF e = '1' THEN
      output <= input;
    ELSE
      output <= Highz;
    END IF;
  END PROCESS;
END ARCHITECTURE Register_File_TriState;

