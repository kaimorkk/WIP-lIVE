PageExtension 52193621 pageextension52193621 extends "Sales Return Order" 
{
    layout
    {
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


        //Unsupported feature: Code Modification on "Statistics(Action 51).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            OpenSalesOrderStatistics;
            SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CalcInvDiscForHeader;
            COMMIT;
            PAGE.RUNMODAL(PAGE::"Sales Order Statistics",Rec);
            SalesCalcDiscByType.ResetRecalculateInvoiceDisc(Rec);
            */
        //end;


        //Unsupported feature: Code Modification on "CopyDocument(Action 56).OnAction".

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

