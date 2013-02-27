--
-- VHDL Architecture processor_lib.multiplex4to16.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 19:26:50 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY multiplex4to16 IS
  port(input:in std_logic_vector(3 downto 0);
    output:out std_logic_vector(15 downto 0);
    enable:in std_logic);
END ENTITY multiplex4to16;

--
ARCHITECTURE behavior OF multiplex4to16 IS
BEGIN
  process(input, enable)
  begin
    if (enable = '0') then
      output <= "0000000000000000";
    else
      if (input = "0000") then
        output <= "0000000000000001";
      elsif (input = "0001") then
        output <= "0000000000000010";
      elsif (input = "0010") then
        output <= "0000000000000100";
      elsif (input = "0011") then
        output <= "0000000000001000";
      elsif (input = "0100") then
        output <= "0000000000010000";
      elsif (input = "0101") then
        output <= "0000000000100000";
      elsif (input = "0110") then
        output <= "0000000001000000";
      elsif (input = "0111") then
        output <= "0000000010000000";
      elsif (input = "1000") then
        output <= "0000000100000000";
      elsif (input = "1001") then
        output <= "0000001000000000";
      elsif (input = "1010") then
        output <= "0000010000000000";
      elsif (input = "1011") then
        output <= "0000100000000000";
      elsif (input = "1100") then
        output <= "0001000000000000";
      elsif (input = "1101") then
        output <= "0010000000000000";
      elsif (input = "1110") then
        output <= "0100000000000000";
      else
        output <= "1000000000000000";
      end if;
    end if;
  end process;
END ARCHITECTURE behavior;

