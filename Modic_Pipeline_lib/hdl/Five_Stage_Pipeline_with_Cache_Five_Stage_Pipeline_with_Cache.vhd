--
-- VHDL Architecture Modic_Pipeline_lib.Five_Stage_Pipeline_with_Cache.Five_Stage_Pipeline_with_Cache
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 21:31:21 03/12/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Five_Stage_Pipeline_with_Cache IS
  PORT(reset, clock : IN std_logic
  );
END ENTITY Five_Stage_Pipeline_with_Cache;

--
ARCHITECTURE Five_Stage_Pipeline_with_Cache OF Five_Stage_Pipeline_with_Cache IS
  signal delay_from_instr_cache, delay_from_mem_cache : std_logic;
  signal maddr : std_logic_vector(15 DOWNTO 0); --to instr cache
  signal mdata : std_logic_vector(15 DOWNTO 0); --from instr cache
  signal datamem : std_logic_vector(15 DOWNTO 0); --to mem cache
  signal w, r : std_logic; --to mem cache
  signal addr : std_logic_vector(15 DOWNTO 0); --to mem cache
  signal mdata3 : std_logic_vector(15 DOWNTO 0); --from mem cache
  
  signal instr : std_logic_vector(15 DOWNTO 0); --from main memory to instr cache
  signal fAck : std_logic; --from main memory to instr cache
  signal read : std_logic; --from instr cache to main memory
  signal addr_out : std_logic_vector(15 DOWNTO 0); --from instr cache to main memory
  
  signal temp_delay : std_logic;
  signal tempaddr : std_logic_vector(15 DOWNTO 0);
  signal tempdatamem : std_logic_vector(15 DOWNTO 0);
  signal tempw : std_logic := '0';
  signal tempmdata3 : std_logic_vector(15 DOWNTO 0);
  signal tempdelay_from_mem_cache : std_logic;
  signal tempr : std_logic := '0';
  signal tdelay : std_logic;
  signal datatoproc, datam, add : std_logic_vector(15 DOWNTO 0);
  signal re, wr : std_logic;
  
BEGIN
  
  --Proc : entity work.Processor(Processor)
    --port map(reset, clock, delay_from_instr_cache, delay_from_mem_cache, maddr, mdata, datamem, w, r, addr, mdata3);
      Proc : entity work.Processor(Processor)
        port map(reset, clock, delay_from_instr_cache, tdelay, maddr, mdata, datamem, w, r, addr, datatoproc);
  
  ICache : entity work.Instruction_Cache(Instruction_Cache)
    port map(reset, clock, maddr, instr, fAck, delay_from_instr_cache, mdata, read, addr_out);
      
  DCache : entity work.Data_Cache(Data_Cache)
    port map(reset, clock, addr, datamem, w, r, mdata3, delay_from_mem_cache, tdelay, datatoproc, re, wr, datam, add);
  
  --MMemory : entity work.Main_Memory(Main_Memory)
    --port map(reset, clock, addr_out, read, addr, datamem, r, w, instr, fAck, mdata3, delay_from_mem_cache);
  MMemory : entity work.Main_Memory(Main_Memory)
    port map(reset, clock, addr_out, read, add, datam, re, wr, instr, fAck, mdata3, delay_from_mem_cache);      
  
  
END ARCHITECTURE Five_Stage_Pipeline_with_Cache;

