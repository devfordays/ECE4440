--
-- VHDL Architecture processor_lib.or16x16.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:17:41 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY or16x16 IS
  port(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15:std_logic_vector(15 downto 0);
    output:out std_logic_vector(15 downto 0));
END ENTITY or16x16;

--
ARCHITECTURE behavior OF or16x16 IS
BEGIN
  process(in0,in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15)
  begin
    output <= (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15);
  end process;
END ARCHITECTURE behavior;

