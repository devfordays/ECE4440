--
-- VHDL Architecture Modic_Pipeline_lib.testing_last_stage.testing_last_stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 16:32:02 11/23/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY testing_last_stage IS
  PORT(destination: IN std_logic_vector(3 DOWNTO 0);
    data : IN std_logic_vector(15 DOWNTO 0);
    control_vector: IN std_logic_vector(17 DOWNTO 0);
    RA0, RA1: IN std_logic_vector(3 DOWNTO 0);
    RW0, RW1: IN std_logic;
    ResA: IN std_logic_vector(3 DOWNTO 0);
    W: IN std_logic);
    
END ENTITY testing_last_stage;

--
ARCHITECTURE testing_last_stage OF testing_last_stage IS
BEGIN
  
  WB : entity work.WB_Stage(WB_Stage)
    port map (desty, data, vector, clock, destin, dataout, last_control);
      
  RegisterTracker : entity work.Register_Tracker(Register_Tracker)
    port map (RFA0, RFA1, ResA, destin, controlvector(17), controlvector(16), W, last_control(0), clock, dirty);

  RegFile : entity work.Register_File(Register_File)
    port map (destin, RFA1, RFA0, dataout, RFD0, RFD1, clock, last_control(0), controlvector(17), controlvector(16));
END ARCHITECTURE testing_last_stage;

