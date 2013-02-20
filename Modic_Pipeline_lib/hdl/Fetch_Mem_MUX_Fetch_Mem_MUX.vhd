--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_Mem_MUX.Fetch_Mem_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 18:18:28 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_Mem_MUX IS
  PORT( pc: IN std_logic_vector(15 DOWNTO 0);
    reset, int: IN std_logic;
    maddr : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Fetch_Mem_MUX;

--
ARCHITECTURE Fetch_Mem_MUX OF Fetch_Mem_MUX IS
BEGIN
  PROCESS(pc, reset, int)
  BEGIN
    IF reset = '1' THEN
      maddr <= "0000000000000000";
    ELSE
      IF int = '1' THEN
        maddr <= "0000000000000001";
      ELSE
        maddr <= pc;
      END IF;
    END IF;
  END PROCESS;
          
END ARCHITECTURE Fetch_Mem_MUX;

