--
-- VHDL Architecture Modic_Pipeline_lib.Execute_ALU.Execute_ALU
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:01:34 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Execute_ALU IS
  PORT (left:IN std_logic_vector(15 DOWNTO 0);
    right:IN std_logic_vector(15 DOWNTO 0);
    control_vector:IN std_logic_vector(17 DOWNTO 0);
    in_condition_code:IN std_logic_vector(3 DOWNTO 0); 
    result:OUT std_logic_vector(15 DOWNTO 0); 
    out_condition_code:OUT std_logic_vector(3 DOWNTO 0) );
END ENTITY Execute_ALU;

--
ARCHITECTURE Execute_ALU OF Execute_ALU IS
BEGIN
  PROCESS(left, right, control_vector, in_condition_code)
  VARIABLE local_unsigned_left : unsigned(15 DOWNTO 0);
  VARIABLE local_unsigned_right : unsigned(15 DOWNTO 0);
  VARIABLE local_unsigned_result : unsigned(15 DOWNTO 0);
  VARIABLE local_signed_left : signed(15 DOWNTO 0);
  VARIABLE local_signed_right : signed(15 DOWNTO 0);
  VARIABLE local_signed_result : signed(15 DOWNTO 0);
  VARIABLE condition_code_bits : std_logic_vector(3 DOWNTO 0);
  VARIABLE local_left : unsigned(15 DOWNTO 0);
  BEGIN 
    
    
    
  local_unsigned_left := unsigned(left);
  local_unsigned_right := unsigned(right);
  --local_unsigned_result := unsigned(result);
  local_signed_left := signed(left);
  local_signed_right := signed(right);
  --local_signed_result := signed(result);
    
    IF in_condition_code = "UUUU" THEN
        out_condition_code <= "0000";
    END IF;
    
    
    
    CASE control_vector(8 DOWNTO 4) IS
      
      
      
    WHEN "00000" => --LD/ST/MOV
      local_unsigned_result := local_unsigned_left + local_unsigned_right;
      result <= std_logic_vector(local_unsigned_result);
      IF in_condition_code /= "UUUU" THEN
        out_condition_code <= in_condition_code;
      END IF;
      
    WHEN "00001" => --LIL (it essentially does nothing, because left and right both equal 0)
      local_unsigned_result := local_unsigned_left + local_unsigned_right;
      result <= std_logic_vector(local_unsigned_result);
      IF in_condition_code /= "UUUU" THEN
        out_condition_code <= in_condition_code;
      END IF;
      
    WHEN "00010" => --LIH (it essentially does nothing, because left and right both equal 0)
      local_unsigned_result := local_unsigned_left + local_unsigned_right;
      result <= std_logic_vector(local_unsigned_result);
      IF in_condition_code /= "UUUU" THEN
        out_condition_code <= in_condition_code;
      END IF;
      
    WHEN "10111" => --ADD
      local_signed_result := local_signed_left + local_signed_right;
      IF (local_signed_result < 0 and local_signed_left > 0 and local_signed_right > 0) or (local_signed_result > 0 and local_signed_left < 0 and local_signed_right < 0)THEN
        condition_code_bits(3) := '1'; --carry
      ELSE
        condition_code_bits(3) := '0'; --no carry
      END IF;
      
      IF (local_signed_result < -65536) or (local_signed_result > 65535)THEN
        condition_code_bits(2) := '1'; --overflow
      ELSE
        condition_code_bits(2) := '0'; --no overflow
      END IF;
      
      IF (local_signed_result < 0) THEN
        condition_code_bits(1) := '1'; --negative
      ELSE
        condition_code_bits(1) := '0'; --positive
      END IF;
      
      IF (local_signed_result = 0) THEN
        condition_code_bits(0) := '1'; --zero
      ELSE
        condition_code_bits(0) := '0'; --non-zero
      END IF;
      result <= std_logic_vector(local_signed_result);
      IF condition_code_bits /= "UUUU" THEN
        out_condition_code <= condition_code_bits;
      END IF;
      
      
    WHEN "00011" => --ADC
      local_signed_result := local_signed_left + local_signed_right;
      IF in_condition_code(3) = '1' THEN
        local_signed_result := local_signed_result + 1;
      END IF;
      
      IF (local_signed_result < 0 and local_signed_left > 0 and local_signed_right > 0) or (local_signed_result > 0 and local_signed_left < 0 and local_signed_right < 0)THEN
        condition_code_bits(3) := '1'; --carry
      ELSE
        condition_code_bits(3) := '0'; --no carry
      END IF;
      
      IF (local_signed_result < -65536) or (local_signed_result > 65535)THEN
        condition_code_bits(2) := '1'; --overflow
      ELSE
        condition_code_bits(2) := '0'; --no overflow
      END IF;
      
      IF (local_signed_result < 0) THEN
        condition_code_bits(1) := '1'; --negative
      ELSE
        condition_code_bits(1) := '0'; --positive
      END IF;
      
      IF (local_signed_result = 0) THEN
        condition_code_bits(0) := '1'; --zero
      ELSE
        condition_code_bits(0) := '0'; --non-zero
      END IF;
      result <= std_logic_vector(local_signed_result);
      IF condition_code_bits /= "UUUU" THEN
        out_condition_code <= condition_code_bits;
      END IF;
      
      
      WHEN "00100" => --SUB
      local_signed_result := local_signed_left - local_signed_right;
      IF (local_signed_result < 0 and local_signed_left > 0 and local_signed_right < 0) or (local_signed_result > 0 and local_signed_left < 0 and local_signed_right > 0)THEN
        condition_code_bits(3) := '1'; --carry
      ELSE
        condition_code_bits(3) := '0'; --no carry
      END IF;
      
      IF (local_signed_result < -65536) or (local_signed_result > 65535)THEN
        condition_code_bits(2) := '1'; --overflow
      ELSE
        condition_code_bits(2) := '0'; --no overflow
      END IF;
      
      IF (local_signed_result < 0) THEN
        condition_code_bits(1) := '1'; --negative
      ELSE
        condition_code_bits(1) := '0'; --positive
      END IF;
      
      IF (local_signed_result = 0) THEN
        condition_code_bits(0) := '1'; --zero
      ELSE
        condition_code_bits(0) := '0'; --non-zero
      END IF;
      result <= std_logic_vector(local_signed_result);
      IF condition_code_bits /= "UUUU" THEN
        out_condition_code <= condition_code_bits;
      END IF;
      
      
      WHEN "00101" => --SBC
      IF in_condition_code(3) = '1' THEN --if carry is 1
        IF local_signed_left < 0 THEN
          local_signed_left := local_signed_left - 32768;
        END IF;
        IF local_signed_left > 0 THEN
          local_signed_left := local_signed_left + 32768;
        END IF;
      END IF;
      local_signed_result := local_signed_left - local_signed_right;
      IF (local_signed_result < 0 and local_signed_left > 0 and local_signed_right < 0) or (local_signed_result > 0 and local_signed_left < 0 and local_signed_right > 0)THEN
        condition_code_bits(3) := '1'; --carry
      ELSE
        condition_code_bits(3) := '0'; --no carry
      END IF;
      
      IF (local_signed_result < -65536) or (local_signed_result > 65535)THEN
        condition_code_bits(2) := '1'; --overflow
      ELSE
        condition_code_bits(2) := '0'; --no overflow
      END IF;
      
      IF (local_signed_result < 0) THEN
        condition_code_bits(1) := '1'; --negative
      ELSE
        condition_code_bits(1) := '0'; --positive
      END IF;
      
      IF (local_signed_result = 0) THEN
        condition_code_bits(0) := '1'; --zero
      ELSE
        condition_code_bits(0) := '0'; --non-zero
      END IF;
      result <= std_logic_vector(local_signed_result);
      IF condition_code_bits /= "UUUU" THEN
        out_condition_code <= condition_code_bits;
      END IF;
      
      
      WHEN "00110" => --AND
        result <= left and right;
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "00111" => --OR
        result <= left or right;
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
      
      
      WHEN "01000" => --XOR
        result <= left xor right;
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "01001" => --NOT
        result <= not right;
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "01010" => --SL
        result <= right(14 DOWNTO 0) & '0';
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "01011" => --SRL
        result <= '0' & right(15 DOWNTO 1);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "01100" => --SRA
        result <= right(15) & right(15 DOWNTO 1);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "01101" => --RRA
        result <= right(15) & right(15 DOWNTO 1);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= right(0) & in_condition_code(2 DOWNTO 0);
        END IF;
        
        
      WHEN "01110" => --RR
        result <= in_condition_code(3) & right(15 DOWNTO 1);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= right(0) & in_condition_code(2 DOWNTO 0);
        END IF;
        
        
      WHEN "01111" => --RL
        result <= right(14 DOWNTO 0) & in_condition_code(3);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= right(15) & in_condition_code(2 DOWNTO 0);
        END IF;
        
        
      WHEN "10000" => --JMP
        
        IF left(15) = '1' THEN --negative
          --local_left = not left;
          local_unsigned_right := unsigned(not right);
          local_unsigned_right := local_unsigned_right + 1;
          local_unsigned_result := local_unsigned_left - local_unsigned_right;
        ELSE --positive
          local_unsigned_result := local_unsigned_left + local_unsigned_right;
        END IF;
        
        
        
        --local_unsigned_result := local_unsigned_right + local_signed_left;
        result <= std_logic_vector(local_unsigned_result);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        EnD IF;
        
        
      WHEN "10001" => --BR
        IF left(15) = '1' THEN --negative
          --local_left = not left;
          local_unsigned_right := unsigned(not right);
          local_unsigned_right := local_unsigned_right + 1;
          local_unsigned_result := local_unsigned_left - local_unsigned_right;
        ELSE --positive
          local_unsigned_result := local_unsigned_left + local_unsigned_right;
        END IF;
        
        --local_unsigned_result := local_unsigned_right + local_signed_left;
        result <= std_logic_vector(local_unsigned_result);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "10010" => --BC
        IF left(15) = '1' THEN --negative
          --local_left = not left;
          local_unsigned_right := unsigned(not right);
          local_unsigned_right := local_unsigned_right + 1;
          local_unsigned_result := local_unsigned_left - local_unsigned_right;
        ELSE --positive
          local_unsigned_result := local_unsigned_left + local_unsigned_right;
        END IF;
        
        --local_unsigned_result := local_unsigned_right + local_signed_left;
        result <= std_logic_vector(local_unsigned_result);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "10011" => --BO
        IF left(15) = '1' THEN --negative
          --local_left = not left;
          local_unsigned_right := unsigned(not right);
          local_unsigned_right := local_unsigned_right + 1;
          local_unsigned_result := local_unsigned_left - local_unsigned_right;
        ELSE --positive
          local_unsigned_result := local_unsigned_left + local_unsigned_right;
        END IF;
        
        --local_unsigned_result := local_unsigned_right + local_signed_left;
        result <= std_logic_vector(local_unsigned_result);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "10100" => --BN
        IF left(15) = '1' THEN --negative
          --local_left = not left;
          local_unsigned_right := unsigned(not right);
          local_unsigned_right := local_unsigned_right + 1;
          local_unsigned_result := local_unsigned_left - local_unsigned_right;
        ELSE --positive
          local_unsigned_result := local_unsigned_left + local_unsigned_right;
        END IF;
        
        --local_unsigned_result := local_unsigned_right + local_signed_left;
        result <= std_logic_vector(local_unsigned_result);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN "10101" => --BZ
        IF left(15) = '1' THEN --negative
          --local_left = not left;
          local_unsigned_right := unsigned(not right);
          local_unsigned_right := local_unsigned_right + 1;
          local_unsigned_result := local_unsigned_left - local_unsigned_right;
        ELSE --positive
          local_unsigned_result := local_unsigned_left + local_unsigned_right;
        END IF;
        
        --local_unsigned_result := local_unsigned_right + local_signed_left;
        result <= std_logic_vector(local_unsigned_result);
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
        
        
      WHEN OTHERS => --NOP
        result <= "0000000000000000";
        IF in_condition_code /= "UUUU" THEN
          out_condition_code <= in_condition_code;
        END IF;
      
    END CASE;
  END PROCESS;

END ARCHITECTURE Execute_ALU;

