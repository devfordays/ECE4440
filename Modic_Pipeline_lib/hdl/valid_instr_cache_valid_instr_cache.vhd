--ModuleWare RAMsp: U_0
Generation: Inline
din, dout width: 16 (manual)
addr width: 3 (auto)
Address width: 3
Data width: 16
Initial value: 0

--attribute block_ram : boolean;
--attribute block_ram of mem : signal is false;
u_0ram_p_proc: PROCESS (clk)
BEGIN
IF (clk'EVENT AND clk='1') THEN
IF (we = '1') THEN
mw_U_0ram_table(CONV_INTEGER(unsigned(addr))) <= din;
END IF;
mw_U_0addr_reg <= addr;
END IF;
END PROCESS u_0ram_p_proc;
dout <= mw_U_0ram_table(CONV_INTEGER(unsigned(mw_U_0addr_reg))); 

