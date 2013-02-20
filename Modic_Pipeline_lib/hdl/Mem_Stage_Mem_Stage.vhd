--
-- VHDL Architecture Modic_Pipeline_lib.Mem_Stage.Mem_Stage
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:30:12 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Mem_Stage IS
  PORT( dest: IN std_logic_vector(3 DOWNTO 0); --from execute stage
    Faddr : IN std_logic_vector(15 DOWNTO 0);
    mdelayFromMem : IN std_logic;
    extra, result: IN std_logic_vector(15 DOWNTO 0); --from execute stage
    control_vector: IN std_logic_vector(17 DOWNTO 0); --from execute stage
    mdata: IN std_logic_vector(15 DOWNTO 0); --from memory
    data: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; --to writeback stage
    addr: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; --to memory
    mdelay_fetch: OUT std_logic := '0'; --to fetch stage
    --datamem: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    --extraa: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    extraing: OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    write: OUT std_logic := '0'; --to memory
    --destination: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    --desta: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    desting: OUT std_logic_vector(3 DOWNTO 0) := "0000";
    clock : IN std_logic;
    --vector : OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000"
    --control_vector_a : OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000"
  controlling : OUT std_logic_vector(17 DOWNTO 0) := "000000000000000000"
  );
END ENTITY Mem_Stage;

--
ARCHITECTURE Mem_Stage OF Mem_Stage IS
  CONSTANT zero : std_logic := '0';
  CONSTANT one : std_logic := '1';
  signal desta : std_logic_vector(3 DOWNTO 0) := "0000";
  --signal extraa, resulta, bout : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal resulta, bout : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  --signal control_vector_a : std_logic_vector(17 DOWNTO 0) := "000000000000000000";
  signal maddr : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal extraa : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal mdelay : std_logic := '0';
  signal Dout : std_logic := '0';
  signal control_vector_a : std_logic_vector(17 DOWNTO 0) := "000000000000000000";
BEGIN
  --write <= vector(2);
  controlling <= control_vector_a;
  desting <= desta;
  extraing <= extraa;
  write <= control_vector_a(2);
  
  --destRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 4)
    --port map (desta, destination, clock, one);
      
  --destMux: entity work.Mem_Multiplexor(Mem_Multiplexor)
    --port map(mdelay, dest, destination, desta);
      destMux: entity work.Mem_Multiplexor(Mem_Multiplexor)
       port map(mdelay, dest, desta, desta);
      
  --extraRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (extraa, datamem, clock, one);
      
  --extraMux: entity work.Mem_Multi16(Mem_Multi16)
    --port map(mdelay, extra, datamem, extraa);
  extraMux: entity work.Mem_Multi16(Mem_Multi16)
    port map(mdelay, extra, extraa, extraa);
      
  --resultRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 16)
    --port map (resulta, maddr, clock, one);
      
  --resultMux: entity work.Mem_Multi16(Mem_Multi16)
    --port map(mdelay, result, maddr, resulta);
      resultMux: entity work.Mem_Multi16(Mem_Multi16)
        port map(mdelay, result, resulta, resulta);
      
  --controlvectorRegister : entity work.Reg(Reg)
    --GENERIC MAP(size => 18)
    --port map (control_vector_a, vector, clock, one);
      
  --controlvectorMux: entity work.Mem_Multi18(Mem_Multi18)
    --port map(mdelay, control_vector, vector, control_vector_a);
      controlvectorMux: entity work.Mem_Multi18(Mem_Multi18)
        port map(mdelay, control_vector, control_vector_a, control_vector_a);
      
  --AMux: entity work.Mem_new_MUX(Mem_new_MUX)
    --port map(vector(1), vector(8 DOWNTO 4), maddr, mdata, datamem, data);
      AMux: entity work.Mem_new_MUX(Mem_new_MUX)
        port map(control_vector_a(1), control_vector_a(8 DOWNTO 4), resulta, mdata, extraa, data);
      
  --BMux : entity work.Mem_Multi16(Mem_Multi16)
    --port map(vector(1), Faddr, maddr, Bout);
      BMux : entity work.Mem_Multi16(Mem_Multi16)
        port map(control_vector_a(1), Faddr, resulta, Bout);
      
  --CMux : entity work.Mem_Multi16(Mem_Multi16)
    --port map(vector(2), Bout, maddr, addr);
      CMux : entity work.Mem_Multi16(Mem_Multi16)
        port map(control_vector_a(2), Bout, resulta, addr);
      
  --DMux : entity work.Mem_Multi1(Mem_Multi1)
    --port map(vector(2), vector(1), one, Dout);
      DMux : entity work.Mem_Multi1(Mem_Multi1)
        port map(control_vector_a(2), control_vector_a(1), one, Dout);
      
    EMux : entity work.Mem_Multi1(Mem_Multi1)
      port map(Dout, mdelayFromMem, one, mdelay_fetch);
      
  FMux : entity work.Mem_Multi1(Mem_Multi1)
    port map(Dout, zero, mdelayFromMem, mdelay);
END ARCHITECTURE Mem_Stage;

