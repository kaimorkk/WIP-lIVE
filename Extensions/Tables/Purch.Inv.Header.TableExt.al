TableExtension 52193471 tableextension52193471 extends "Purch. Inv. Header" 
{
    fields
    {

        //Unsupported feature: Property Insertion (Numeric) on ""Creditor No."(Field 170)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 112)".


        //Unsupported feature: Property Deletion (DataClassification) on ""Canceled By"(Field 1300)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        PostPurchLinesDelete.IsDocumentDeletionAllowed("Posting Date");
        LOCKTABLE;
        PostPurchLinesDelete.DeletePurchInvLines(Rec);

        PurchCommentLine.SETRANGE("Document Type",PurchCommentLine."Document Type"::"Posted Invoice");
        PurchCommentLine.SETRANGE("No.","No.");
        PurchCommentLine.DELETEALL;

        ApprovalsMgt.DeletePostedApprovalEntry(DATABASE::"Purch. Inv. Header","No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..9
        */
    //end;
}

