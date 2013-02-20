--
-- VHDL Architecture Modic_Pipeline_lib.MultiInt.MultiInt
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 16:18:24 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY MultiInt IS
  PORT( pc1:IN std_logic_vector(15 DOWNTO 0);
    int:IN std_logic;
    pc2:OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY MultiInt;

--
ARCHITECTURE MultiInt OF MultiInt IS
BEGIN
  PROCESS(int, pc1)
  BEGIN
    IF int = '0' THEN
      pc2 <= pc1;
    ELSE
      pc2 <= "0000000000000001";
    END IF;
    END PROCESS;
END ARCHITECTURE MultiInt;

