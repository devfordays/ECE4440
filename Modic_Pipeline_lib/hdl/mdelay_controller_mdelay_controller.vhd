--
-- VHDL Architecture Modic_Pipeline_lib.mdelay_controller.mdelay_controller
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 14:49:33 03/15/2013
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY mdelay_controller IS
  PORT(
    r_from_processor, w_from_processor, mAck : IN std_logic;
    mdelay, write : OUT std_logic 
  );
END ENTITY mdelay_controller;

--
ARCHITECTURE mdelay_controller OF mdelay_controller IS
BEGIN
  PROCESS(r_from_processor, w_from_processor, mAck)
  BEGIN
    IF w_from_processor /= 'U' THEN
      write <= w_from_processor;
    ELSE
      write <= '0';
    END IF;
    
    mdelay <= '0';
    
    IF (r_from_processor = '1') OR (w_from_processor = '1') THEN
      mdelay <= '1';
    END IF;
    
      IF w_from_processor = '1' THEN
        IF falling_edge(mAck) THEN
          mdelay <= '0';
          write <= '0';
        END IF;
      END IF;
    END PROCESS;
END ARCHITECTURE mdelay_controller;

