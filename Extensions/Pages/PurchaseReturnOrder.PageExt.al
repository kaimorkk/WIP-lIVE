PageExtension 52193623 pageextension52193623 extends "Purchase Return Order" 
{
    layout
    {

        //Unsupported feature: Property Modification (SubPageLink) on "Control1904651607(Control 1904651607)".

        modify("Posting Date")
        {
            Visible = false;
        }

        //Unsupported feature: Code Modification on ""Currency Code"(Control 91).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
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
            #1..6
              CurrPage.UPDATE;
            END;
            CLEAR(ChangeExchangeRate);
            */
        //end;
    }
    actions
    {


        //Unsupported feature: Code Modification on "Statistics(Action 49).OnAction".

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


        //Unsupported feature: Code Modification on "CopyDocument(Action 54).OnAction".

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
    }
}

