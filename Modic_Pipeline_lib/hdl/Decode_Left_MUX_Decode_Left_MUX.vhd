--
-- VHDL Architecture Modic_Pipeline_lib.Decode_Left_MUX.Decode_Left_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:11:36 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_Left_MUX IS
  PORT (LM : IN std_logic_vector(1 DOWNTO 0);
    PC, instr, RFD1, zero : IN std_logic_vector(15 DOWNTO 0);
    left : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Decode_Left_MUX;

--
ARCHITECTURE Decode_Left_MUX OF Decode_Left_MUX IS
BEGIN
  PROCESS(LM, PC, instr, RFD1)
  BEGIN
    IF LM = "00" THEN
      left <= PC;
    ELSE 
      IF LM = "01" THEN
        left <= "00000000000" & instr(4 DOWNTO 0);
      ELSE 
        IF LM = "10" THEN
          left <= RFD1;
        ELSE 
          IF LM = "11" THEN
            left <= zero;
          END IF;
        END IF;
      END IF;
  END IF;
      
  END PROCESS;
END ARCHITECTURE Decode_Left_MUX;

