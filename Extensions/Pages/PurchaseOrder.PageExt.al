PageExtension 52193450 pageextension52193450 extends "Purchase Order"
{
    layout
    {

        //Unsupported feature: Property Modification (SubPageLink) on "Control1904651607(Control 1904651607)".

        modify("Posting Date")
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on ""Currency Code"(Control 119).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CLEAR(ChangeExchangeRate);
        IF "Posting Date" <> 0D THEN
          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor","Posting Date")
        ELSE
          ChangeExchangeRate.SetParameter("Currency Code","Currency Factor",WORKDATE);
        IF ChangeExchangeRate.RUNMODAL = ACTION::OK THEN BEGIN
          VALIDATE("Currency Factor",ChangeExchangeRate.GetParameter);
          SaveInvoiceDiscountAmount;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..7
          CurrPage.UPDATE;
        END;
        CLEAR(ChangeExchangeRate);
        */
        //end;
        addafter(Status)
        {
            field("Delivery Note Number"; "Delivery Note Number")
            {
                ApplicationArea = Basic;
            }
            field("Requisition No"; "Requisition No")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "PrepmtInvoices(Action 205)".


        //Unsupported feature: Property Modification (Name) on "PrepmtCrMemos(Action 206)".


        //Unsupported feature: Property Modification (Name) on "MoveNegativeLines(Action 142)".



        //Unsupported feature: Code Modification on "Statistics(Action 63).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        OpenPurchaseOrderStatistics;
        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        CalcInvDiscForHeader;
        COMMIT;
        PAGE.RUNMODAL(PAGE::"Purchase Order Statistics",Rec);
        PurchCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
        */
        //end;


        //Unsupported feature: Code Modification on "CopyDocument(Action 70).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
        /*
        CopyPurchDoc.SetPurchHeader(Rec);
        CopyPurchDoc.RUNMODAL;
        CLEAR(CopyPurchDoc);
        IF GET("Document Type","No.") THEN;
        */
        //end;
        //>>>> MODIFIED CODE:
        //begin
        /*
        #1..3
        */
        //end;
        addafter("&Print")
        {
            action(lpo)
            {
                ApplicationArea = Basic;
                //RunObject = Report UnknownReport51511095;
            }
            action(lso)
            {
                ApplicationArea = Basic;
                //RunObject = Report UnknownReport51511095;
            }
        }
    }
}

