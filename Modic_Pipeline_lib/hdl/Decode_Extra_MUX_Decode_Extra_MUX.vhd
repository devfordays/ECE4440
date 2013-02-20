--
-- VHDL Architecture Modic_Pipeline_lib.Decode_Extra_MUX.Decode_Extra_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:14:34 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_Extra_MUX IS
  PORT (EM : IN std_logic_vector(1 DOWNTO 0);
    instr, RFD1, zero : IN std_logic_vector(15 DOWNTO 0);
    extra : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Decode_Extra_MUX;

--
ARCHITECTURE Decode_Extra_MUX OF Decode_Extra_MUX IS
BEGIN
  PROCESS(EM, instr, RFD1)
  BEGIN
  IF EM = "00" THEN
    IF instr(7) = '0' THEN
      extra <= "00000000" & instr(7 DOWNTO 0);
    ELSE
      extra <= "11111111" & instr(7 DOWNTO 0);
    END IF;
  ELSE
    IF EM = "01" THEN
      extra <= instr(7 DOWNTO 0) & RFD1(7 DOWNTO 0);
    ELSE
      IF EM = "10" THEN
        extra <= RFD1;
      ELSE
        IF EM = "11" THEN
          extra <= zero;
        END IF;
      END IF;
    END IF;
  END IF;
    
    END PROCESS;
END ARCHITECTURE Decode_Extra_MUX;

