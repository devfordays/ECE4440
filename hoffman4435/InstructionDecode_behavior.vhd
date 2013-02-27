--
-- VHDL Architecture lab5_lib.IFstage.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 17:50:04 10/16/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY InstructionDecode IS
  port(inst, pc, rfd0, rfd1:in std_logic_vector(15 downto 0);
    rfa0, rfa1, writeAddr:out std_logic_vector(3 downto 0);
    read0, read1, write:out std_logic;
    dirty:in std_logic;
    arg0, arg1, extra:out std_logic_vector(15 downto 0);
    dest:out std_logic_vector(3 downto 0);
    control:out std_logic_vector(6 downto 0);
    jump, clock:in std_logic);
END ENTITY InstructionDecode;

--
ARCHITECTURE behavior OF InstructionDecode IS
  signal arg0reg, arg1reg, extraReg: std_logic_vector(15 downto 0);
  signal destReg:std_logic_vector(3 downto 0);
  signal controlReg:std_logic_vector(6 downto 0);
  signal one:std_logic := '1';
BEGIN
  
  decode:entity work.IDcontrol(behavior)
  port map(inst, pc, rfd0, rfd1, rfa0, rfa1, writeAddr, read0, read1, write, arg0reg, arg1reg, extraReg, destReg, controlReg, dirty, jump);
    
  IDarg0reg:entity work.reg(behavior)
  generic map (size => 16)
  port map(arg0reg, arg0, clock, one);
    
  IDarg1reg:entity work.reg(behavior)
  generic map (size => 16)
  port map(arg1reg, arg1, clock, one);
    
  IDextraReg:entity work.reg(behavior)
  generic map (size => 16)
  port map(extraReg, extra, clock, one);
    
  IDdestReg:entity work.reg(behavior)
  generic map (size => 4)
  port map(destReg, dest, clock, one);
    
  IDcontrolReg:entity work.reg(behavior)
  generic map (size => 7)
  port map(controlReg, control, clock, one);
  
END ARCHITECTURE behavior;

