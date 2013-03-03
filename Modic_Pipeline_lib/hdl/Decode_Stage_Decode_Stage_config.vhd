-- Generation properties:
--   Format              : hierarchical
--   Generic mappings    : exclude
--   Leaf-level entities : direct binding
--   Regular libraries   : use library name
--   View name           : include
--   
LIBRARY Modic_Pipeline_lib;
CONFIGURATION Decode_Stage_Decode_Stage_config OF Decode_Stage IS
   FOR Decode_Stage
      FOR ALL : Decode_Controller
         USE ENTITY Modic_Pipeline_lib.Decode_Controller(Decode_Controller);
      END FOR;
      FOR ALL : Decode_Dest_MUX
         USE ENTITY Modic_Pipeline_lib.Decode_Dest_MUX(Decode_Dest_MUX);
      END FOR;
      FOR ALL : Decode_Extra_MUX
         USE ENTITY Modic_Pipeline_lib.Decode_Extra_MUX(Decode_Extra_MUX);
      END FOR;
      FOR ALL : Decode_Left_MUX
         USE ENTITY Modic_Pipeline_lib.Decode_Left_MUX(Decode_Left_MUX);
      END FOR;
      FOR ALL : Decode_MultSig
         USE ENTITY Modic_Pipeline_lib.Decode_MultSig(Decode_MultSig);
      END FOR;
      FOR ALL : Decode_Right_MUX
         USE ENTITY Modic_Pipeline_lib.Decode_Right_MUX(Decode_Right_MUX);
      END FOR;
   END FOR;
END Decode_Stage_Decode_Stage_config;
