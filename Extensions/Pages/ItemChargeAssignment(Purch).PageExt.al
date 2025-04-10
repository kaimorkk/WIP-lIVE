PageExtension 52193599 pageextension52193599 extends "Item Charge Assignment (Purch)" 
{
    actions
    {

        //Unsupported feature: Code Modification on "GetTransferReceiptLines(Action 42).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemChargeAssgntPurch.SETRANGE("Document Type","Document Type");
            ItemChargeAssgntPurch.SETRANGE("Document No.","Document No.");
            ItemChargeAssgntPurch.SETRANGE("Document Line No.","Document Line No.");

            TransferRcptLine.FILTERGROUP(2);
            TransferRcptLine.SETFILTER("Item No.",'<>%1','');
            TransferRcptLine.SETFILTER(Quantity,'<>0');
            TransferRcptLine.FILTERGROUP(0);

            PostedTransferReceiptLines.SETTABLEVIEW(TransferRcptLine);
            IF ItemChargeAssgntPurch.FINDLAST THEN
              PostedTransferReceiptLines.Initialize(ItemChargeAssgntPurch,PurchLine2."Unit Cost")
            ELSE
              PostedTransferReceiptLines.Initialize(Rec,PurchLine2."Unit Cost");

            PostedTransferReceiptLines.LOOKUPMODE(TRUE);
            PostedTransferReceiptLines.RUNMODAL;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            #10..17
            */
        //end;
    }


    //Unsupported feature: Code Modification on "QtytoAssignOnAfterValidate(PROCEDURE 19000177)".

    //procedure QtytoAssignOnAfterValidate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CurrPage.UPDATE(FALSE);
        UpdateQtyAssgnt;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CurrPage.UPDATE(TRUE);
        UpdateQtyAssgnt;
        */
    //end;
}

