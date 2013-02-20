--
-- VHDL Architecture Modic_Pipeline_lib.Execute_JumpUnit.Execute_JumpUnit
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 19:03:14 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Execute_JumpUnit IS
  PORT( condition_code:IN std_logic_vector(3 DOWNTO 0);
    dest:IN std_logic_vector(3 DOWNTO 0);
    control_vector:IN std_logic_vector(17 DOWNTO 0);
    j:OUT std_logic );
END ENTITY Execute_JumpUnit;

--
ARCHITECTURE Execute_JumpUnit OF Execute_JumpUnit IS
BEGIN
  PROCESS(condition_code, dest, control_vector)
  VARIABLE local_bc, local_v, local_n, local_z, local_j, local_b, a, b, c: std_logic;
  BEGIN
    IF (control_vector(8 DOWNTO 4) = "10000") or (control_vector(8 DOWNTO 4) = "10001") or (control_vector(8 DOWNTO 4) = "10010") or (control_vector(8 DOWNTO 4) = "10011") or (control_vector(8 DOWNTO 4) = "10100") or (control_vector(8 DOWNTO 4) = "10101") THEN
      local_bc := condition_code(3) and dest(3);
      local_v := condition_code(2) and dest(2);
      local_n := condition_code(1) and dest(1);
      local_z := condition_code(0) and dest(0);
      local_j := not control_vector(3);
    
      local_b := not (dest(3) or dest(2) or dest(1) or dest(0));
    
      j <= local_bc or local_v or local_n or local_z or local_j or local_b;
      
    ELSE
      j <= '0';
    END IF;
    
  END PROCESS;
END ARCHITECTURE Execute_JumpUnit;

