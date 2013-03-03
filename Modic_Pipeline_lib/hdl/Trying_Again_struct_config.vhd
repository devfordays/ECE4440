-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Trying_Again_struct_config OF Trying_Again IS
   FOR struct
      FOR ALL : Processor
         USE CONFIGURATION Modic_Pipeline_lib.Processor_Processor_config;
      END FOR;
      FOR ALL : clock
         USE ENTITY Modic_Pipeline_lib.clock(clock);
      END FOR;
   END FOR;
END Trying_Again_struct_config;
