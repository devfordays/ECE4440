--
-- VHDL Architecture Modic_Pipeline_lib.clock.clock
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 12:18:04 02/27/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY clock IS
  PORT( reset : OUT std_logic := '1';
    clk : OUT std_logic := '0' );
END ENTITY clock;

--
ARCHITECTURE clock OF clock IS
BEGIN
  reset <= '0' after 50 ns;
  clk <= not clk after 100 ns;
END ARCHITECTURE clock;

