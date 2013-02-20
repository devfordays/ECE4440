--
-- VHDL Architecture Modic_Pipeline_lib.Reg.Reg
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 16:14:39 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Reg IS
  GENERIC(size:POSITIVE := 16);
  PORT(input:IN std_logic_vector(size - 1 DOWNTO 0);
    output:OUT std_logic_vector(size - 1 DOWNTO 0) := (others => '0');
    --output:OUT std_logic_vector(size - 1 DOWNTO 0);
    c,e:IN std_logic);
END ENTITY Reg;

--
ARCHITECTURE Reg OF Reg IS
BEGIN
  PROCESS(c)
  BEGIN
    IF(rising_edge(c) AND (e = '1')) THEN
      output <= input;
    END IF;
  END PROCESS;
END ARCHITECTURE Reg;

