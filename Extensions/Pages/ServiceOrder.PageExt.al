PageExtension 52193612 pageextension52193612 extends "Service Order" 
{
    actions
    {

        //Unsupported feature: Code Modification on "Post(Action 87).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ServHeader.GET("Document Type","No.");
            ServPostYesNo.PostDocument(ServHeader);
            CurrPage.UPDATE(FALSE);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ServHeader.GET("Document Type","No.");
            ServPostYesNo.PostDocument(ServHeader);
            */
        //end;
    }
}

