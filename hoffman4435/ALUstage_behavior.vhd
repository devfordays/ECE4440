--
-- VHDL Architecture lab6_lib.ALUstage.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 22:08:56 10/23/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ALUstage IS
  port(arg0, arg1, extra:in std_logic_vector(15 downto 0);
    destIN:in std_logic_vector(3 downto 0);
    control:in std_logic_vector(6 downto 0);
    result, extraOUT:out std_logic_vector(15 downto 0);
    destOUT:out std_logic_vector(3 downto 0);
    controlOUT:out std_logic_vector(3 downto 0);
    jump:out std_logic;
    jumpIN, clock:in std_logic);
END ENTITY ALUstage;

--
ARCHITECTURE behavior OF ALUstage IS
  signal ALUop: std_logic_vector(3 downto 0);
  signal CCRloopback, CCRwrite, destTmp:std_logic_vector(3 downto 0);
  signal controlTmp:std_logic_vector(6 downto 0);
  constant one: std_logic := '1';
  signal preResult, arg0tmp, arg1tmp:std_logic_vector(15 downto 0);
  signal preJump, jumpTmp:std_logic;
BEGIN
  
  --IDarg0reg:entity work.reg(behavior)
--  generic map (size => 16)
--  port map(arg0reg, arg0, clock, one);
  
  --taking care of a jump in the last cycle:
  destNormalize:entity work.nBitDisabler(behavior)
  generic map(size => 4)
  port map(destIN, destTmp, jumpIN);
    
  controlNormalize:entity work.nBitDisabler(behavior)
  generic map(size => 7)
  port map(control, controlTmp, jumpIN);
  
  ALUcontrol:entity work.ALUcontrol(behavior)
  port map(controlTmp, ALUop);
    
  JUMPcontrol:entity work.jumpControl(behavior)
  port map(controlTmp, destTmp, CCRloopback, jumpIN, preJump);
    
  --ALU
  arg0Normalize:entity work.nBitDisabler(behavior)
  generic map(size => 16)
  port map(arg0, arg0tmp, jumpIN);
    
  arg1Normalize:entity work.nBitDisabler(behavior)
  generic map(size => 16)
  port map(arg1, arg1tmp, jumpIN);
    
  ALU:entity work.ALU(behavior)
  port map(arg0tmp, arg1tmp, ALUop, CCRloopback, preResult, CCRwrite);
    
  CCRreg:entity work.reg(behavior)
  generic map(size => 4)
  port map(CCRwrite, CCRloopback, clock, one);
  
  ResultReg:entity work.reg(behavior)
  generic map(size => 16)
  port map(preResult, result, clock, one);
    
  JumpReg:entity work.flipflop(behavior)
  port map(preJump, jump, clock, one);
    
  controlReg:entity work.reg(behavior)
  generic map(size => 4)
  port map(controlTmp(6 downto 3), controlOUT, clock, one);
    
  destReg:entity work.reg(behavior)
  generic map(size => 4)
  port map(destTmp, destOUT, clock, one);
    
  extraOUT <= extra;
  
END ARCHITECTURE behavior;

