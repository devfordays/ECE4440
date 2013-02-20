--
-- VHDL Architecture Modic_Pipeline_lib.Mem_WB_Stage.Mem_WB_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 09:59:31 02/ 6/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Mem_WB_Stage IS
  PORT( dest: IN std_logic_vector(3 DOWNTO 0); --from execute stage
    Faddr : IN std_logic_vector(15 DOWNTO 0);
    mdelayFromMem : IN std_logic;
    extra, result: IN std_logic_vector(15 DOWNTO 0); --from execute stage
    control_vector: IN std_logic_vector(17 DOWNTO 0); --from execute stage
    mdata: IN std_logic_vector(15 DOWNTO 0); --from memory
    --data: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; --to writeback stage
    addr: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; --to memory
    mdelay_fetch: OUT std_logic := '0'; --to fetch stage
    datamem: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    write: OUT std_logic := '0'; --to memory
    --destination: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    clock : IN std_logic;
    
    
    --vector : OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000"; need to do stuff
    
    
    --destination: IN std_logic_vector(3 DOWNTO 0);
    --data: IN std_logic_vector(15 DOWNTO 0);
    
    
    --control_vector: IN std_logic_vector(17 DOWNTO 0); meed to do stuff
    
    
    --clock: IN std_logic;
    destin: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    data_out: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    control: OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000" 
  );
END ENTITY Mem_WB_Stage;

--
ARCHITECTURE Mem_WB_Stage OF Mem_WB_Stage IS
  CONSTANT zero : std_logic := '0';
  CONSTANT one : std_logic := '1';
  signal desta : std_logic_vector(3 DOWNTO 0) := "0000";
  signal extraa, resulta, bout : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal control_vector_a : std_logic_vector(17 DOWNTO 0) := "000000000000000000";
  signal maddr : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal mdelay : std_logic := '0';
  signal Dout : std_logic := '0';
  
  signal destination : std_logic_vector(3 DOWNTO 0) := "0000";
  signal data : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal vector : std_logic_vector(17 DOWNTO 0) := "000000000000000000";
BEGIN
  
  write <= vector(2);
  
  destRegister : entity work.Reg(Reg)
    GENERIC MAP(size => 4)
    port map (desta, destination, clock, one);
      
  destMux: entity work.Mem_Multiplexor(Mem_Multiplexor)
    port map(mdelay, dest, destination, desta);
      
  extraRegister : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (extraa, datamem, clock, one);
      
  extraMux: entity work.Mem_Multi16(Mem_Multi16)
    port map(mdelay, extra, datamem, extraa);
      
  resultRegister : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (resulta, maddr, clock, one);
      
  resultMux: entity work.Mem_Multi16(Mem_Multi16)
    port map(mdelay, result, maddr, resulta);
      
  controlvectorRegister : entity work.Reg(Reg)
    GENERIC MAP(size => 18)
    port map (control_vector_a, vector, clock, one);
      
  controlvectorMux: entity work.Mem_Multi18(Mem_Multi18)
    port map(mdelay, control_vector, vector, control_vector_a);
      
  AMux: entity work.Mem_new_MUX(Mem_new_MUX)
    port map(vector(1), vector(8 DOWNTO 4), maddr, mdata, datamem, data);
      
  BMux : entity work.Mem_Multi16(Mem_Multi16)
    port map(vector(1), Faddr, maddr, Bout);
      
  CMux : entity work.Mem_Multi16(Mem_Multi16)
    port map(vector(2), Bout, maddr, addr);
      
  DMux : entity work.Mem_Multi1(Mem_Multi1)
    port map(vector(2), vector(1), one, Dout);
      
  EMux : entity work.Mem_Multi1(Mem_Multi1)
    port map(Dout, mdelayFromMem, one, mdelay_fetch);
      
  FMux : entity work.Mem_Multi1(Mem_Multi1)
    port map(Dout, zero, mdelayFromMem, mdelay);
      
      
      
      
      
      
      
      
      --destReg : entity work.Reg(Reg)
  --GENERIC MAP(size => 4)
    --port map(destination, dest, clock, one);
    changeName1 : entity work.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames)
    GENERIC MAP(size => 4)
    port map(destination, destin);
      
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
    port map(vector, control);
END ARCHITECTURE Mem_WB_Stage;

