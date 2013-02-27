--
-- VHDL Architecture processor_lib.memoryArbiter.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 15:10:19 10/30/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY memoryArbiter IS
  port(memAddr, memWrite:in std_logic_vector(15 downto 0);
    memRead:out std_logic_vector(15 downto 0);
    memR, memW:in std_logic;
    
    ifAddr:in std_logic_vector(15 downto 0);
    ifData:out std_logic_vector(15 downto 0);
    ifMemDelay: out std_logic;
    
    --writeVal1 = 0, write1=0 always
    addr, dataIN:out std_logic_vector(15 downto 0);
    writeEnable:out std_logic;
    dataOUT:in std_logic_vector(15 downto 0));
    
END ENTITY memoryArbiter;

--
ARCHITECTURE behavior OF memoryArbiter IS
BEGIN
  process(memAddr, memWrite, memR, memW, ifAddr, dataOUT)
  constant zero: std_logic_vector(15 downto 0) := "0000000000000000";
  begin
    --need to handle if mem stage tries to read/write
    --the IF stage will load a NOP if memDelay = 1.  stall actually
    
    --if mem stage reading or writing, set memDelay to IF
    if(memR = '1') then
      --memdely 1.  read from memory
      --outputs to memory
      addr <= memAddr;
      dataIN <= zero;
      writeEnable <= '0';
      
      --outputs to mem stage
      memRead <= dataOUT;
      
      --outputs to IF stage
      ifMemDelay <= '1';
      ifData <= zero;
      
    elsif (memW = '1') then
      --memDelay 1.  write to memory
      --outputs to memory
      addr <= memAddr;
      dataIN <= memWrite;
      writeEnable <= '1';
      
      --outputs to mem stage
      memRead <= dataOUT;
      
      --outputs to IF stage
      ifMemDelay <= '1';
      ifData <= zero;
      
      
    else
      --not a memory instruction
      --outputs to memory
      addr <= ifAddr;
      dataIN <= zero;
      writeEnable <= '0';
      
      --outputs to mem stage
      memRead <= zero;  --or dont care
      
      --outputs to IF stage
      ifMemDelay <= '0';
      ifData <= DataOUT;
    end if;
    
  end process;
END ARCHITECTURE behavior;

