--
-- VHDL Architecture Modic_Pipeline_lib.Register_Tracker_Control_Logic.Register_Tracker_Control_Logic
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:00:48 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_Tracker_Control_Logic IS
  PORT( ResA, WA : IN std_logic_vector(3 DOWNTO 0);
    register_input : IN std_logic_vector(15 DOWNTO 0);
    W, WWB : IN std_logic;
    register_output : OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY Register_Tracker_Control_Logic;

--
ARCHITECTURE Register_Tracker_Control_Logic OF Register_Tracker_Control_Logic IS
BEGIN
  PROCESS(ResA, W, WA, WWB, register_input)
  BEGIN
    
    register_output <= register_input;
    
    --Make things clean
    IF WWB = '1' THEN
      case WA is
      when "0000" =>
        register_output(0) <= '0';
      when "0001" =>
        register_output(1) <= '0';
      when "0010" =>
        register_output(2) <= '0';
      when "0011" =>
        register_output(3) <= '0';
      when "0100" =>
        register_output(4) <= '0';
      when "0101" =>
        register_output(5) <= '0';
      when "0110" =>
        register_output(6) <= '0';
      when "0111" =>
        register_output(7) <= '0';
      when "1000" =>
        register_output(8) <= '0';
      when "1001" =>
        register_output(9) <= '0';
      when "1010" =>
        register_output(10) <= '0';
      when "1011" =>
        register_output(11) <= '0';
      when "1100" =>
        register_output(12) <= '0';
      when "1101" =>
        register_output(13) <= '0';
      when "1110" =>
        register_output(14) <= '0';
      when "1111" =>
        register_output(15) <= '0';
      when others =>
        --do nothing
      end case;
    END IF;
    
    
    IF W = '1' THEN
      case ResA is
        when "0000" =>
        register_output(0) <= '1';
      when "0001" =>
        register_output(1) <= '1';
      when "0010" =>
        register_output(2) <= '1';
      when "0011" =>
        register_output(3) <= '1';
      when "0100" =>
        register_output(4) <= '1';
      when "0101" =>
        register_output(5) <= '1';
      when "0110" =>
        register_output(6) <= '1';
      when "0111" =>
        register_output(7) <= '1';
      when "1000" =>
        register_output(8) <= '1';
      when "1001" =>
        register_output(9) <= '1';
      when "1010" =>
        register_output(10) <= '1';
      when "1011" =>
        register_output(11) <= '1';
      when "1100" =>
        register_output(12) <= '1';
      when "1101" =>
        register_output(13) <= '1';
      when "1110" =>
        register_output(14) <= '1';
      when "1111" =>
        register_output(15) <= '1';
      when others =>
        --do nothing
      end case;
    END IF;
  END PROCESS;
END ARCHITECTURE Register_Tracker_Control_Logic;

