--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_Stage_test_bench.Fetch_Stage_test_bench
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 16:21:21 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_Stage_test_bench IS
END ENTITY Fetch_Stage_test_bench;

--
ARCHITECTURE Fetch_Stage_test_bench OF Fetch_Stage_test_bench IS
  signal maddr, inst, pcval : std_logic_vector(15 DOWNTO 0); 
  signal mdata, jaddr : std_logic_vector(15 DOWNTO 0);
  signal mdelay, stall, jump, int, clock : std_logic := '0';
  signal reset : std_logic := '1';
BEGIN
  dut : entity work.Fetch_Stage(Fetch_Stage)
    port map (maddr, inst, pcval, mdata, jaddr, mdelay, stall, reset, jump, int, clock);
      
  clock <= not clock after 100 ns;
  reset <= '0' after 100 ns;
  
  
  stimulus : process is
  BEGIN
    
    wait for 1 ns;
    
    IF pcval = "0000000000000000" THEN
      mdata <= "0000000000000100";
    wait for 100 ns;
    END IF;
    
    IF pcval = "0000000000000100" THEN
      mdata <= "0101010101010101";
      wait for 100 ns;
    END IF;
    
    IF pcval = "0000000000000101" THEN
      mdata <= "1111111111111111";
      wait for 100 ns;
    END IF;
    
    --------------------------------------------
    -- Test jump
    IF pcval = "0000000000000110" THEN
      jump <= '1';
      jaddr <= "1000000000000001";
      wait for 100 ns;
      jump <= '0';
    END IF;
    
    IF pcval = "1000000000000001" THEN
      mdata <= "0101010101010101";
      wait for 100 ns;
    END IF;
    ---------------------------------------------
    
    ---------------------------------------------
    -- Test mdelay
    IF pcval = "1000000000000010" THEN
      mdelay <= '1';
      wait for 200 ns;
      mdelay <= '0';
    END IF;
    
    IF pcval = "1000000000000010" THEN
      mdata <= "1111000101010101";
      wait for 100 ns;
    END IF;
    
    
    
    
  END PROCESS stimulus;
END ARCHITECTURE Fetch_Stage_test_bench;

