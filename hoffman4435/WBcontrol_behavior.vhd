--
-- VHDL Architecture processor_lib.WBcontrol.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 16:19:25 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY WBcontrol IS
  port(val:in std_logic_vector(15 downto 0);
    destIn, control:in std_logic_vector(3 downto 0);
    writeBack:out std_logic_vector(15 downto 0);
    destOut:out std_logic_vector(3 downto 0);
    write:out std_logic);
    
END ENTITY WBcontrol;

--
ARCHITECTURE behavior OF WBcontrol IS
BEGIN
  process(val, destIn, control)
  begin
    destOut <= destIn;
    writeBack <= val;
    write <= not(control(0));
  end process;
END ARCHITECTURE behavior;

