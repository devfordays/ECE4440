-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Fetch_Stage_Fetch_Stage_config OF Fetch_Stage IS
   FOR Fetch_Stage
      FOR ALL : Fetch_Incrementer
         USE ENTITY Modic_Pipeline_lib.Fetch_Incrementer(Fetch_Incrementer);
      END FOR;
      FOR ALL : Fetch_Instr_MUX
         USE ENTITY Modic_Pipeline_lib.Fetch_Instr_MUX(Fetch_Instr_MUX);
      END FOR;
      FOR ALL : Fetch_Mem_MUX
         USE ENTITY Modic_Pipeline_lib.Fetch_Mem_MUX(Fetch_Mem_MUX);
      END FOR;
      FOR ALL : Fetch_PCVal_MUX
         USE ENTITY Modic_Pipeline_lib.Fetch_PCVal_MUX(Fetch_PCVal_MUX);
      END FOR;
      FOR ALL : Fetch_PC_MUX
         USE ENTITY Modic_Pipeline_lib.Fetch_PC_MUX(Fetch_PC_MUX);
      END FOR;
      FOR ALL : Reg
         USE ENTITY Modic_Pipeline_lib.Reg(Reg);
      END FOR;
   END FOR;
END Fetch_Stage_Fetch_Stage_config;
