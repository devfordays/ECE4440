--
-- VHDL Architecture lab4_lib.FetchStage.fetchArch
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 18:17:28 09/25/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY FetchStage IS
  port(maddr, inst, pcval:out std_logic_vector(15 downto 0);
    mdata, jaddr:in std_logic_vector(15 downto 0);
    mdelay, stall, reset, jump, int, clock:in std_logic := '0');
END ENTITY FetchStage;

--
ARCHITECTURE fetchArch OF FetchStage IS
  signal pc0, pcInc:std_logic_vector(15 downto 0);
  signal pc1:std_logic_vector(15 downto 0) := "0000000000000000";
  signal pcm, im, mam:std_logic_vector(1 downto 0);
  constant one:std_logic := '1';
  constant special:std_logic_vector(15 downto 0) := "1111111111111111";  
  constant nop:std_logic_vector(15 downto 0) := "0000000000000000";
  constant mem1:std_logic_vector(15 downto 0) := "0000000000000001";
  BEGIN
    
   --pc1 <= (others => '0');
    
    control:entity work.IFcontrol(behavior)
    port map(int, reset, stall, jump, mdelay, pcm, im, mam);
      -- int, reset, stall, jump, mdelay, pcm, im, mam
    
    pcmMux0:entity work.mux16bitx4(behavior)
    port map(pcInc, pc1, jaddr, mdata, pcm, pc0);
      
    PCreg:entity work.reg(behavior)
    generic map(size => 16)
    port map(pc0, pc1, clock, one);
      
    --16bit incrimentor
    plus1:entity work.inc16bit(behavior)
    port map(pc1, pcInc);
      
    imMux:entity work.mux16bitx4(behavior)
    port map(special, nop, mdata, nop, im, inst);
      
    mamMux:entity work.mux16bitx4(behavior)
    port map(nop, mem1, pc1, nop, mam, maddr);
      
    pcmMux1:entity work.mux16bitx4(behavior)
    port map(pc1, nop, jaddr, nop, pcm, pcval);
      
END ARCHITECTURE fetchArch;

