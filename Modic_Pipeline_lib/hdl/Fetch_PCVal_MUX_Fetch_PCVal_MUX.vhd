--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_PCVal_MUX.Fetch_PCVal_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 18:38:55 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_PCVal_MUX IS
  PORT(pc, jaddr: IN std_logic_vector(15 DOWNTO 0);
    jump: IN std_logic;
    PCVal: OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Fetch_PCVal_MUX;

--
ARCHITECTURE Fetch_PCVal_MUX OF Fetch_PCVal_MUX IS
BEGIN
  --PROCESS(pc, jaddr, jump)
  PROCESS(pc)
  BEGIN
    --IF jump = '0' THEN 
      PCVal <= pc;
    --ELSE
      --PCVal <= jaddr;
    --END IF;
  END PROCESS;
      
END ARCHITECTURE Fetch_PCVal_MUX;

