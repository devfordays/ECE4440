--
-- VHDL Simple RAM
-- Mircea Stan
--
LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY easy_RAM_simu IS
  port( 
	  rst   : in	std_logic;                       -- active-high reset
	  hDIn  : in	std_logic_vector (15 DOWNTO 0);  -- data to memory
	  wr    : in	std_logic;                       -- memory write control signal
	  hAddr : in	std_logic_vector (15 DOWNTO 0);  -- memory address
	  hDOut : out	std_logic_vector (15 DOWNTO 0)   -- data from memory
  );
END ENTITY easy_RAM_simu;

--
ARCHITECTURE behavior OF easy_RAM_simu IS
  subtype table_address is integer range 0 to 15;
begin
  process(hAddr,hDIn,wr,rst)
	  type counter_array is array (0 to 65535) of std_logic_vector(15 downto 0);
	  variable table : counter_array;
	  variable table_index: integer;
  begin
	  if (rst = '1') then
		  table := (others => (others => '0'));
---here you insert your program
table(0) := To_stdlogicvector(X"0002");
table(1) := To_stdlogicvector(X"0000");
table(2) := To_stdlogicvector(X"821E");
table(3) := To_stdlogicvector(X"8300");
table(4) := To_stdlogicvector(X"8420");
table(5) := To_stdlogicvector(X"8500");
table(6) := To_stdlogicvector(X"8621");
table(7) := To_stdlogicvector(X"8700");
table(8) := To_stdlogicvector(X"A002");
table(9) := To_stdlogicvector(X"8A01");
table(10) := To_stdlogicvector(X"8B00");
table(11) := To_stdlogicvector(X"6860");
table(12) := To_stdlogicvector(X"A864");
table(13) := To_stdlogicvector(X"A8A2");
table(14) := To_stdlogicvector(X"7E40");
table(15) := To_stdlogicvector(X"BE22");
table(16) := To_stdlogicvector(X"E506");
table(17) := To_stdlogicvector(X"2C40");
table(18) := To_stdlogicvector(X"A4A2");
table(19) := To_stdlogicvector(X"A8A0");
table(20) := To_stdlogicvector(X"4C80");
table(21) := To_stdlogicvector(X"E1F9");
table(22) := To_stdlogicvector(X"7E80");
table(23) := To_stdlogicvector(X"BE62");
table(24) := To_stdlogicvector(X"E505");
table(25) := To_stdlogicvector(X"2C80");
table(26) := To_stdlogicvector(X"A8A2");
table(27) := To_stdlogicvector(X"A0C0");
table(28) := To_stdlogicvector(X"E1FA");
table(29) := To_stdlogicvector(X"E100");
table(30) := To_stdlogicvector(X"0003");
table(31) := To_stdlogicvector(X"000A");
table(32) := To_stdlogicvector(X"000C");
table(33) := To_stdlogicvector(X"0000");

















          elsif (wr = '1') then
	      table_index :=  CONV_INTEGER(hAddr(15 downto 0));
            table(table_index) := hDIn;
            hDOut <= table(table_index);
          else
	      table_index :=  CONV_INTEGER(hAddr(15 downto 0));
            hDOut <= table(table_index);
	  end if;
  end process;
END ARCHITECTURE behavior;

