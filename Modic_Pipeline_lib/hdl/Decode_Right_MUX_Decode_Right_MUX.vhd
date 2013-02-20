--
-- VHDL Architecture Modic_Pipeline_lib.Decode_Right_MUX.Decode_Right_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:12:52 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_Right_MUX IS
  PORT (RM : IN std_logic_vector(1 DOWNTO 0);
    instr, zero, RFD0 : IN std_logic_vector(15 DOWNTO 0);
    right : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Decode_Right_MUX;

--
ARCHITECTURE Decode_Right_MUX OF Decode_Right_MUX IS
BEGIN
  PROCESS(RM, instr, RFD0)
  BEGIN
    IF RM = "00" THEN
      IF instr(7) = '0' THEN
        right <= "00000000" & instr(7 DOWNTO 0);
      ELSE
        right <= "11111111" & instr(7 DOWNTO 0);
      END IF;
    ELSE
      IF RM = "01" THEN
        right <= zero;
      ELSE
        IF RM = "10" THEN
          right <= RFD0;
        END IF;
      END IF;
    END IF;
  END PROCESS;
END ARCHITECTURE Decode_Right_MUX;

