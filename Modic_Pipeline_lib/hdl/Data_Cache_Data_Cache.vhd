--
-- VHDL Architecture Modic_Pipeline_lib.Data_Cache.Data_Cache
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 10:40:31 03/15/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Data_Cache IS
  PORT(
    reset : IN std_logic;
    clock : IN std_logic;
    
    addr : IN std_logic_vector(15 DOWNTO 0); --from processor
    data_from_processor : IN std_logic_vector(15 DOWNTO 0); --from processor
    w_from_processor : IN std_logic; --from processor
    r_from_processor : IN std_logic; --from processor
    
    data_in : IN std_logic_vector(15 DOWNTO 0); --from main memory
    mAck : IN std_logic; --from main memory
    
    mdelay : OUT std_logic; --to processor
    data : OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000"; --to processor
    
    read : OUT std_logic; --to main memory
    write : OUT std_logic; --to main memory
    data_out : OUT std_logic_vector(15 DOWNTO 0); --to main memory
    address_out : OUT std_logic_vector(15 DOWNTO 0) --to main memory
    
  );
END ENTITY Data_Cache;

--
ARCHITECTURE Data_Cache OF Data_Cache IS
  signal vout : std_logic := '0';
  signal tagout : std_logic_vector(15 DOWNTO 3);
  signal compare_out : std_logic := '0';
  signal readx : std_logic;
  signal tempread : std_logic;
  signal tempwrite : std_logic;
BEGIN
  
  address_out <= addr;
  data_out <= data_from_processor;
  tempread <= read;
  tempwrite <= w_from_processor;
  
  mdelaycontrol : entity work.mdelay_controller(mdelay_controller)
    port map(tempread, tempwrite, mAck, mdelay, write);
  
  newnand_gate : entity work.new_nand_gate(new_nand_gate)
    port map(vout, compare_out, readx, r_from_processor);
  
  compare : entity work.comparator(comparator)
    port map(tagout, addr(15 DOWNTO 3), compare_out);
  
  ram_valid : entity work.ramv(struct)
    port map(addr(2 DOWNTO 0), clock, mAck, mAck, vout);
  
  ram_tag : entity work.ramtag(struct)
    port map(addr(2 DOWNTO 0), clock, addr(15 DOWNTO 3), mAck, tagout);
  
  ram_data : entity work.ramdata(struct)
    port map(addr(2 DOWNTO 0), clock, data_in, mAck, data);
      
  iCacheStall : entity work.InstructionCache_stall(InstructionCache_stall)
    port map(readx, reset, read);
      
END ARCHITECTURE Data_Cache;

