--
-- VHDL Architecture Modic_Pipeline_lib.CLU.CLU
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 16:16:00 11/19/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY CLU IS
  PORT(jaddr, mdata, pcval:IN std_logic_vector(15 DOWNTO 0);
    mdelay, reset, jump, int, stall:IN std_logic;
    instr, pc:OUT std_logic_vector(15 DOWNTO 0) );
END ENTITY CLU;

--
ARCHITECTURE CLU OF CLU IS
BEGIN
  PROCESS(jaddr, mdata, pcval, mdelay, reset, jump, int)
  VARIABLE localpcval, localjaddr:unsigned(15 DOWNTO 0);
  BEGIN
    localpcval := unsigned(pcval);
    localjaddr := unsigned(jaddr);
    
    IF int = '1' THEN
      pc <= mdata;
    ELSE
      IF reset = '1' THEN
          pc <= mdata;
          instr <= "0000000000000000";
      ELSE
        IF (mdelay = '1') OR (stall = '1') THEN
          pc <= std_logic_vector(localpcval);
          instr <= "0000000000000000";
        ELSE 
          IF jump = '1' THEN
            pc <= std_logic_vector(localjaddr);
          ELSE
            localpcval := localpcval + 1;
            pc <= std_logic_vector(localpcval);
            instr <= mdata;
          END IF;
        END IF;
      END IF;
    END IF;
    END PROCESS;
END ARCHITECTURE CLU;

