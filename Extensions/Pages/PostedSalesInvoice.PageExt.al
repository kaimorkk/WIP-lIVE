PageExtension 52193469 pageextension52193469 extends "Posted Sales Invoice" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""&Email"(Action 9).OnAction".

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

