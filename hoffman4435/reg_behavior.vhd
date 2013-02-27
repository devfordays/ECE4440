--
-- VHDL Architecture lab2_lib.reg.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 14:06:30 09/18/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY reg IS
  GENERIC(size:POSITIVE :=8);
  port(a:in std_logic_vector(size-1 downto 0);
    b:out std_logic_vector(size-1 downto 0);
    c, e:in std_logic);
END ENTITY reg;

--
ARCHITECTURE behavior OF reg IS
BEGIN
  process(c)
  begin
    if(rising_edge(c) and (e='1')) then
      b <= a;
    end if;
  end process;
END ARCHITECTURE behavior;

