--
-- VHDL Architecture lab4_lib.mux4.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 18:30:53 09/25/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mux16bitx4 IS
  port( in0, in1, in2, in3:in std_logic_vector(15 downto 0);
    inselect:in std_logic_vector(1 downto 0);
    output:out std_logic_vector(15 downto 0));
END ENTITY mux16bitx4;

--
ARCHITECTURE behavior OF mux16bitx4 IS
BEGIN
  process(in0, in1, in2, in3, inselect)
  begin
    if (inselect = "00") then
      output <= in0;
    elsif (inselect ="01") then
      output <= in1;
    elsif (inselect = "10") then
      output <= in2;
    else
      output <= in3;
    end if;
  end process;
END ARCHITECTURE behavior;

