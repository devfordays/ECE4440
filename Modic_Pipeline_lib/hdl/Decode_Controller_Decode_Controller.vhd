--
-- VHDL Architecture Modic_Pipeline_lib.Decode_Controller.Decode_Controller
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:17:10 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_Controller IS
  PORT (instr : IN std_logic_vector(15 DOWNTO 0);
    dirty, clock : IN std_logic;
    RFA0, RFA1 : OUT std_logic_vector(3 DOWNTO 0);
    controlvector : OUT std_logic_vector(17 DOWNTO 0);
    W: OUT std_logic;
    ResA: OUT std_logic_vector(3 DOWNTO 0) );
END ENTITY Decode_Controller;

--
ARCHITECTURE Decode_Controller OF Decode_Controller IS
BEGIN
PROCESS(instr, dirty)
VARIABLE LM, RM, EM : std_logic_vector(1 DOWNTO 0);
  VARIABLE DM, R0, R1 : std_logic;
BEGIN 
  IF dirty = '0' THEN
  LM := "11";
  RM := "01";
  EM := "11";
  DM := '1';
  
  IF instr(15 DOWNTO 13) = "001" or instr(15 DOWNTO 13) = "010" THEN -- LD and ST
    RFA0 <= instr(8 DOWNTO 5);
    RFA1 <= instr(12 DOWNTO 9);
    RM := "10";
    LM := "01";
    EM := "10";
    DM := '0';
    R0 := '1';
    R1 := '1';
    IF instr(15 DOWNTO 13) = "001" THEN -- LD
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00000" & instr(8) & "01" & '1';
      ResA <= instr(12 DOWNTO 9);
      W <= '1';
    ELSE -- ST
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00000" & instr(8) & "10" & '0';
      ResA <= instr(12 DOWNTO 9);
      W <= '0';
    END IF;
  END IF;
  
  IF instr(15 DOWNTO 13) = "011" THEN -- MOV
    RFA0 <= instr(8 DOWNTO 5);
    RFA1 <= "0000";
    R0 := '1';
    R1 := '0';
    RM := "10";
    LM := "11";
    DM := '0';
    EM := "11";
    controlvector <= R0 & R1 & LM & RM & EM & DM & "00000" & instr(8) & "00" & '1';
    ResA <= instr(12 DOWNTO 9);
      W <= '1';
  END IF;
  
  IF instr(15 DOWNTO 13) = "100" THEN -- LIH and LIL
    RFA1 <= instr(12 DOWNTO 9);
    DM := '0'; 
    R0 := '0';
    R1 := '1';
    LM := "11";
    RM := "01";
    IF instr(8) = '0' THEN -- LIL
      EM := "00";
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00001" & instr(8) & "01" & '1';
    ELSE -- LIH
      EM := "01";
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00010" & instr(8) & "01" & '1';
    END IF; 
    ResA <= instr(12 DOWNTO 9);
    W <= '1';
  END IF;
  
  IF instr(15 DOWNTO 13) = "101" or instr(15 DOWNTO 13) = "110" THEN -- ALU
    RFA0 <= instr(8 DOWNTO 5);
    RFA1 <= instr(12 DOWNTO 9);
    R0 := '1';
    R1 := '1';
    DM := '0';
    LM := "10";
    RM := "10";
    EM := "11";
    IF instr(2 DOWNTO 0) = "000" and instr(15 DOWNTO 13) = "101" THEN --add
      controlvector <= R0 & R1 & LM & RM & EM & DM & "10111" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "001" and instr(15 DOWNTO 13) = "101" THEN --adc
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00011" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "010" and instr(15 DOWNTO 13) = "101" THEN --sub
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00100" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "011" and instr(15 DOWNTO 13) = "101" THEN --sbc
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00101" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "100" and instr(15 DOWNTO 13) = "101" THEN --and
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00110" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "101" and instr(15 DOWNTO 13) = "101" THEN --or
      controlvector <= R0 & R1 & LM & RM & EM & DM & "00111" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "110" and instr(15 DOWNTO 13) = "101" THEN --xor
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01000" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "111" and instr(15 DOWNTO 13) = "101" THEN --not
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01001" & instr(8) & "00" & '1';
    END IF;
    
    IF instr(2 DOWNTO 0) = "000" and instr(15 DOWNTO 13) = "110" THEN --sl
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01010" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "001" and instr(15 DOWNTO 13) = "110" THEN --srl
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01011" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "010" and instr(15 DOWNTO 13) = "110" THEN --sra
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01100" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "110" and instr(15 DOWNTO 13) = "110" THEN --rra
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01101" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "101" and instr(15 DOWNTO 13) = "110" THEN --rr
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01110" & instr(8) & "00" & '1';
    END IF;
    IF instr(2 DOWNTO 0) = "100" and instr(15 DOWNTO 13) = "110" THEN --rl
      controlvector <= R0 & R1 & LM & RM & EM & DM & "01111" & instr(8) & "00" & '1';
    END IF;
    
    ResA <= instr(12 DOWNTO 9);
    W <= '1';
    
  END IF;
  
  
  IF instr(15 DOWNTO 13) = "111" THEN -- JMP and BR
    RFA1 <= instr(12 DOWNTO 9);
    RFA0 <= instr(8 DOWNTO 5);
    R0 := '0';
    R1 := '1';
    DM := '0';
    RM := "00";
    IF instr(8) = '0' THEN --jmp
      LM := "10";
      controlvector <= R0 & R1 & LM & RM & EM & DM & "10000" & instr(8) & "00" & '0';
    ELSE --br
      LM := "00";
      IF instr(12 DOWNTO 9) = "0000" THEN --br
        controlvector <= R0 & R1 & LM & RM & EM & DM & "10001" & instr(8) & "00" & '0';
      END IF;
      IF instr(12 DOWNTO 9) = "1000" THEN --bc
        controlvector <= R0 & R1 & LM & RM & EM & DM & "10010" & instr(8) & "00" & '0';
      END IF;
      IF instr(12 DOWNTO 9) = "0100" THEN --bo
        controlvector <= R0 & R1 & LM & RM & EM & DM & "10011" & instr(8) & "00" & '0';
      END IF;
      IF instr(12 DOWNTO 9) = "0010" THEN --bn
        controlvector <= R0 & R1 & LM & RM & EM & DM & "10100" & instr(8) & "00" & '0';
      END IF;
      IF instr(12 DOWNTO 9) = "0001" THEN --bz
        controlvector <= R0 & R1 & LM & RM & EM & DM & "10101" & instr(8) & "00" & '0';
      END IF;
    END IF;
    ResA <= instr(12 DOWNTO 9);
    W <= '0';
    
  END IF;
  
  IF instr(15 DOWNTO 13) = "000" THEN -- NOP
    RFA0 <= instr(8 DOWNTO 5);
    RFA1 <= instr(12 DOWNTO 9);
    R0 := '0';
    R1 := '0';
    RM := "01";
    LM := "11";
    EM := "11";
    DM := '1';
    controlvector <= R0 & R1 & LM & RM & EM & DM & "10110" & instr(8) & "00" & '0';
  ResA <= instr(12 DOWNTO 9);
    W <= '0';
  END IF;
  
ELSE
  RFA0 <= instr(8 DOWNTO 5);
    RFA1 <= instr(12 DOWNTO 9);
    R0 := '0';
    R1 := '0';
    RM := "01";
    LM := "11";
    EM := "11";
    DM := '1';
    controlvector <= R0 & R1 & LM & RM & EM & DM & "10110" & instr(8) & "00" & '0';
  ResA <= instr(12 DOWNTO 9);
    W <= '0';
END IF;
END PROCESS;
END ARCHITECTURE Decode_Controller;

