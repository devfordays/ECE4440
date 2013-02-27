--
-- VHDL Architecture processor_lib.memStage.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 14:20:12 10/30/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY memStage IS
  port(result, extra:in std_logic_vector(15 downto 0);
    control, destIN:in std_logic_vector(3 downto 0);
    --jumpIN:in std_logic;
    memIn:in std_logic_vector(15 downto 0);
    read, write:out std_logic;
    memLoc, memOut:out std_logic_vector(15 downto 0);
    writeback:out std_logic_vector(15 downto 0);
    controlOUT, destOUT:out std_logic_vector(3 downto 0);
    --jumpOUT:out std_logic;
    clock:in std_logic);
END ENTITY memStage;

--
ARCHITECTURE behavior OF memStage IS
  constant one:std_logic := '1';
  signal tempWB:std_logic_vector(15 downto 0);
  signal tmpCTRL: std_logic_vector(3 downto 0);
BEGIN
  
  wbReg:entity work.reg(behavior)
  generic map(size => 16)
  port map(tempWB, writeback, clock, one);
    
  controlReg:entity work.reg(behavior)
  generic map(size => 4)
  port map(tmpCTRL, controlOUT, clock, one);
    
  destReg:entity work.reg(behavior)
  generic map(size => 4)
  port map(destIN, destOUT, clock, one);
    
  --jumpReg:entity work.dflip(behavior)
--  port map(jumpIN, jumpOUT, clock, one);
    
  memCtrl:entity work.memControl(behavior)
  port map(result, extra, control, read, write, memLoc, memOut, memIn, tempWB, tmpCTRL);
    
    
    -- port(result, extra:in std_logic_vector(15 downto 0);
--    control:in std_logic_vector(3 downto 0);
--    read, write:out std_logic;
--    memLoc, memOut:out std_logic_vector(15 downto 0);
--    memIn:in std_logic_vector(15 downto 0);
--    writeback:out std_logic_vector(15 downto 0);
--    controlOUT:out std_logic_vector(3 downto 0));
    
END ARCHITECTURE behavior;

