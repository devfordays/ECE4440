--
-- VHDL Architecture Modic_Pipeline_lib.Mem_Cache.Mem_Cache
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 22:21:40 03/ 5/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Mem_Cache IS
  PORT(
  reset : IN std_logic;
  clock : IN std_logic;
  
  read : IN std_logic; --from processor
  write : IN std_logic; --from processor
  addr : IN std_logic_vector(15 DOWNTO 0); --from processor
  data : IN std_logic_vector(15 DOWNTO 0); --from processor
  
  mAck : IN std_logic; --from main memory
  data_from_mem : IN std_logic_vector(15 DOWNTO 0); --from main memory
  
  r, w : OUT std_logic; --to main memory
  addr_to_mem, data_to_mem : OUT std_logic_vector(15 DOWNTO 0); -- to main memory
  
  data_to_proc : OUT std_logic_vector(15 DOWNTO 0); -- to processor
  stall : OUT std_logic -- to processor
  
);
  
  
END ENTITY Mem_Cache;

--
ARCHITECTURE Mem_Cache OF Mem_Cache IS
BEGIN
  
  
  
  --nand_gate : entity work.nand_gate(nand_gate)
    --port map(vout, compare_out, readx);
  
  --compare : entity work.comparator(comparator)
    --port map(tagout, addr(15 DOWNTO 3), compare_out);
  
  --ram_valid : entity work.ramv(struct)
    --port map(addr(2 DOWNTO 0), clock, mAck, mAck, vout);
  
  --ram_tag : entity work.ramtag(struct)
    --port map(addr(2 DOWNTO 0), clock, addr(15 DOWNTO 3), mAck, tagout);
  
  --ram_data : entity work.ramdata(struct)
    --port map(addr(2 DOWNTO 0), clock, instr, mAck, data);
      
  --iCacheStall : entity work.InstructionCache_stall(InstructionCache_stall)
    --port map(readx, reset, read);
END ARCHITECTURE Mem_Cache;

