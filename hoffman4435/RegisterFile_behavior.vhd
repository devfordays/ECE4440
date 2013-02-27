--
-- VHDL Architecture processor_lib.RegisterFile.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 16:48:45 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY RegisterFile IS 
  port(WBin:in std_logic_vector(15 downto 0);
    WBaddr:in std_logic_vector(3 downto 0);
    write:in std_logic;
    ra0, ra1:in std_logic_vector(3 downto 0);
    rd0, rd1:out std_logic_vector(15 downto 0);
    r0, r1:in std_logic;  --just in case only 1 read needs to be done
    clock:in std_logic);
END ENTITY RegisterFile;

--
ARCHITECTURE behavior OF RegisterFile IS
  signal writeVect, readVect0, readVect1:std_logic_vector(15 downto 0);
  signal r0d0, r1d0, r2d0, r3d0, r4d0, r5d0, r6d0, r7d0, r8d0, r9d0, r10d0, r11d0, r12d0, r13d0, r14d0, r15d0:std_logic_vector(15 downto 0);
  signal r0d1, r1d1, r2d1, r3d1, r4d1, r5d1, r6d1, r7d1, r8d1, r9d1, r10d1, r11d1, r12d1, r13d1, r14d1, r15d1:std_logic_vector(15 downto 0);
BEGIN
  
  --set up Muxes  
  writeSelect:entity work.multiplex4to16(behavior)
  port map(WBaddr, writeVect, write);
    
  readSelect0:entity work.multiplex4to16(behavior)
  port map(ra0, readVect0, r0);
    
  readSelect1:entity work.multiplex4to16(behavior)
  port map(ra1, readVect1, r1);
    
  --set up register Rows
  --din:in std_logic_vector(15 downto 0);
--    write, select0, select1:in std_logic;
--    dout0, dout1:out std_logic_vector(15 downto 0);
--    clock:in std_logic);
  regRow0:entity work.regFileRow(behavior)
  port map(WBin, writeVect(0), readVect0(0), readVect1(0), r0d0, r0d1, clock);
  
  regRow1:entity work.regFileRow(behavior)
  port map(WBin, writeVect(1), readVect0(1), readVect1(1), r1d0, r1d1, clock);
  
  regRow2:entity work.regFileRow(behavior)
  port map(WBin, writeVect(2), readVect0(2), readVect1(2), r2d0, r2d1, clock);
    
  regRow3:entity work.regFileRow(behavior)
  port map(WBin, writeVect(3), readVect0(3), readVect1(3), r3d0, r3d1, clock);
  
  regRow4:entity work.regFileRow(behavior)
  port map(WBin, writeVect(4), readVect0(4), readVect1(4), r4d0, r4d1, clock);
  
  regRow5:entity work.regFileRow(behavior)
  port map(WBin, writeVect(5), readVect0(5), readVect1(5), r5d0, r5d1, clock);
  
  regRow6:entity work.regFileRow(behavior)
  port map(WBin, writeVect(6), readVect0(6), readVect1(6), r6d0, r6d1, clock);
  
  regRow7:entity work.regFileRow(behavior)
  port map(WBin, writeVect(7), readVect0(7), readVect1(7), r7d0, r7d1, clock);
  
  regRow8:entity work.regFileRow(behavior)
  port map(WBin, writeVect(8), readVect0(8), readVect1(8), r8d0, r8d1, clock);
  
  regRow9:entity work.regFileRow(behavior)
  port map(WBin, writeVect(9), readVect0(9), readVect1(9), r9d0, r9d1, clock);
  
  regRow10:entity work.regFileRow(behavior)
  port map(WBin, writeVect(10), readVect0(10), readVect1(10), r10d0, r10d1, clock);
  
  regRow11:entity work.regFileRow(behavior)
  port map(WBin, writeVect(11), readVect0(11), readVect1(11), r11d0, r11d1, clock);
    
  regRow12:entity work.regFileRow(behavior)
  port map(WBin, writeVect(12), readVect0(12), readVect1(12), r12d0, r12d1, clock);
  
  regRow13:entity work.regFileRow(behavior)
  port map(WBin, writeVect(13), readVect0(13), readVect1(13), r13d0, r13d1, clock);
  
  regRow14:entity work.regFileRow(behavior)
  port map(WBin, writeVect(14), readVect0(14), readVect1(14), r14d0, r14d1, clock);
    
  regRow15:entity work.regFileRow(behavior)
  port map(WBin, writeVect(15), readVect0(15), readVect1(15), r15d0, r15d1, clock);
    
  normalized0:entity work.or16x16(behavior)
  port map(r0d0, r1d0, r2d0, r3d0, r4d0, r5d0, r6d0, r7d0, r8d0, r9d0, r10d0, r11d0, r12d0, r13d0, r14d0, r15d0, rd0);
    
  normalized1:entity work.or16x16(behavior)
  port map(r0d1, r1d1, r2d1, r3d1, r4d1, r5d1, r6d1, r7d1, r8d1, r9d1, r10d1, r11d1, r12d1, r13d1, r14d1, r15d1, rd1);
  
END ARCHITECTURE behavior;

