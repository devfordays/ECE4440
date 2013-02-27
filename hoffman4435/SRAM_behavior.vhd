--
-- VHDL Architecture processor_lib.SRAM.behavior
--
-- Created:
--          by - drake.UNKNOWN (FOUR_OF_FIVE)
--          at - 20:16:38 11/12/2012
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

LIBRARY std;
USE std.textio.all;

ENTITY SRAM IS
  PORT( Addr, DataIn : IN std_logic_vector(15 DOWNTO 0);
        clock, we : IN std_logic;
        DataOut : OUT std_logic_vector(15 DOWNTO 0));
END ENTITY SRAM;

ARCHITECTURE behavior OF SRAM IS
  CONSTANT Undef : std_logic := 'X';
  CONSTANT LoadFileName : string := "memoryinit.txt";
  CONSTANT TraceFileName : string := "tracefile.txt";
  
  SUBTYPE ST_MEM_ADDR IS std_logic_vector(15 DOWNTO 0);
  SUBTYPE ST_MEM_DATA IS std_logic_vector(15 DOWNTO 0);
  
  CONSTANT Undefined : ST_MEM_DATA := (others => Undef);
  
  TYPE T_MEM_PAGE IS ARRAY(0 TO 1023) OF ST_MEM_DATA; -- Memory Page
  TYPE T_MEM_PAGE_P IS ACCESS T_MEM_PAGE; -- Pointer to memory page
  TYPE T_MEM_PAGE_TBL IS ARRAY(0 TO 63) OF T_MEM_PAGE_P; -- Table of page pointers
    
BEGIN
  
  MEM : PROCESS(Addr, clock)
    VARIABLE MemTable : T_MEM_PAGE_TBL := (others => NULL);
    VARIABLE MemLoaded : BOOLEAN := false;
    VARIABLE page : T_MEM_PAGE_P;
    VARIABLE pagenumber : INTEGER RANGE 0 TO 63;
    VARIABLE wordnumber : INTEGER RANGE 0 to 1023;
    VARIABLE maddr : ST_MEM_ADDR;
    VARIABLE mdata : ST_MEM_DATA;
    VARIABLE invalid_addr : BOOLEAN;
    VARIABLE findex : natural;
    VARIABLE L : LINE;
    VARIABLE BV : bit_vector(15 DOWNTO 0);
    VARIABLE IV : integer;
    FILE load_file : TEXT OPEN read_mode IS LoadFileName;
    FILE trace_file : TEXT OPEN write_mode IS TraceFileName;
    
  BEGIN
    IF (NOT MemLoaded) THEN
      page := NEW T_MEM_PAGE; -- Allocate a memory page
      MemTable(0) := page; -- Save pointer in memory table
      MemLoaded := true;
      FOR w IN T_MEM_PAGE'RANGE LOOP
        page(w) := Undefined; -- Mark data on page undefined
      END LOOP;
      findex := 0;
      WHILE ((NOT ENDFILE(load_file)) AND (findex < 1024)) LOOP -- Load page zero
        READLINE(load_file,L);
        READ(L,BV);
        page(findex) := To_StdLogicVector(BV);
        findex := findex + 1;
      END LOOP;
      -- Page zero initialized     
    END IF;
    
    maddr := Addr;
    invalid_addr := IS_X(maddr);
    
    IF NOT invalid_addr THEN
      pagenumber := CONV_INTEGER(maddr(15 DOWNTO 10));
      wordnumber := CONV_INTEGER(maddr(9 DOWNTO 0));
    END IF;     
    
    IF (rising_edge(clock) AND (we = '1') AND NOT invalid_addr) THEN
      IF (MemTable(pagenumber) = NULL) THEN -- Allocate page
        page := NEW T_MEM_PAGE;
        MemTable(pagenumber) := page;
        FOR w IN T_MEM_PAGE'RANGE LOOP
          page(w) := Undefined; -- Mark data on page undefined
        END LOOP;
      END IF;
      page := MemTable(pagenumber);
      mdata := DataIn;
      page(wordnumber) := mdata;

      write(L, time'image(now));
      write(L, string'(": "));
      write(L, wordnumber);
      write(L, string'(" -> ["));
      IV := CONV_INTEGER(mdata);
      write(L,IV);
      write(L, string'("]"));
      writeline(trace_file,L);
    END IF;
    
    IF invalid_addr THEN
      DataOut <= Undefined;
    ELSE
      IF (MemTable(pagenumber) = NULL) THEN
        DataOut <= Undefined;
      ELSE
        page := MemTable(pagenumber);
        mdata := page(wordnumber);
        DataOut <= mdata;
      END IF;
    END IF;
    
  END PROCESS;
    
END ARCHITECTURE behavior;