--
-- VHDL Architecture Modic_Pipeline_lib.Execute_Stage_ChangeNames.Execute_Stage_ChangeNames
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 08:13:40 02/ 6/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Execute_Stage_ChangeNames IS
  GENERIC(size:POSITIVE := 16);
  PORT (input:IN std_logic_vector(size - 1 DOWNTO 0);
    output:OUT std_logic_vector(size - 1 DOWNTO 0) );
END ENTITY Execute_Stage_ChangeNames;

--
ARCHITECTURE Execute_Stage_ChangeNames OF Execute_Stage_ChangeNames IS
BEGIN
  PROCESS(input)
  BEGIN
      output <= input;
  END PROCESS;
END ARCHITECTURE Execute_Stage_ChangeNames;

