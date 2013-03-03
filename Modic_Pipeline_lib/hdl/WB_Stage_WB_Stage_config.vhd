-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION WB_Stage_WB_Stage_config OF WB_Stage IS
   FOR WB_Stage
      FOR ALL : Execute_Stage_ChangeNames
         USE ENTITY Modic_Pipeline_lib.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames);
      END FOR;
   END FOR;
END WB_Stage_WB_Stage_config;
