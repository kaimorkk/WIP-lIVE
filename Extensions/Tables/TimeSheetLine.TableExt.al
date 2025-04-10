TableExtension 52193609 tableextension52193609 extends "Time Sheet Line" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""Approver ID"(Field 12)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Approved By"(Field 21)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TestStatus;

        GetTimeSheetResource(Resource);
        CheckResourcePrivacyBlocked(Resource);
        Resource.TESTFIELD(Blocked,FALSE);

        TimeSheetDetail.SETRANGE("Time Sheet No.","Time Sheet No.");
        TimeSheetDetail.SETRANGE("Time Sheet Line No.","Line No.");
        TimeSheetDetail.DELETEALL;

        TimeSheetCommentLine.SETRANGE("No.","Time Sheet No.");
        TimeSheetCommentLine.SETRANGE("Time Sheet Line No.","Line No.");
        TimeSheetCommentLine.DELETEALL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TestStatus;
        #7..13
        */
    //end;


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetTimeSheetResource(Resource);
        CheckResourcePrivacyBlocked(Resource);
        Resource.TESTFIELD(Blocked,FALSE);

        UpdateApproverID;
        "Time Sheet Starting Date" := TimeSheetHeader."Starting Date";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        UpdateApproverID;
        "Time Sheet Starting Date" := TimeSheetHeader."Starting Date";
        */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetTimeSheetResource(Resource);
        CheckResourcePrivacyBlocked(Resource);
        Resource.TESTFIELD(Blocked,FALSE);

        UpdateDetails;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        UpdateDetails;
        */
    //end;
}

