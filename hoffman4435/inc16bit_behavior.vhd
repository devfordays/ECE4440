--
-- VHDL Architecture lab4_lib.inc16bit.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:17:21 09/25/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY inc16bit IS
  port(pc:in std_logic_vector(15 downto 0);
    pc1:out std_logic_vector(15 downto 0));
END ENTITY inc16bit;

--
ARCHITECTURE behavior OF inc16bit IS
BEGIN
  process(pc)
  variable temp:unsigned(15 downto 0);
  begin
    temp := unsigned(pc);
    temp := temp +1;
    pc1 <= std_logic_vector(temp);
  end process;
END ARCHITECTURE behavior;

