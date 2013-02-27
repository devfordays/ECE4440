--
-- VHDL Architecture lab6_lib.jumpControl.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 19:50:03 10/23/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY jumpControl IS
  port(control:in std_logic_vector(6 downto 0);
    dest, CCR:in std_logic_vector(3 downto 0);
   -- test:out std_logic_vector(3 downto 0);
   jumpIN:std_logic;
    jmp:out std_logic);
END ENTITY jumpControl;

--
ARCHITECTURE behavior OF jumpControl IS
BEGIN
  process(control, dest, CCR)
  variable tmpAND: std_logic_vector(5 downto 0);
  variable tmpXOR: std_logic;
  variable tmpJMP: std_logic;
  begin
    if (jumpIN = '1') then
      tmpJMP := '0';
    else
      if(control(6 downto 4) = "111") then
        tmpAND(3 downto 0) := dest and CCR;
        --test <= tmpAnd(3 downto 0);
        tmpXOR := dest(3) xor dest(2) xor dest(1) xor dest(0);
        tmpXOR := not tmpXOR;
        tmpJMP := tmpXOR or tmpAND(3) or tmpAND(2) or tmpAND(1) or tmpAND(0) or control(3);
      else
        tmpJMP := '0';
      end if;
    end if;
    jmp <= tmpJMP;
  end process;
END ARCHITECTURE behavior;

