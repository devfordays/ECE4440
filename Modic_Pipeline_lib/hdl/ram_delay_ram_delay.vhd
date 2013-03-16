--
-- VHDL Architecture Modic_Pipeline_lib.ram_delay.ram_delay
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:27:50 03/12/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_signed.all;
USE ieee.numeric_std.all;
USE ieee.math_real.all;


ENTITY ram_delay IS
  port( 
	  rst   : in	std_logic;                       -- active-high reset
	  hDIn  : in	std_logic_vector (15 DOWNTO 0);  -- data to memory
	  wr    : in	std_logic;                       -- memory write control signal
	  rd    : in	std_logic;                       -- memory read control signal
	  ack    : out	std_logic;                       -- acknowledge signal from memory
	  hAddr : in	std_logic_vector (15 DOWNTO 0);  -- memory address
	  hDOut : out	std_logic_vector (15 DOWNTO 0)   -- data from memory
  );
END ENTITY ram_delay;

--
ARCHITECTURE ram_delay OF ram_delay IS
  subtype table_address is integer range 0 to 15;
begin
  process(hAddr,hDIn,wr,rd,rst)
	  type counter_array is array (0 to 65535) of std_logic_vector(15 downto 0);
	  variable table : counter_array;
	  variable table_index: integer;
    variable seed1, seed2: positive;               -- Seed values for random generator
    variable rand: real;                           -- Random real-number value in range 0 to 1.0
    variable delay: time;                           -- delay in main memory
  begin
    ack <= '0';
          
    UNIFORM(seed1, seed2, rand);
    delay := (rand*0.0000001)*10 sec;              -- random delay between 0 and 1000 ns
	  if (rst = '1') then
		  table := (others => (others => '0'));
      table(0) := To_stdlogicvector(X"97FF");   ---here you insert your program
      table(1) := To_stdlogicvector(X"9A00");
      table(2) := To_stdlogicvector(X"9900");
      table(3) := To_stdlogicvector(X"87FF");
      table(4) := To_stdlogicvector(X"8A01");
      table(5) := To_stdlogicvector(X"8900");
      table(6) := To_stdlogicvector(X"3877");
      table(7) := To_stdlogicvector(X"7789");
      table(8) := To_stdlogicvector(X"188A");
      table(9) := To_stdlogicvector(X"3788");
      table(10) := To_stdlogicvector(X"9600");


    elsif (wr = '1' and rd = '0') then
           
            table_index :=  CONV_INTEGER(hAddr(15 downto 0));
            table(table_index) := hDIn;
            hDOut <= table(table_index) after delay;
            ack <= '1' after delay, '0' after delay + 5 ns;
            
    elsif (rd = '1' and wr = '0') then
	          table_index :=  CONV_INTEGER(hAddr(15 downto 0));--	       
            hDOut <= table(table_index) after delay;
            ack <= '1' after delay, '0' after delay + 5 ns;

	  end if;
  end process;
END ARCHITECTURE ram_delay;

