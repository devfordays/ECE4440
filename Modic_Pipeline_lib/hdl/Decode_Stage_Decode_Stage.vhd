--
-- VHDL Architecture Modic_Pipeline_lib.Decode_Stage.Decode_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:18:55 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_Stage IS
  PORT (PCVal, Instruction, RFD0, RFD1 : IN std_logic_vector(15 DOWNTO 0);
    clock, dirty : IN std_logic;
    left, right, extra : OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; 
  
    RFA0, RFA1, dest : OUT std_logic_vector(3 DOWNTO 0) := "0000";
    controlvector : OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000";
    ResA: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    W: OUT std_logic := '0' );
END ENTITY Decode_Stage;

--
ARCHITECTURE Decode_Stage OF Decode_Stage IS
  CONSTANT one : std_logic := '1';
  CONSTANT zero16 : std_logic_vector := "0000000000000000";
  CONSTANT zero4 : std_logic_vector := "0000";
  signal PC, instr : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal LM, RM, EM, DM : std_logic_vector(1 DOWNTO 0) := "00";
  signal controly, tempcontrol : std_logic_vector(17 DOWNTO 0);
BEGIN
  --Controller : entity work.Decode_Controller(Decode_Controller)
    --port map(instr, dirty, clock, RFA0, RFA1, controlvector, W, ResA);
      --Controller : entity work.Decode_Controller(Decode_Controller)
    --port map(Instruction, dirty, clock, RFA0, RFA1, controlvector, W, ResA);
      Controller : entity work.Decode_Controller(Decode_Controller)
    port map(Instruction, dirty, clock, RFA0, RFA1, controly, W, ResA);
      
      MultipleSignals : entity work.Decode_MultSig(Decode_MultSig)
      port map(controly, controlvector, tempcontrol);
      
  --PCRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (PCVal, PC, clock, one);
      
  --IRRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (Instruction, instr, clock, one);
      
  --LeftM : entity work.Decode_Left_Mux(Decode_Left_Mux)
    --port map (controlvector(15 DOWNTO 14), PC, instr, RFD1, zero16, left);
      
  --LeftM : entity work.Decode_Left_Mux(Decode_Left_Mux)
    --port map (controlvector(15 DOWNTO 14), PCVal, instr, RFD1, zero16, left);
     
     LeftM : entity work.Decode_Left_Mux(Decode_Left_Mux)
      port map (tempcontrol(15 DOWNTO 14), PCVal, Instruction, RFD1, zero16, left);
      
  --RightM : entity work.Decode_Right_Mux(Decode_Right_Mux)
    --port map (controlvector(13 DOWNTO 12), instr, zero16, RFD0, right);
      RightM : entity work.Decode_Right_Mux(Decode_Right_Mux)
    port map (tempcontrol(13 DOWNTO 12), Instruction, zero16, RFD0, right);
      
  --ExtraM : entity work.Decode_Extra_Mux(Decode_Extra_Mux)
    --port map (controlvector(11 DOWNTO 10), instr, RFD1, zero16, extra);
      ExtraM : entity work.Decode_Extra_Mux(Decode_Extra_Mux)
    port map (tempcontrol(11 DOWNTO 10), Instruction, RFD1, zero16, extra);
      
  --DestM : entity work.Decode_Dest_Mux(Decode_Dest_Mux)
    --port map (controlvector(9), instr(12 DOWNTO 9), zero4, dest);
      DestM : entity work.Decode_Dest_Mux(Decode_Dest_Mux)
    port map (tempcontrol(9), Instruction(12 DOWNTO 9), zero4, dest);
END ARCHITECTURE Decode_Stage;

