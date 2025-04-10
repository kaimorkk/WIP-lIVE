PageExtension 52193471 pageextension52193471 extends "Posted Sales Invoices" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""&Email"(Action 3).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            SalesInvHeader := Rec;
            CurrPage.SETSELECTIONFILTER(SalesInvHeader);
            SalesInvHeader.EmailRecords;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            SalesInvHeader := Rec;
            CurrPage.SETSELECTIONFILTER(SalesInvHeader);
            SalesInvHeader.EmailRecords(FALSE);
            */
        //end;
    }
}

