PageExtension 52193595 pageextension52193595 extends "Filters to Get Source Docs." 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "Run(Action 6)".


        //Unsupported feature: Property Modification (Name) on "Modify(Action 8)".


        //Unsupported feature: Code Modification on "Run(Action 6).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CASE RequestType OF
              RequestType::Receive:
                BEGIN
            #4..11
                END;
            END;

            GetSourceBatch.SetSkipBlockedItem(TRUE);
            GetSourceBatch.USEREQUESTPAGE(ShowRequestForm);
            GetSourceBatch.RUNMODAL;
            IF GetSourceBatch.NotCancelled THEN
              CurrPage.CLOSE;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..14
            #16..19
            */
        //end;
    }
}

