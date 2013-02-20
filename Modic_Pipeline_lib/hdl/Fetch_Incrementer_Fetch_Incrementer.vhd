--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_Incrementer.Fetch_Incrementer
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 18:52:46 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_Incrementer IS
  PORT(pc:IN std_logic_vector(15 DOWNTO 0);
    pcincremented: OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Fetch_Incrementer;

--
ARCHITECTURE Fetch_Incrementer OF Fetch_Incrementer IS
BEGIN
  PROCESS(pc)
  VARIABLE localpc:unsigned(15 DOWNTO 0);
  BEGIN
    localpc := unsigned(pc);
    localpc := localpc + 1;
    pcincremented <= std_logic_vector(localpc);
  END PROCESS;
    
END ARCHITECTURE Fetch_Incrementer;

