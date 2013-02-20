--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_PC_MUX.Fetch_PC_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 18:59:11 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_PC_MUX IS
  PORT( mdata, jaddr, pc, pcincremented: IN std_logic_vector(15 DOWNTO 0);    
  jump, mdelay, stall, reset, int: IN std_logic;
  nextpc: OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Fetch_PC_MUX;

--
ARCHITECTURE Fetch_PC_MUX OF Fetch_PC_MUX IS
BEGIN
  PROCESS(mdata, jaddr, pc, pcincremented, jump, mdelay, stall)
  BEGIN
    IF (reset = '1') or (int = '1') THEN
      nextpc <= mdata;
    ELSE
      IF jump = '1' THEN
        nextpc <= jaddr;
      ELSE
        IF (mdelay = '0') and (stall = '0') THEN
          nextpc <= pcincremented;
        ELSE
          nextpc <= pc;
        END IF;
      END IF;
    END IF;
      
  END PROCESS;
END ARCHITECTURE Fetch_PC_MUX;

