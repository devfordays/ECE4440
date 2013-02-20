--
-- VHDL Architecture Modic_Pipeline_lib.Mem_new_MUX.Mem_new_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 13:43:51 11/23/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Mem_new_MUX IS
  PORT (R : IN std_logic;
    Shift : IN std_logic_vector(4 DOWNTO 0);
    result, mdata, extra : IN std_logic_vector(15 DOWNTO 0);
    data : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Mem_new_MUX;

--
ARCHITECTURE Mem_new_MUX OF Mem_new_MUX IS
BEGIN
  PROCESS(R, Shift, result, mdata, extra)
  BEGIN
    IF (Shift = "00001")  or (Shift = "00010") THEN
      data <= extra;
    ELSE
      IF R = '0' THEN 
        data <= result;
      ELSE
        data <= mdata;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE Mem_new_MUX;

