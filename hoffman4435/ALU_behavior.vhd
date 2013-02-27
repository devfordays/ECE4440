--
-- VHDL Architecture lab6_lib.ALU.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:22:37 10/23/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY ALU IS
  port(arg0, arg1:in std_logic_vector(15 downto 0);
    OP, CCRin:in std_logic_vector(3 downto 0);
    result:out std_logic_vector(15 downto 0);
    CCRout:out std_logic_vector(3 downto 0));
END ENTITY ALU;

--
ARCHITECTURE behavior OF ALU IS
BEGIN
  process(arg0, arg1, OP, CCRin)
  variable tmpResult, tmp0, tmp1: std_logic_vector(16 downto 0);
  variable tmpCCR: std_logic_vector(3 downto 0);
  constant zero17:std_logic_vector(16 downto 0) := "00000000000000000";
  begin
    tmp0 := zero17;
    tmp1 := zero17;
    tmpResult := zero17;
    tmp0(15 downto 0) := arg0;
    tmp1(15 downto 0) := arg1;
    tmpCCR := "0000";
    if (OP(3) = '0') then
--ALU/logical
      if (OP(2 downto 0) = "000") then
    --Add
        tmpResult := unsigned(tmp0) + unsigned(tmp1);
        
      elsif(OP(2 downto 0) = "001") then
    --add w/ carry
        tmpResult := unsigned(tmp0) + unsigned(tmp1);
        if(CCRin(3) = '1') then
          tmpResult := unsigned(tmpResult) +1;
        end if;
        
      elsif(OP(2 downto 0) = "010") then
    --sub
        tmpResult := unsigned(tmp0) - unsigned(tmp1);
        
      elsif(OP(2 downto 0) = "011") then
    --sub w/ carry
         tmpResult := unsigned(tmp0) - unsigned(tmp1);
         if(CCRin(3) = '1') then
           tmpResult := unsigned(tmpResult) +1; --or is it -1?
         end if;
         
      elsif(OP(2 downto 0) = "100") then
    --and
        tmpResult := tmp0 and tmp1;
        
      elsif(OP(2 downto 0) = "101") then
    --or
        tmpResult := tmp0 or tmp1;
        
      elsif(OP(2 downto 0) = "110") then
    --xor
        tmpResult := tmp0 xor tmp1;
        
      elsif(OP(2 downto 0) = "111") then
    --not
        tmpResult := not tmp0;
        
      end if;
    else
  --Shifts/rotates
      if (OP(2 downto 0) = "000") then
    --shift left
        tmpResult(15 downto 1) := tmp0(14 downto 0);
        
      elsif(OP(2 downto 0) = "001") then
    --shift right logical
        tmpResult(14 downto 0) := tmp0(15 downto 1);
        
      elsif(OP(2 downto 0) = "010") then
    --SRA:  shift right arithmetic
        tmpResult(14 downto 0) := tmp0(15 downto 1);
        tmpResult(15) := tmpResult(14);
        
      elsif(OP(2 downto 0) = "100") then
    --rotate Left
        tmpResult(15 downto 1) := tmp0(14 downto 0);
        tmpResult(0) := CCRin(3);
        tmpCCR(3) := tmp0(15);
    
      elsif(OP(2 downto 0) = "101") then
    --rotate right
        tmpResult(14 downto 0) := tmp0(15 downto 1);
        tmpResult(15) := CCRin(3);
        tmpCCR(3) := tmp0(0);
    
      elsif(OP(2 downto 0) = "110") then
    --rotate right arithmetic
        tmpResult(14 downto 0) := tmp0(15 downto 1);
        tmpResult(15) := tmp0(15);
        tmp0(0) := tmpCCR(3);
    
      end if;
    end if;
    --these would be in all of them...
    --set carry and overflow
    if (tmpResult(16) = '1') then
      tmpCCR(3) := '1';
      --if we have a carry in, and a carry out, weve had overflow
      if(CCRin(3) = '1') then
        tmpCCR(2) := '1';
      end if;
    end if;
    --set negative
    if(tmpResult(15) = '1') then
      tmpCCR(1) := '1';
    end if;
    --set zero
    if (tmpResult = "00000000000000000") then
      tmpCCR(0) := '1';
    end if;
    
    result <= std_logic_vector(tmpResult(15 downto 0));
    CCRout <= tmpCCR;
  end process;
END ARCHITECTURE behavior;

