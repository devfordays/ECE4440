--
-- VHDL Architecture Modic_Pipeline_lib.new_nand_gate.new_nand_gate
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 12:39:31 03/15/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY new_nand_gate IS
  PORT(a : IN std_logic;
    b : IN std_logic;
    c : OUT std_logic;
    d : IN std_logic
  );
END ENTITY new_nand_gate;

--
ARCHITECTURE new_nand_gate OF new_nand_gate IS
BEGIN
  PROCESS(a, b, d)
  BEGIN
  IF d = '0' THEN
    c <= '0';
  ELSE 
    c <= a NAND b;
  END IF;
  END PROCESS;
END ARCHITECTURE new_nand_gate;

