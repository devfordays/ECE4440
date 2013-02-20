--
-- VHDL Architecture Modic_Pipeline_lib.Mem_Multiplexor.Mem_Multiplexor
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:34:14 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Mem_Multiplexor IS
  PORT (control : IN std_logic;
    a, b : IN std_logic_vector(3 DOWNTO 0);
    output : OUT std_logic_vector(3 DOWNTO 0) );
END ENTITY Mem_Multiplexor;

--
ARCHITECTURE Mem_Multiplexor OF Mem_Multiplexor IS
BEGIN
  PROCESS(control, a, b)
  BEGIN
    IF control = '1' THEN
      output <= b;
    ELSE 
        output <= a;
    END IF;
  END PROCESS;
END ARCHITECTURE Mem_Multiplexor;

