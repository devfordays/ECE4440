--
-- VHDL Architecture processor_lib.reservationStationControl.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 21:07:21 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY reservationStationControl IS
  port(WBaddr:in std_logic_vector(3 downto 0);
    reservationIN:in std_logic_vector(15 downto 0);
    ra0, ra1, IDwriteAddr:in std_logic_vector(3 downto 0);
    read0, read1, WBwrite, IDwrite:in std_logic;
    reservationOUT:out std_logic_vector(15 downto 0);
    hold:out std_logic);
END ENTITY reservationStationControl;

--
ARCHITECTURE behavior OF reservationStationControl IS
BEGIN
  process(WBaddr, reservationIN, ra0, ra1, IDwriteAddr, read0, read1, WBwrite, IDwrite)
  variable reservation:std_logic_vector(15 downto 0);
  variable hold0, hold1, hold2:std_logic;
  begin
    
    --initialize the temp reservation and other things
    reservation := reservationIN;
    hold0 := '0';
    hold1 := '0';
    hold2 := '0';
    
    --handle a cleaning of a bit
    if (WBwrite = '1') then
      --set reservation bit to 0
      reservation(conv_integer(WBaddr)) := '0';
    end if;
    
    --check for 1st read
    if ((read0 = '1') and (reservation(conv_integer(ra0)) = '1')) then
      --we need to hold if we're trying to read a reserved value
      --nothing otherwise
      hold0 := '1';
    end if;
    
    --check for 2nd read
    if ((read1 = '1') and (reservation(conv_integer(ra1)) = '1')) then
      --we need to hold if we're trying to read a reserved value
      --nothing otherwise
      hold1 := '1';
    end if;
    
    --check and set write
    if (IDwrite = '1') then
      if (reservation(conv_integer(IDwriteAddr)) = '1') then
        --value we want to write is already reserved
        hold2 := '1';
      else
        --we're writing and we CAN reserve the register
        reservation(conv_integer(IDwriteAddr)) := '1';
      end if;
    end if;
    
    --send final reservation to output
    reservationOUT <= reservation;
    hold <= (hold0 or hold1 or hold2);
    
  end process;
END ARCHITECTURE behavior;

