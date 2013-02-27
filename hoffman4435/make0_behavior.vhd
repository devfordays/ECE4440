--
-- VHDL Architecture processor_lib.make0.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 18:44:38 11/13/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY make0 IS
  port(a,b:in std_logic_vector(15 downto 0);
    c:out std_logic_vector(15 downto 0));
END ENTITY make0;

--
ARCHITECTURE behavior OF make0 IS
BEGIN
  process(a,b)
  --variable tmp:std_logic_vector(15 downto 0);
  begin
    c <= a or b;
  end process;
END ARCHITECTURE behavior;

