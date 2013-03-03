-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Register_Tracker_Register_Tracker_config OF Register_Tracker IS
   FOR Register_Tracker
      FOR ALL : Reg
         USE ENTITY Modic_Pipeline_lib.Reg(Reg);
      END FOR;
      FOR ALL : Register_Tracker_Control_Logic
         USE ENTITY Modic_Pipeline_lib.Register_Tracker_Control_Logic(Register_Tracker_Control_Logic);
      END FOR;
      FOR ALL : Register_Tracker_Control_MUX
         USE ENTITY Modic_Pipeline_lib.Register_Tracker_Control_MUX(Register_Tracker_Control_MUX);
      END FOR;
      FOR ALL : Register_Tracker_Control_OR
         USE ENTITY Modic_Pipeline_lib.Register_Tracker_Control_OR(Register_Tracker_Control_OR);
      END FOR;
   END FOR;
END Register_Tracker_Register_Tracker_config;
