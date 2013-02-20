--
-- VHDL Architecture Modic_Pipeline_lib.newMUX.newMUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 17:47:29 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY newMUX IS
  PORT(a, b: IN std_logic_vector(15 DOWNTO 0);
    c: OUT std_logic_vector(15 DOWNTO 0);
    stall: IN std_logic);
END ENTITY newMUX;

--
ARCHITECTURE newMUX OF newMUX IS
BEGIN 
  PROCESS(a,b,stall)
  BEGIN
    IF stall = '1' THEN
      c <= b;
    ELSE
      c <= a;
    END IF;
  END PROCESS;
END ARCHITECTURE newMUX;

