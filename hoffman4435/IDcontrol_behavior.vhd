--
-- VHDL Architecture lab5_lib.instructionFetch.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 18:46:28 10/15/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY IDcontrol IS
  port(inst, pc:in std_logic_vector(15 downto 0);
    rfd0, rfd1:in std_logic_vector(15 downto 0);
    rfa0, rfa1, writeAddr:out std_logic_vector(3 downto 0);
    read0, read1, write:out std_logic;
    arg0, arg1, extra:out std_logic_vector(15 downto 0);
    dest:out std_logic_vector(3 downto 0);
    control:out std_logic_vector(6 downto 0);
    dirty, jump:in std_logic);
END ENTITY IDcontrol;

--
ARCHITECTURE behavior OF IDcontrol IS
BEGIN
  process(inst, pc, rfd0, rfd1, dirty, jump)
    variable opcode:std_logic_vector(2 downto 0);
    variable tmpCtrl:std_logic_vector(6 downto 0) := "0000000";
    variable tmp16:std_logic_vector(15 downto 0);
    variable tmp:std_logic;
    constant zero16:std_logic_vector(15 downto 0) := "0000000000000000";
    constant zero4:std_logic_vector(3 downto 0) := "0000";
  begin
    opcode := inst(15 downto 13);
    tmpCtrl(6 downto 4) := opcode;  --we always want to pass the opcode
    
    --send NOP through if jump asserted
    if((jump = '1') or (dirty = '1')) then
      opcode := "000";
    end if;
    
    if (opcode = "000") then
--nop
      rfa0 <= zero4; --change these two to be the NOP register
      rfa1 <= zero4;
      writeAddr <= zero4;
      read0 <= '0'; --no reads or writes
      read1 <= '0';
      write <= '0';
      arg0 <= zero16;
      arg1 <= zero16;
      extra <= zero16;
      dest <= zero4;
      --control <= tmpCtrl;
      control <= "0000000";
      
    elsif (opcode = "001") then
--load
      --base into arg0, offset into arg1
      rfa0 <= inst(8 downto 5); --base
      rfa1 <= zero4;
      writeAddr <= inst(12 downto 9);
      read0 <= '1';
      read1 <= '0';
      write <= '0';
      arg0 <= rfd0;
      tmp16 := zero16;
      tmp16(4 downto 0) := inst(4 downto 0);
      arg1 <= tmp16;
      extra <= zero16;
      dest <= inst(12 downto 9);
      control <= tmpCtrl;
      
    elsif(opcode = "010") then
--store
      rfa0 <= inst(8 downto 5); --base
      rfa1 <= zero4;  --set it to something just for cleanliness
      writeAddr <= zero4;
      read0 <= '1';   --only reading 1 value from register file
      read1 <= '0';
      write <= '0';   --not writing
      arg0 <= rfd0;   --read back from register file
      --put zeros in form on offest and put into arg1
      tmp16 := zero16;
      tmp16(4 downto 0) := inst(4 downto 0);
      arg1 <= tmp16;
      extra <= zero16;  --not using extra
      dest <= zero4;    --no register destination
      control <= tmpCtrl;
      
    elsif(opcode = "011") then
--move
      rfa0 <= inst(8 downto 5); --src => rfa0
      rfa1 <= zero4;  --not read 2nd value
      writeAddr <= inst(12 downto 9);
      read0 <= '1';
      read1 <= '0';
      write <= '0'; --not writing
      arg0 <= rfd0;
      arg1 <= zero16; --not using arg1
      extra <= zero16;  --not using extra
      dest <= inst(12 downto 9);
      --no additional bit into control vector
      control <= tmpCtrl;
      
    elsif(opcode = "100") then
--load immediates
      rfa0 <= inst(8 downto 5); --base
      rfa1 <= zero4;
      writeAddr <= inst(12 downto 9);
      read0 <= '1';
      read1 <= '0';
      write <= '0';
      --arg0 <= rfd0;
      arg1 <= zero16;
      tmp16 := zero16;
      if (inst(8) = '0') then
        --LIL
        tmp16(7 downto 0) := inst(7 downto 0);
        if (inst(7) = '1') then
          tmp16(15 downto 8) := "11111111";
        end if;
      else
        --LIH
        tmp16 := rfd0;
        tmp16(15 downto 8) := inst(7 downto 0);
      end if;
      arg0 <= tmp16;
      extra <= zero16;
      dest <= inst(12 downto 9);
      control <= tmpCtrl;
      
    elsif(opcode = "101") then
--ALU type 1
      rfa0 <= inst(12 downto 9);
      rfa1 <= inst(8 downto 5);
      writeAddr <= inst(12 downto 9);
      read0 <= '1';
      read1 <= '1';
      write <= '0';
      arg0 <= rfd0;
      arg1 <= rfd1;
      extra <= zero16;
      dest <= inst(12 downto 9);
      tmpCtrl(2 downto 0) := inst(2 downto 0);
      control <= tmpCtrl;
      
    elsif(opcode = "110") then
--ALU type 2 (shifts)
      rfa0 <= inst(8 downto 5);
      rfa1 <= zero4;
      writeAddr <= inst(12 downto 9);
      read0 <= '1';
      read1 <= '0';
      write <= '0';
      arg0 <= rfd0;
      arg1 <= zero16;
      extra <= zero16;
      dest <= inst(12 downto 9);
      tmpCtrl(2 downto 0) := inst(2 downto 0);
      control <= tmpCtrl;
      
    elsif(opcode = "111") then
--jump/branches
      rfa0 <= inst(12 downto 9);
      rfa1 <= zero4;
      writeAddr <= zero4;
      read0 <= '1';
      read1 <= '0';
      write <= '0';
      tmp16 := zero16;
      tmp16(7 downto 0) := inst(7 downto 0);
      arg0 <= tmp16;
      arg1 <= rfd0;
      extra <= zero16;
      dest <= inst(12 downto 9);
      tmpCtrl(3) := inst(8);  --pass along bit to determine if LIL or LIH
      control <= tmpCtrl;
            
    end if;
  end process;
END ARCHITECTURE behavior;

