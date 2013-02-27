--
-- VHDL Architecture processor_lib.OR1bit.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:32:56 11/12/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY OR1bit IS
  port(a,b:in std_logic;
    c:out std_logic);
END ENTITY OR1bit;

--
ARCHITECTURE behavior OF OR1bit IS
BEGIN
  process (a,b)
  begin
    c <= a or b;
  end process;
END ARCHITECTURE behavior;

