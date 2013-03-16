--
-- VHDL Architecture Modic_Pipeline_lib.InstructionCache_stall.InstructionCache_stall
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 21:55:47 03/ 5/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY InstructionCache_stall IS
  PORT(read : IN std_logic;
    reset : IN std_logic;
    stall : OUT std_logic
  );
END ENTITY InstructionCache_stall;

--
ARCHITECTURE InstructionCache_stall OF InstructionCache_stall IS
BEGIN
  PROCESS(read, reset)
  BEGIN
    IF reset = '1' OR read = 'U' THEN
      stall <= '0';
    ELSE
      stall <= read;
    END IF;
  END PROCESS;
      
END ARCHITECTURE InstructionCache_stall;

