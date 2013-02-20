--
-- VHDL Architecture Modic_Pipeline_lib.Pipeline_test_bench.Pipeline_test_bench
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 22:06:08 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Pipeline_test_bench IS
END ENTITY Pipeline_test_bench;

--
ARCHITECTURE Pipeline_test_bench OF Pipeline_test_bench IS
  signal clock : std_logic := '0';
  signal reset : std_logic := '1';
BEGIN
  
  dut : entity work.Five_Stage_Pipeline(Five_Stage_Pipeline)
    port map (reset, clock);
      
  --reset <= '0' after 100 ns;
  reset <= '0' after 50 ns;
  clock <= not clock after 100 ns;
  
END ARCHITECTURE Pipeline_test_bench;

