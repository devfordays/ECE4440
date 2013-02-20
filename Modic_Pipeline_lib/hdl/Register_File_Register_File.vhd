--
-- VHDL Architecture Modic_Pipeline_lib.Register_File.Register_File
--
-- Created:
--          by - Owner.UNKNOWN (OWNER-PC)
--          at - 20:04:32 11/20/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;

ENTITY Register_File IS
  PORT( WA, RA1, RA0 : IN std_logic_vector(3 DOWNTO 0);
    WriteData : IN std_logic_vector(15 DOWNTO 0);
    RD0, RD1 : OUT std_logic_vector(15 DOWNTO 0) := "0000000000000000";
    clock, w : IN std_logic;
    E0, E1 : IN std_logic );
END ENTITY Register_File;

--
ARCHITECTURE Register_File OF Register_File IS
  CONSTANT one : std_logic := '1';
  signal writing, reading1, reading0, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15 : std_logic_vector(15 DOWNTO 0) := "0000000000000000";
BEGIN
  writeMux : entity work.Register_File_four_sixteen_MUX(Register_File_four_sixteen_MUX)
    port map (WA, writing, w);
      
  RA1Mux : entity work.Register_File_four_sixteen_MUX(Register_File_four_sixteen_MUX)
    port map (RA1, reading1, E1);
      
  RA0Mux : entity work.Register_File_four_sixteen_MUX(Register_File_four_sixteen_MUX)
    port map (RA0, reading0, E0);
      
      
  Reg0 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out0, clock, writing(0));  
  tri1 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out0, RD1, reading1(0));
  tri0 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out0, RD0, reading0(0));
      
      
  Reg1 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out1, clock, writing(1));  
  tri3 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out1, RD1, reading1(1));
  tri2 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out1, RD0, reading0(1));
      
      
  Reg2 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out2, clock, writing(2));  
  tri5 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out2, RD1, reading1(2));
  tri4 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out2, RD0, reading0(2));
      
      
  Reg3 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out3, clock, writing(3));  
  tri7 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out3, RD1, reading1(3));
  tri6 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out3, RD0, reading0(3));
      
      
  Reg4 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out4, clock, writing(4));  
  tri9 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out4, RD1, reading1(4));
  tri8 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out4, RD0, reading0(4));
      
      
  Reg5 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out5, clock, writing(5));  
  tri11 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out5, RD1, reading1(5));
  tri10 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out5, RD0, reading0(5));
      
  
  Reg6 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out6, clock, writing(6));  
  tri13 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out6, RD1, reading1(6));
  tri12 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out6, RD0, reading0(6));
      
      
  Reg7 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out7, clock, writing(7));  
  tri15 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out7, RD1, reading1(7));
  tri14 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out7, RD0, reading0(7));
      
      
  Reg8 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out8, clock, writing(8));  
  tri17 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out8, RD1, reading1(8));
  tri16 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out8, RD0, reading0(8));
      
      
  Reg9 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out9, clock, writing(9));  
  tri19 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out9, RD1, reading1(9));
  tri18 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out9, RD0, reading0(9));
      
      
  Reg10 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out10, clock, writing(10));  
  tri21 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out10, RD1, reading1(10));
  tri20 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out10, RD0, reading0(10));
      
      
  Reg11 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out11, clock, writing(11));  
  tri23 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out11, RD1, reading1(11));
  tri22 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out11, RD0, reading0(11));
      
      
  Reg12 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out12, clock, writing(12));  
  tri25 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out12, RD1, reading1(12));
  tri24 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out12, RD0, reading0(12));
      
      
  Reg13 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out13, clock, writing(13));  
  tri27 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out13, RD1, reading1(13));
  tri26 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out13, RD0, reading0(13));
      
      
  Reg14 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out14, clock, writing(14));  
  tri29 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out14, RD1, reading1(14));
  tri28 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out14, RD0, reading0(14));
      
      
  Reg15 : entity work.Reg(Reg)
    GENERIC MAP(size => 16)
    port map (WriteData, out15, clock, writing(15));  
  tri31 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out15, RD1, reading1(15));
  tri30 : entity work.Register_File_TriState(Register_File_TriState)
    GENERIC MAP(size => 16)
    port map (out15, RD0, reading0(15));
      

END ARCHITECTURE Register_File;

