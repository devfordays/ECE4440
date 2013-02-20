--
-- VHDL Architecture Modic_Pipeline_lib.WB_Stage.WB_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:49:07 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY WB_Stage IS
  PORT(destination: IN std_logic_vector(3 DOWNTO 0);
    data: IN std_logic_vector(15 DOWNTO 0);
    control_vector: IN std_logic_vector(17 DOWNTO 0);
    clock: IN std_logic;
    dest: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    data_out: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    control: OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000" );
END ENTITY WB_Stage;

--
ARCHITECTURE WB_Stage OF WB_Stage IS
  CONSTANT one: std_logic := '1';
BEGIN
  --destReg : entity work.Reg(Reg)
  --GENERIC MAP(size => 4)
    --port map(destination, dest, clock, one);
    changeName1 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
    GENERIC MAP(size => 4)
    port map(destination, dest);
      
  --dataReg : entity work.Reg(Reg)
  --GENERIC MAP(size => 16)
    --port map(data, data_out, clock, one);
      changeName2 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
  GENERIC MAP(size => 16)
    port map(data, data_out);
      
  --controlReg : entity work.Reg(Reg)
  --GENERIC MAP(size => 18)
    --port map(control_vector, control, clock, one);
      changeName3 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
  GENERIC MAP(size => 18)
    port map(control_vector, control);
END ARCHITECTURE WB_Stage;

