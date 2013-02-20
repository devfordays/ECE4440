--
-- VHDL Architecture Modic_Pipeline_lib.Register_File_four_sixteen_MUX.Register_File_four_sixteen_MUX
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:06:51 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_File_four_sixteen_MUX IS
  PORT( input : IN std_logic_vector(3 DOWNTO 0);
    output : OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    e : IN std_logic );
END ENTITY Register_File_four_sixteen_MUX;

--
ARCHITECTURE Register_File_four_sixteen_MUX OF Register_File_four_sixteen_MUX IS
BEGIN
  PROCESS(input, e)
  BEGIN
    IF e = '1' THEN
    case input is
    when "0000" =>
      output <= "0000000000000001";
    when "0001" =>
      output <= "0000000000000010";
    when "0010" =>
      output <= "0000000000000100";
    when "0011" =>
      output <= "0000000000001000";
    when "0100" =>
      output <= "0000000000010000";
    when "0101" =>
      output <= "0000000000100000";
    when "0110" =>
      output <= "0000000001000000";
    when "0111" =>
      output <= "0000000010000000";
    when "1000" =>
      output <= "0000000100000000";
    when "1001" =>
      output <= "0000001000000000";
    when "1010" =>
      output <= "0000010000000000";
    when "1011" =>
      output <= "0000100000000000";
    when "1100" =>
      output <= "0001000000000000";
    when "1101" =>
      output <= "0010000000000000";
    when "1110" =>
      output <= "0100000000000000";
    when "1111" =>
      output <= "1000000000000000";
    when others =>
      output <= "0000000000000000";
  end case;
ELSE
  output <= "0000000000000000";
  END IF;
      
  END PROCESS;
END ARCHITECTURE Register_File_four_sixteen_MUX;

