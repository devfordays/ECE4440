--
-- VHDL Architecture Modic_Pipeline_lib.nand_gate.nand_gate
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:06:23 03/ 5/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY nand_gate IS
  PORT(a : IN std_logic;
    b : IN std_logic;
    c : OUT std_logic
  );
END ENTITY nand_gate;

--
ARCHITECTURE nand_gate OF nand_gate IS
BEGIN
  PROCESS(a, b)
  BEGIN 
    c <= a NAND b;
  END PROCESS;
END ARCHITECTURE nand_gate;

