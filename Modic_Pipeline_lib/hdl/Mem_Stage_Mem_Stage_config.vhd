-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Mem_Stage_Mem_Stage_config OF Mem_Stage IS
   FOR Mem_Stage
      FOR ALL : Mem_Multi1
         USE ENTITY Modic_Pipeline_lib.Mem_Multi1(Mem_Multi1);
      END FOR;
      FOR ALL : Mem_Multi16
         USE ENTITY Modic_Pipeline_lib.Mem_Multi16(Mem_Multi16);
      END FOR;
      FOR ALL : Mem_Multi18
         USE ENTITY Modic_Pipeline_lib.Mem_Multi18(Mem_Multi18);
      END FOR;
      FOR ALL : Mem_Multiplexor
         USE ENTITY Modic_Pipeline_lib.Mem_Multiplexor(Mem_Multiplexor);
      END FOR;
      FOR ALL : Mem_new_MUX
         USE ENTITY Modic_Pipeline_lib.Mem_new_MUX(Mem_new_MUX);
      END FOR;
   END FOR;
END Mem_Stage_Mem_Stage_config;
