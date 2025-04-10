PageExtension 52193452 pageextension52193452 extends "Purchase Credit Memo" 
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
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "TestReport(Action 58)".



        //Unsupported feature: Code Modification on ""Copy Document"(Action 54).OnAction".

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

