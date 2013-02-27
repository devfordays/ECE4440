--
-- VHDL Architecture processor_lib.ReservationStation.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:46:23 11/ 6/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ReservationStation IS
  port(WBaddr:in std_logic_vector(3 downto 0);
    ra0, ra1, IDwriteAddr:in std_logic_vector(3 downto 0);
    read0, read1, WBwrite, IDwrite:in std_logic;
    hold:out std_logic;
    clock:in std_logic);
END ENTITY ReservationStation;

--
ARCHITECTURE behavior OF ReservationStation IS
  signal reservationLoopBack:std_logic_vector(15 downto 0) := (others => '0');
  signal reservation:std_logic_vector(15 downto 0);
  constant one:std_logic := '1';
  signal tmpHold:std_logic;
BEGIN
  --
--  WBaddr:in std_logic_vector(3 downto 0);
--    reservationIN:in std_logic_vector(15 downto 0);
--    ra0, ra1, IDwriteAddr:in std_logic_vector(3 downto 0);
--    read0, read1, WBwrite, IDwrite:in std_logic;
--    reservationOUT:out std_logic_vector(15 downto 0);
--    hold:out std_logic);
  
  reservationControl:entity work.reservationStationControl(behavior)
  port map(WBaddr, reservationLoopBack, ra0, ra1, IDwriteAddr, read0, read1, WBwrite, IDwrite, reservation, hold);
    
  resReg:entity work.reg(behavior)
  generic map(size => 16)
  port map(reservation, reservationLoopBack, clock, one);
  
END ARCHITECTURE behavior;

