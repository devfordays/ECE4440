--
-- VHDL Architecture processor_lib.memControl.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 12:59:32 10/30/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY memControl IS
  port(result, extra:in std_logic_vector(15 downto 0);
    control:in std_logic_vector(3 downto 0);
    read, write:out std_logic;
    memLoc, memOut:out std_logic_vector(15 downto 0);
    memIn:in std_logic_vector(15 downto 0);
    writeback:out std_logic_vector(15 downto 0);
    controlOUT:out std_logic_vector(3 downto 0));
END ENTITY memControl;

--
ARCHITECTURE behavior OF memControl IS
BEGIN
  process(result, control, memIn)
  constant zero:std_logic_vector(15 downto 0) := "0000000000000000";
  variable tmpCTRL:std_logic_vector(3 downto 0);
  begin
    controlOUT <= control;
    if (control(3 downto 1) = "001") then
      read <= '1';
      write <= '0';
      memLoc <= result;
      memOut <= zero;
      writeback <= memIn;
      controlOUT <= control;
    
    elsif(control (3 downto 1) = "010") then
      --STORE
      --set control(0) =1
      read <= '0';
      write <= '1';
      memLoc <= result;
      memOut <= extra;  --extra is the contents of the register to be stored in memory
      writeback <= zero;
      tmpCTRL := control;
      tmpCTRL(0) := '1';
      controlOUT <= tmpCTRL;
            
    elsif(control = "0000") then
      read <= '0';
      write <= '0';
      memLoc <= zero;
      memOut <= zero;
      writeback <= zero;
      controlOUT <= "0001";
    
    else
      --not a memory op
      read <= '0';
      write <= '0';
      writeback <= result;
      
    end if;        
  end process;
END ARCHITECTURE behavior;

