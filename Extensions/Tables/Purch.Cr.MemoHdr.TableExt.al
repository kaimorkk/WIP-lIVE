TableExtension 52193473 tableextension52193473 extends "Purch. Cr. Memo Hdr." 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 112)".

    }

    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        PostPurchLinesDelete.IsDocumentDeletionAllowed("Posting Date");
        LOCKTABLE;
        PostPurchLinesDelete.DeletePurchCrMemoLines(Rec);

        PurchCommentLine.SETRANGE("Document Type",PurchCommentLine."Document Type"::"Posted Credit Memo");
        PurchCommentLine.SETRANGE("No.","No.");
        PurchCommentLine.DELETEALL;

        ApprovalsMgt.DeletePostedApprovalEntry(DATABASE::"Purch. Cr. Memo Hdr.","No.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #2..9
        */
    //end;
}

