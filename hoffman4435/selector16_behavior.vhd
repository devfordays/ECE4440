--
-- VHDL Architecture processor_lib.selector16.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 19:09:30 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY selector16 IS
  port( input:in std_logic_vector(15 downto 0);
    output: out std_logic_vector(15 downto 0);
    enable:in std_logic);
END ENTITY selector16;

--
ARCHITECTURE behavior OF selector16 IS
BEGIN
  process(input, enable)
  constant zero:std_logic_vector(15 downto 0) := "0000000000000000";
  begin
    if(enable = '1') then
      output <= input;
    else
      output <= zero;
    end if;
  end process;
END ARCHITECTURE behavior;

