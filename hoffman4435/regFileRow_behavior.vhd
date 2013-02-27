--
-- VHDL Architecture processor_lib.regFileRow.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 19:14:53 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY regFileRow IS
  port(din:in std_logic_vector(15 downto 0);
    write, select0, select1:in std_logic;
    dout0, dout1:out std_logic_vector(15 downto 0);
    clock:in std_logic);
END ENTITY regFileRow;

--
ARCHITECTURE behavior OF regFileRow IS
  signal regOut:std_logic_vector(15 downto 0) := "0000000000000000";
BEGIN
  
  regRow:entity work.reg(behavior)
  generic map(size => 16)
  port map(din, regOut, clock, write);
    
  sel0:entity work.selector16(behavior)
  port map(regOut, dout0, select0);
    
  sel1:entity work.selector16(behavior)
  port map(regOut, dout1, select1);
  
END ARCHITECTURE behavior;

