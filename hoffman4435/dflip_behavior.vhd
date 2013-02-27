--
-- VHDL Architecture lab2_lib.dflip.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 14:33:59 09/18/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY dflip IS
  port(a:in std_logic;
    b:out std_logic;
    c, e:in std_logic);
END ENTITY dflip;

--
ARCHITECTURE behavior OF dflip IS
BEGIN
  process(c)
  begin
    if(rising_edge(c) and (e='1')) then
      b <= a;
    end if;
  end process;
END ARCHITECTURE behavior;

