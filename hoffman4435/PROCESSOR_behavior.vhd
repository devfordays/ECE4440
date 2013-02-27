--
-- VHDL Architecture processor_lib.PROCESSOR.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:25:12 11/12/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY PROCESSOR IS
  port(clock, reset, interrupt:in std_logic);
END ENTITY PROCESSOR;

--
ARCHITECTURE behavior OF PROCESSOR IS
  signal IFstall, memDelay, dirty, jump:std_logic;
  signal IFmemAddr, IFmemData, IFinstOUT, IFpcOUT:std_logic_vector(15 downto 0);
  signal IDarg0, IDarg1, IDextra, RFD0, RFD1, ALUresult, ALUextra, MSdataRead, MSdataWrite, MSmemloc, 
          MSwriteback, WBtoReg, toSRAM, fromSRAM, addrSRAM:std_logic_vector(15 downto 0);
  signal IDdest, RFA0, RFA1, IDwriteAddr, ALUcontrol, ALUdest, MSdest, MScontrol, WBdest:std_logic_vector(3 downto 0);
  signal IDcontrol:std_logic_vector(6 downto 0);
  signal IDregRead0, IDregRead1, IDregWrite, MSread, MSwrite, WBwrite, writeSRAM:std_logic;
  
BEGIN
  
  --if memdelay or dirty is 1, we want to stll the IF stage.  i.e., load the same instruction on the next clock
  IFstallBit:entity work.OR1bit(behavior)
  port map(memDelay, dirty, IFstall);
  
--IF stage
  InstructionFetch:entity work.FetchStage(fetchArch)
  port map(IFmemAddr, IFinstOUT, IFpcOUT, IFmemData, ALUresult, memDelay, IFstall, reset, jump, interrupt, clock);
   
--ID stage
  InstructionDecode:entity work.InstructionDecode(behavior)
  port map(IFinstOUT, IFpcOUT, RFD0, RFD1, RFA0, RFA1, IDwriteAddr, IDregRead0, IDregRead1, IDregWrite, dirty, 
  IDarg0, IDarg1, IDextra, IDdest, IDcontrol, jump, clock);
  
--Register File
  RegisterFile:entity work.RegisterFile(behavior)
  port map(WBtoReg, WBdest, WBwrite, RFA0, RFA1, RFD0, RFD1, IDregRead0, IDregRead1, clock);
  
--Reservation Station
  ReservationStation:entity work.ReservationStation(behavior)
  port map(WBdest, RFA0, RFa1, IDwriteAddr, IDregRead0, IDregRead1, WBwrite, IDregWrite, dirty, clock);
  
--Execute Stage
  Execute:entity work.ALUstage(behavior)                                                        --intentional.  jump feeds back into ALU
  port map(IDarg0, IDarg1, IDextra, IDdest, IDcontrol, ALUresult, ALUextra, ALUdest, ALUcontrol, jump, jump, clock);
  
--MEM stge
  MemoryStage:entity work.memStage(behavior)
  port map(ALUresult, ALUextra, ALUcontrol, ALUdest, MSdataRead, MSread, MSwrite, MSmemloc, MSdataWrite, MSwriteback, 
  MScontrol, MSdest, clock);
  
--Memory Arbiter
  MemoryArbiter:entity work.memoryArbiter(behavior)
  port map(MSmemloc, MSdataWrite, MSdataRead, MSread, MSwrite, IFmemAddr, IFmemData, memDelay, addrSRAM, toSRAM, writeSRAM, fromSRAM);
  
--memory/SRAM
  MEMORY:entity work.SRAM(behavior)
  port map(addrSRAM, toSRAM, clock, writeSRAM, fromSRAM);
  
--Writeback Stage
  WriteBack:entity work.WriteBack(behavior)
  port map(MSwriteback, MSdest, MScontrol, WBtoReg, WBdest, WBwrite);   --no clock bc reg file is the register
   
END ARCHITECTURE behavior;

