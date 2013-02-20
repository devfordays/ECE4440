--
-- VHDL Architecture Modic_Pipeline_lib.Register_Tracker_Control_MUX.Register_Tracker_Control_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:58:17 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_Tracker_Control_MUX IS
  PORT( register_tracker: IN std_logic_vector(15 DOWNTO 0);
    RA : IN std_logic_vector(3 DOWNTO 0);
    R : IN std_logic;
    output : OUT std_logic );
END ENTITY Register_Tracker_Control_MUX;

--
ARCHITECTURE Register_Tracker_Control_MUX OF Register_Tracker_Control_MUX IS
BEGIN
  PROCESS(register_tracker, RA, R)
  BEGIN
    IF R = '1' THEN
      case RA is
      when "0000" =>
        IF register_tracker(0) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0001" =>
        IF register_tracker(1) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0010" =>
        IF register_tracker(2) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0011" =>
        IF register_tracker(3) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0100" =>
        IF register_tracker(4) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0101" =>
        IF register_tracker(5) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0110" =>
        IF register_tracker(6) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "0111" =>
        IF register_tracker(7) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1000" =>
        IF register_tracker(8) = '1' THEN
          output <= '1';
        ELSE 
          output <= '0';
        END IF;
      when "1001" =>
        IF register_tracker(9) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1010" =>
        IF register_tracker(10) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1011" =>
        IF register_tracker(11) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1100" =>
        IF register_tracker(12) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1101" =>
        IF register_tracker(13) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1110" =>
        IF register_tracker(14) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when "1111" =>
        IF register_tracker(15) = '1' THEN
          output <= '1';
        ELSE
          output <= '0';
        END IF;
      when others =>
        output <= '0';
    end case;
  ELSE 
    output <= '0';
  END IF;
      
  END PROCESS;
END ARCHITECTURE Register_Tracker_Control_MUX;

