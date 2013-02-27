--
-- VHDL Architecture lab6_lib.ALUcontrol.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 19:31:22 10/23/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ALUcontrol IS
  port(control:in std_logic_vector(6 downto 0);
    aluOP:out std_logic_vector(3 downto 0));
END ENTITY ALUcontrol;

--
ARCHITECTURE behavior OF ALUcontrol IS
BEGIN
  process(control)
    variable tmpOP :std_logic_vector(3 downto 0) := "0000";
  begin
    tmpOP(2 downto 0) := control(2 downto 0);
    if(control(6 downto 4) = "110") then
      tmpOP(3) := '1';
    end if;
    aluOP <= tmpOP;
  end process;
END ARCHITECTURE behavior;

