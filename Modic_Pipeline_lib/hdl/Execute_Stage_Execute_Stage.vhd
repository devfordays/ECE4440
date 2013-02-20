--
-- VHDL Architecture Modic_Pipeline_lib.Execute_Stage.Execute_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:04:16 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Execute_Stage IS
  PORT( extra, left, right:IN std_logic_vector(15 DOWNTO 0);
    control_vector:IN std_logic_vector(17 DOWNTO 0);
    dest:IN std_logic_vector(3 DOWNTO 0);
    control: OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000";
    clock:IN std_logic;
    jaddr:OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    result:OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    destination:OUT std_logic_vector(3 DOWNTO 0) := "0000";
    extradata:OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    j:OUT std_logic := '0' );
END ENTITY Execute_Stage;

--
ARCHITECTURE Execute_Stage OF Execute_Stage IS
  CONSTANT one : std_logic := '1';
  signal leftdata, rightdata : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal condition, condition_code : std_logic_vector(3 DOWNTO 0) := "0000";
BEGIN
  --jaddr <= result;

    changingNames1 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
    GENERIC MAP(size => 16)
    port map (extra, extradata);
  
  --extraRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (extra, extradata, clock, one);
      
  --leftRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (left, leftdata, clock, one);
      
  --rightRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (right, rightdata, clock, one);
      
  --controlRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 18)
    --port map (control_vector, control, clock, one);
      changingNames2 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
      GENERIC MAP(size => 18)
      port map (control_vector, control);
      
  conditionRegister : entity work.Reg(Reg)
    GENERIC MAP(size => 4)
    port map (condition_code, condition, clock, one);
      
  --destRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 4)
    --port map (dest, destination, clock, one);
      changingNames3 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
      GENERIC MAP(size => 4)
      port map (dest, destination);
      
  --ALUunit : entity work.Execute_ALU(Execute_ALU)
    --port map (leftdata, rightdata, control, condition, result, condition_code);
   ALUunit : entity work.Execute_ALU(Execute_ALU)
    port map (left, right, control_vector, condition, result, condition_code);
      
    --JumpDecider : entity work.Execute_JumpUnit(Execute_JumpUnit)
    --port map(condition_code, destination, control, j);
    JumpDecider : entity work.Execute_JumpUnit(Execute_JumpUnit)
    port map(condition_code, dest, control_vector, j);
END ARCHITECTURE Execute_Stage;

