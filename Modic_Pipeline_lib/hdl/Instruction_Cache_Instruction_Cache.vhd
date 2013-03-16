--
-- VHDL Architecture Modic_Pipeline_lib.Instruction_Cache.Instruction_Cache
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:59:25 03/ 5/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Instruction_Cache IS
  
  PORT(
    reset : IN std_logic;
    clock : IN std_logic;
    addr : IN std_logic_vector(15 DOWNTO 0); --from processor
    instr : IN std_logic_vector(15 DOWNTO 0); --from main memory
    mAck : IN std_logic; --from main memory
    stall : OUT std_logic; --to processor
    data : OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; --to processor
    read : OUT std_logic; --to main memory
    address_out : OUT std_logic_vector(15 DOWNTO 0) --to main memory
  );
    
END ENTITY Instruction_Cache;

--
ARCHITECTURE Instruction_Cache OF Instruction_Cache IS
  signal vout : std_logic := '0';
  signal tagout : std_logic_vector(15 DOWNTO 3);
  signal compare_out : std_logic := '0';
  signal readx : std_logic;
  
BEGIN
  
  address_out <= addr;
  stall <= read;
  
  nand_gate : entity work.nand_gate(nand_gate)
    port map(vout, compare_out, readx);
  
  compare : entity work.comparator(comparator)
    port map(tagout, addr(15 DOWNTO 3), compare_out);
  
  ram_valid : entity work.ramv(struct)
    port map(addr(2 DOWNTO 0), clock, mAck, mAck, vout);
  
  ram_tag : entity work.ramtag(struct)
    port map(addr(2 DOWNTO 0), clock, addr(15 DOWNTO 3), mAck, tagout);
  
  ram_data : entity work.ramdata(struct)
    port map(addr(2 DOWNTO 0), clock, instr, mAck, data);
      
  iCacheStall : entity work.InstructionCache_stall(InstructionCache_stall)
    port map(readx, reset, read);
  
END ARCHITECTURE Instruction_Cache;

