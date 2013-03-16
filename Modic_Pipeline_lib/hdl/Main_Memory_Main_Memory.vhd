--
-- VHDL Architecture Modic_Pipeline_lib.Main_Memory.Main_Memory
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:29:16 03/12/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Main_Memory IS
  PORT(
    reset : IN std_logic;
    clock : IN std_logic;
    
    instr_addr : IN std_logic_vector(15 DOWNTO 0); --from instr cache
    instr_read : IN std_logic; --from instr cache
    
    data_addr : IN std_logic_vector(15 DOWNTO 0); --from data cache
    data_in : IN std_logic_vector(15 DOWNTO 0); --from data cache
    data_read : IN std_logic; --from data cache
    data_write : IN std_logic; --from data cache
    
    instr : OUT std_logic_vector(15 DOWNTO 0); --to instr cache
    mAck_fetch : OUT std_logic; --to instr cache
    
    data_out : OUT std_logic_vector(15 DOWNTO 0); --to data cache
    mAck_data : OUT std_logic --to data cache
    
  );
END ENTITY Main_Memory;

--
ARCHITECTURE Main_Memory OF Main_Memory IS
  signal mem_data : std_logic_vector(15 DOWNTO 0);
  signal ack, read_to_main_mem, write_to_main_mem : std_logic;
  signal data_to_main_mem, addr_to_main_mem : std_logic_vector(15 DOWNTO 0);
BEGIN
  
  Main_Mem_Moore : entity work.Main_Mem_FSM(Main_Mem_FSM)
    port map(reset, clock, instr_read, instr_addr, data_read, data_write, data_in, data_addr, mem_data, ack, instr, mAck_fetch, data_out, mAck_data, data_to_main_mem, addr_to_main_mem, read_to_main_mem, write_to_main_mem);
      
  Memory : entity work.ram_delay(behavior)
    port map(reset, data_to_main_mem, write_to_main_mem, read_to_main_mem, ack, addr_to_main_mem, mem_data);    
      
END ARCHITECTURE Main_Memory;

