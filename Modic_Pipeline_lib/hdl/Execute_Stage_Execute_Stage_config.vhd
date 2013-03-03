-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Execute_Stage_Execute_Stage_config OF Execute_Stage IS
   FOR Execute_Stage
      FOR ALL : Execute_ALU
         USE ENTITY Modic_Pipeline_lib.Execute_ALU(Execute_ALU);
      END FOR;
      FOR ALL : Execute_JumpUnit
         USE ENTITY Modic_Pipeline_lib.Execute_JumpUnit(Execute_JumpUnit);
      END FOR;
      FOR ALL : Execute_Stage_ChangeNames
         USE ENTITY Modic_Pipeline_lib.Execute_Stage_ChangeNames(Execute_Stage_ChangeNames);
      END FOR;
      FOR ALL : Reg
         USE ENTITY Modic_Pipeline_lib.Reg(Reg);
      END FOR;
   END FOR;
END Execute_Stage_Execute_Stage_config;
