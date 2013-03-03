--
-- VHDL Architecture Modic_Pipeline_lib.Five_Stage_Pipeline.Five_Stage_Pipeline
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:13:51 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Five_Stage_Pipeline IS
  PORT( reset, clock: IN std_logic
        --fetch_reset: OUT std_logic;
 --      maddr: OUT std_logic_vector(15 DOWNTO 0); --fetch
 --       mdata: IN std_logic_vector(15 DOWNTo 0); --fetch
--        
  --      datamem: OUT std_logic_vector(15 DOWNTO 0); --memstage
  --      write: OUT std_logic; --memstage
  --      addr: OUT std_logic_vector(15 DOWNTO 0); --memstage
  --      mdata3: IN std_logic_vector(15 DOWNTO 0) --memstage
  
  );
END ENTITY Five_Stage_Pipeline;

--
ARCHITECTURE Five_Stage_Pipeline OF Five_Stage_Pipeline IS
  
  
  signal jump, mdelay, int, stall: std_logic;
  
  signal mdata, mdata3, jaddr: std_logic_vector(15 DOWNTO 0);
  --signal mdata3, jaddr: std_logic_vector(15 DOWNTO 0);
  --signal jaddr: std_logic_vector(15 DOWNTO 0);
  signal maddr, instr, PCVal: std_logic_vector(15 DOWNTO 0);
  --signal instr, PCVal: std_logic_vector(15 DOWNTO 0);
  signal zero : std_logic := '0';
  signal zero16 : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
  signal one : std_logic := '1';
  
  signal RFD0, RFD1 : std_logic_vector(15 DOWNTO 0);
  signal dirty : std_logic;
  signal left, right, extra : std_logic_vector(15 DOWNTO 0);
  signal RFA0, RFA1, dest : std_logic_vector(3 DOWNTO 0);
  signal controlvector : std_logic_vector(17 DOWNTO 0);
  signal ResA: std_logic_vector(3 DOWNTO 0);
  signal W: std_logic;
  
  signal result, extradata : std_logic_vector(15 DOWNTO 0);
  signal destination : std_logic_vector(3 DOWNTO 0);
  signal control : std_logic_vector(17 DOWNTO 0);
  
  --signal mdelayfrommem, write : std_logic; 
  --signal mdelayfrommem : std_logic;
  signal mdelayfrommem : std_logic := '0';
  signal mdelaytofetch : std_logic := '0';
  signal write : std_logic;
  
  signal data, addr, datamem : std_logic_vector(15 DOWNTO 0);
  --signal data, addr : std_logic_vector(15 DOWNTO 0);
  --signal data : std_logic_vector(15 DOWNTO 0);
  signal desty : std_logic_vector(3 DOWNTO 0);
  signal vector : std_logic_vector(17 DOWNTO 0);
  
  signal destin : std_logic_vector(3 DOWNTO 0);
  signal dataout : std_logic_vector(15 DOWNTO 0);
  signal last_control : std_logic_vector(17 DOWNTO 0);
  
  signal tempzero : std_logic := '0';
  
  
  
BEGIN
  --Fetch : entity work.Fetch_Stage(Fetch_Stage)
    --port map (jump, dirty, zero, reset, zero, clock, mdata, jaddr, maddr, instr, PCVal);
  Fetch : entity work.Fetch_Stage(Fetch_Stage)
    port map (jump, dirty, mdelaytofetch, reset, zero, clock, mdata, result, maddr, instr, PCVal);

  --Decode : entity work.Decode_Stage(Decode_Stage)
    --port map (PCVal, instr, RFD0, RFD1, clock, dirty, left, right, extra, RFA0, RFA1, dest, controlvector, ResA, W); 

  Decode : entity work.Decode_Stage(Decode_Stage)
    port map (PCVal, instr, RFD0, RFD1, clock, dirty, left, right, extra, RFA0, RFA1, dest, controlvector, ResA, tempzero); 

  Execute : entity work.Execute_Stage(Execute_Stage)
    port map (extra, left, right, controlvector, dest, control, clock, jaddr, result, destination, extradata, jump);

  Mem : entity work.Mem_Stage(Mem_Stage)
    port map (destination, maddr, mdelayfrommem, extradata, result, control, mdata3, data, addr, mdelaytofetch, datamem, write, desty, clock, vector);


  WB : entity work.WB_Stage(WB_Stage)
    port map (desty, data, vector, clock, destin, dataout, last_control);
      
  --MainMemoryHandler : entity work.SRAM(behavior)
    --port map (addr, datamem, clock, vector(2), mdata);
      
  FetchStageMemory : entity work.easy_RAM_simu(behavior)
    port map(reset, zero16, zero, maddr, mdata);    
      
  MemStageMemory : entity work.easy_RAM_simu(behavior)
    port map(reset, datamem, write, addr, mdata3);
      
  --RegisterTracker : entity work.Register_Tracker(Register_Tracker)
    --port map (RFA0, RFA1, ResA, destin, controlvector(17), controlvector(16), W, last_control(0), clock, dirty);

  RegisterTracker : entity work.Register_Tracker(Register_Tracker)
    port map (RFA0, RFA1, ResA, destin, controlvector(17), controlvector(16), W, zero, clock, dirty);

  RegFile : entity work.Register_File(Register_File)
    port map (destin, RFA1, RFA0, dataout, RFD0, RFD1, clock, last_control(0), controlvector(17), controlvector(16));

END ARCHITECTURE Five_Stage_Pipeline;

