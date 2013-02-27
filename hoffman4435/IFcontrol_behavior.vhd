--
-- VHDL Architecture lab4_lib.IFcontrol.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 18:48:32 09/25/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY IFcontrol IS
  port ( int, reset, stall, jump, mdelay:in std_logic;
    pcm, im, mam:out std_logic_vector(1 downto 0));
END ENTITY IFcontrol;

--
ARCHITECTURE behavior OF IFcontrol IS
BEGIN
  process(int, reset, stall, jump, mdelay)
  begin
    if (reset = '1') then
      --handle reset
      if (mdelay = '1') then
        --keep reseting.  how?
        --just reload the same instruction?  PC
        mam <= "10";  --PC
      else  --mdelay = '0'
        mam <= "00";
      end if;
      im <= "01";
      pcm <= "01";
      
    elsif (int = '1') then
      --handle interrupt
      mam <= "01";
      pcm <= "11";
      im <= "00";
      
    elsif (stall = '1') then
      --handle stall
      --dont do anything.  reload same pc?
      im <= "01";   --send NOP to ID 
      pcm <= "01";  --reload old PC
      mam <= "10";  --dont really care
      
    elsif (jump = '1') then
      --handle jump
      pcm <= "10"; --load new PC
      im <= "10";
      mam <= "10";
      
    else
      --handle run
      mam <= "10";
      
      if (mdelay = '1')  then
        --stay put.
        im <= "01";
        pcm <= "01";
      else 
        --normal run
        im <= "10";
        pcm <= "00";
      end if;
    end if;
  end process;
END ARCHITECTURE behavior;

