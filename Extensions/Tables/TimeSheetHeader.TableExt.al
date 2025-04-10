TableExtension 52193608 tableextension52193608 extends "Time Sheet Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Resource No."(Field 5).OnValidate".

        //trigger "(Field 5)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ResourcesSetup.GET;
            IF "Resource No." <> '' THEN BEGIN
              Resource.GET("Resource No.");
              CheckResourcePrivacyBlocked(Resource);
              Resource.TESTFIELD(Blocked,FALSE);
              Resource.TESTFIELD("Time Sheet Owner User ID");
              Resource.TESTFIELD("Time Sheet Approver User ID");
              "Owner User ID" := Resource."Time Sheet Owner User ID";
              "Approver User ID" := Resource."Time Sheet Approver User ID";
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
            #6..10
            */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""Owner User ID"(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Approver User ID"(Field 8)".

    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Resource No." <> '' THEN BEGIN
          Resource.GET("Resource No.");
          CheckResourcePrivacyBlocked(Resource);
          Resource.TESTFIELD(Blocked,FALSE);
        END;

        TimeSheetLine.SETRANGE("Time Sheet No.","No.");
        TimeSheetLine.DELETEALL(TRUE);

        TimeSheetCommentLine.SETRANGE("No.","No.");
        TimeSheetCommentLine.SETRANGE("Time Sheet Line No.",0);
        TimeSheetCommentLine.DELETEALL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #7..12
        */
    //end;
}

