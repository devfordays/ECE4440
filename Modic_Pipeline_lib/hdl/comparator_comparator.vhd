--
-- VHDL Architecture Modic_Pipeline_lib.comparator.comparator
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:22:41 03/ 5/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY comparator IS
  PORT(a : IN std_logic_vector(12 DOWNTO 0);
    b : IN std_logic_vector(12 DOWNTO 0);
    c : OUT std_logic
  );
END ENTITY comparator;

--
ARCHITECTURE comparator OF comparator IS
BEGIN
  PROCESS(a, b)
  BEGIN
    IF a = b THEN
      c <= '1';
    ELSE
      c <= '0';
    END IF;
    
    END PROCESS;
END ARCHITECTURE comparator;

