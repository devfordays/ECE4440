--
-- VHDL Architecture Modic_Pipeline_lib.Decode_MultSig.Decode_MultSig
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 09:33:08 02/ 6/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Decode_MultSig IS
  PORT( a: IN std_logic_vector(17 DOWNTO 0); --from execute stage
    b : OUT std_logic_vector(17 DOWNTO 0);
    c : OUT std_logic_vector(17 DOWNTO 0) );
END ENTITY Decode_MultSig;

--
ARCHITECTURE Decode_MultSig OF Decode_MultSig IS
BEGIN
  PROCESS(a)
  BEGIN
    b <= a;
    c <= a;
  END PROCESS;
END ARCHITECTURE Decode_MultSig;

