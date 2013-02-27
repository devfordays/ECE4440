--
-- VHDL Architecture processor_lib.WriteBack.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 16:40:11 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY WriteBack IS
  port(val:in std_logic_vector(15 downto 0);
    destIn, control:in std_logic_vector(3 downto 0);
    writeBack:out std_logic_vector(15 downto 0);
    destOut:out std_logic_vector(3 downto 0);
    write:out std_logic);
END ENTITY WriteBack;

--
ARCHITECTURE behavior OF WriteBack IS
BEGIN
  
  --dont need a register because the register file IS the register
  
  wbControl:entity work.WBcontrol(behavior)
  port map(val, destIn, control, writeBack, destOut, write);
    
END ARCHITECTURE behavior;

