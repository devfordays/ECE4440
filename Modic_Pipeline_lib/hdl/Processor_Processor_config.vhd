-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Processor_Processor_config OF Processor IS
   FOR Processor
      FOR ALL : Decode_Stage
         USE CONFIGURATION Modic_Pipeline_lib.Decode_Stage_Decode_Stage_config;
      END FOR;
      FOR ALL : Execute_Stage
         USE CONFIGURATION Modic_Pipeline_lib.Execute_Stage_Execute_Stage_config;
      END FOR;
      FOR ALL : Fetch_Stage
         USE CONFIGURATION Modic_Pipeline_lib.Fetch_Stage_Fetch_Stage_config;
      END FOR;
      FOR ALL : Mem_Stage
         USE CONFIGURATION Modic_Pipeline_lib.Mem_Stage_Mem_Stage_config;
      END FOR;
      FOR ALL : Register_File
         USE CONFIGURATION Modic_Pipeline_lib.Register_File_Register_File_config;
      END FOR;
      FOR ALL : Register_Tracker
         USE CONFIGURATION Modic_Pipeline_lib.Register_Tracker_Register_Tracker_config;
      END FOR;
      FOR ALL : WB_Stage
         USE CONFIGURATION Modic_Pipeline_lib.WB_Stage_WB_Stage_config;
      END FOR;
   END FOR;
END Processor_Processor_config;
