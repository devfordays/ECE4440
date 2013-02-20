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
table(2) := To_stdlogicvector(X"9221");
table(3) := To_stdlogicvector(X"9300");
table(4) := To_stdlogicvector(X"2120");
table(5) := To_stdlogicvector(X"9400");
table(6) := To_stdlogicvector(X"9500");
table(7) := To_stdlogicvector(X"9601");
table(8) := To_stdlogicvector(X"9700");
table(9) := To_stdlogicvector(X"7E00");
table(10) := To_stdlogicvector(X"BF42");
table(11) := To_stdlogicvector(X"E303");
table(12) := To_stdlogicvector(X"6400");
table(13) := To_stdlogicvector(X"A545");
table(14) := To_stdlogicvector(X"E103");
table(15) := To_stdlogicvector(X"6160");
table(16) := To_stdlogicvector(X"A145");
table(17) := To_stdlogicvector(X"E10E");
table(18) := To_stdlogicvector(X"A562");
table(19) := To_stdlogicvector(X"6200");
table(20) := To_stdlogicvector(X"A345");
table(21) := To_stdlogicvector(X"6640");
table(22) := To_stdlogicvector(X"A745");
table(23) := To_stdlogicvector(X"A762");
table(24) := To_stdlogicvector(X"E307");
table(25) := To_stdlogicvector(X"E100");
table(26) := To_stdlogicvector(X"A020");
table(27) := To_stdlogicvector(X"A762");
table(28) := To_stdlogicvector(X"7E60");
table(29) := To_stdlogicvector(X"B7E2");
table(30) := To_stdlogicvector(X"E3F3");
table(31) := To_stdlogicvector(X"E1FA");
table(32) := To_stdlogicvector(X"E1FF");
table(33) := To_stdlogicvector(X"0005");




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

