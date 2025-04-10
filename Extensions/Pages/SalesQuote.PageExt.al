PageExtension 52193443 pageextension52193443 extends "Sales Quote" 
{
    layout
    {

        //Unsupported feature: Code Modification on ""Currency Code"(Control 97).OnAssistEdit".

        //trigger OnAssistEdit()
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CLEAR(ChangeExchangeRate);
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
            #1..4
              CurrPage.UPDATE;
            END;
            CLEAR(ChangeExchangeRate);
            */
        //end;
    }
    actions
    {


        //Unsupported feature: Code Modification on "CopyDocument(Action 66).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CopySalesDoc.SetSalesHeader(Rec);
            CopySalesDoc.RUNMODAL;
            CLEAR(CopySalesDoc);
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

