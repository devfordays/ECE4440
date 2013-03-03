-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Register_File_Register_File_config OF Register_File IS
   FOR Register_File
      FOR ALL : Reg
         USE ENTITY Modic_Pipeline_lib.Reg(Reg);
      END FOR;
      FOR ALL : Register_File_TriState
         USE ENTITY Modic_Pipeline_lib.Register_File_TriState(Register_File_TriState);
      END FOR;
      FOR ALL : Register_File_four_sixteen_MUX
         USE ENTITY Modic_Pipeline_lib.Register_File_four_sixteen_MUX(Register_File_four_sixteen_MUX);
      END FOR;
   END FOR;
END Register_File_Register_File_config;
