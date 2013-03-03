--
-- VHDL Architecture Modic_Pipeline_lib.Fetch_Stage.Fetch_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 18:24:18 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Fetch_Stage IS
  PORT(--jump, stall, mdelay, reset, int, clock: IN std_logic;
    jump, stall : IN std_logic;
    mdelay : IN std_logic := '0';
    reset, int, clock : IN std_logic;
    mdata, jaddr: IN std_logic_vector(15 DOWNTO 0);
    maddr, instr, PCVal: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000" );
    --maddr, instr, pcincremented: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000" );
END ENTITY Fetch_Stage;

--
ARCHITECTURE Fetch_Stage OF Fetch_Stage IS
  CONSTANT one : std_logic := '1';
  signal temp_pcincremented : std_logic_vector(15 DOWNTO 0); 
  signal pc, pcincremented, nextpc: std_logic_vector(15 DOWNTO 0) := "0000000000000000";
--signal pc, PCVal, nextpc: std_logic_vector(15 DOWNTO 0) := "0000000000000000";
BEGIN
  pcincremented <= temp_pcincremented;
  
  
  Mem_MUX : entity work.Fetch_Mem_MUX(Fetch_Mem_Mux)
    port map(pc, reset, int, maddr);
      
  Instr_MUX : entity work.Fetch_Instr_MUX(Fetch_Instr_MUX)
    port map(mdata, reset, int, mdelay, stall, jump, instr);
      
   PCVal_MUX : entity work.Fetch_PCVal_MUX(Fetch_PCVal_MUX)
     port map(pc, jaddr, jump, PCVal);
      
      
  --Incrementer : entity work.Fetch_Incrementer(Fetch_Incrementer)
    --port map(pc, pcincremented);
      Incrementer : entity work.Fetch_Incrementer(Fetch_Incrementer)
        port map(pc, temp_pcincremented);
      
  --PC_MUX : entity work.Fetch_PC_MUX(Fetch_PC_MUX)
    --port map(mdata, jaddr, pc, pcincremented, jump, mdelay, stall, reset, int, nextpc);
      PC_MUX : entity work.Fetch_PC_MUX(Fetch_PC_MUX)
    port map(mdata, jaddr, pc, temp_pcincremented, jump, mdelay, stall, reset, int, nextpc);
      
  PC_Reg : entity work.Reg(Reg)
    port map(nextpc, pc, clock, one);
      
END ARCHITECTURE Fetch_Stage;

