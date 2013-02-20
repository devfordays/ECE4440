--
-- VHDL Architecture Modic_Pipeline_lib.Multiplex.Multiplex
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 16:20:12 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Multiplex IS
  PORT( pc2:IN std_logic_vector(15 DOWNTO 0);
    reset:IN std_logic;
    maddr:OUT std_logic_vector(15 DOWNTO 0);
    pcval:OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Multiplex;

--
ARCHITECTURE Multiplex OF Multiplex IS
BEGIN
  PROCESS(reset, pc2)
  BEGIN
    IF reset = '0' THEN
      pcval <= pc2;
      maddr <= pc2;
    ELSE
      pcval <= "0000000000000000";
      maddr <= "0000000000000000";
    END IF;
    END PROCESS;
END ARCHITECTURE Multiplex;

