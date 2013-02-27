--
-- VHDL Architecture processor_lib.nBitEnabler.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 19:38:23 11/12/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY nBitDisabler IS
  GENERIC(size:POSITIVE :=8);
  port(a:in std_logic_vector(size-1 downto 0);
    b:out std_logic_vector(size-1 downto 0);
    disable:in std_logic);
END ENTITY nBitDisabler;

--
ARCHITECTURE behavior OF nBitDisabler IS
BEGIN
  process(a, disable)
  constant zero:std_logic_vector(size-1 downto 0) := (others => '0');
  begin
    if(disable = '1') then
      b <= zero;
    else
      b <= a;
    end if;
  end process;
END ARCHITECTURE behavior;

