-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Top_Level_View_struct_config OF Top_Level_View IS
   FOR struct
      FOR ALL : Processor
         USE CONFIGURATION Modic_Pipeline_lib.Processor_Processor_config;
      END FOR;
      FOR ALL : clock
         USE ENTITY Modic_Pipeline_lib.clock(clock);
      END FOR;
      FOR ALL : easy_RAM_simu
         USE ENTITY Modic_Pipeline_lib.easy_RAM_simu(behavior);
      END FOR;
   END FOR;
END Top_Level_View_struct_config;
