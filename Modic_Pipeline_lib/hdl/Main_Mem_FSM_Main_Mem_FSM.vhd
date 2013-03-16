--
-- VHDL Architecture Modic_Pipeline_lib.Main_Mem_FSM.Main_Mem_FSM
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 12:46:36 03/12/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Main_Mem_FSM IS
  PORT(
    r : IN std_logic;
    clock : IN std_logic;
    
    instr_read : IN std_logic; --from instr cache
    instr_addr : IN std_logic_vector(15 DOWNTO 0); --from instr cache
    
    mem_read : IN std_logic; --from mem cache
    mem_write : IN std_logic; --from mem cache
    mem_data : IN std_logic_vector(15 DOWNTO 0); --from mem cache
    mem_addr : IN std_logic_vector(15 DOWNTO 0); --from mem cache
    
    --main_mem_addr : IN std_logic_vector(15 DOWNTO 0); --from main memory
    main_mem_data : IN std_logic_vector(15 DOWNTO 0); --from main memory
    ack : IN std_logic; --from main memory
    
    instruction : OUT std_logic_vector(15 DOWNTO 0); --to instr cache
    instr_ack : OUT std_logic; --to instr cache
    
    data : OUT std_logic_vector(15 DOWNTO 0); --to mem stage cache
    mem_ack : OUT std_logic;
    
    data_to_main_mem : OUT std_logic_vector(15 DOWNTO 0); --to main mem
    addr_to_main_mem : OUT std_logic_vector(15 DOWNTO 0); --to main mem
    read_to_main_mem : OUT std_logic;
    write_to_main_mem : OUT std_logic
    
  );
    
    
END ENTITY Main_Mem_FSM;

--
ARCHITECTURE Main_Mem_FSM OF Main_Mem_FSM IS
  type state_type is (reset, idle, fetch, mem);
    signal current_state, next_state: state_type;
BEGIN


  PROCESS(clock, r)
  BEGIN
    IF r = '1' THEN
      current_state <= reset;
    ELSE
        IF rising_edge(clock) THEN
          current_state <= next_state;
        END IF;
    END IF;
  END PROCESS;
  
  
  PROCESS(current_state, instr_addr, instr_read, mem_read, mem_write, mem_data, mem_addr, main_mem_data, ack)
    BEGIN
      
      --Initialize everything to all zeros
      instruction <= "0000000000000000";
      instr_ack <= '0';
      data <= "0000000000000000";
      mem_ack <= '0';
      data_to_main_mem <= "0000000000000000";
      addr_to_main_mem <= "0000000000000000";
      read_to_main_mem <= '0';
      write_to_main_mem <= '0';
      
      case current_state IS
        
        
      WHEN reset =>
        next_state <= fetch;
        
        
      WHEN idle =>
        IF instr_read = '1' THEN
          next_state <= fetch;
        ELSE IF (mem_read = '1') or (mem_write = '1') THEN
          next_state <= mem;
        ELSE
          next_state <= idle;
        END IF;
        END IF;
        
        
        
      WHEN fetch =>
        next_state <= fetch;
        
        instruction <= main_mem_data; --to instr cache
        instr_ack <= ack; --to instr cache
        
        addr_to_main_mem <= instr_addr; --to main mem
        read_to_main_mem <= instr_read; --to main mem
        
        IF (mem_read = '1' OR mem_write = '1') THEN
          next_state <= mem;
          ELSE IF (ack = '1') and (instr_read = '0') THEN
            next_state <= idle;
          END IF;
        END IF;
        
        
        
        
      WHEN mem =>
        next_state <= mem;
        
        data <= main_mem_data;
        
        mem_ack <= ack;
        
        addr_to_main_mem <= mem_addr;
        read_to_main_mem <= mem_read;
        data_to_main_mem <= mem_data;
        write_to_main_mem <= mem_write;
        
          IF (ack = '1') THEN
            next_state <= idle;
          END IF;
        
      END case;
        
    END PROCESS;        
END ARCHITECTURE Main_Mem_FSM;

