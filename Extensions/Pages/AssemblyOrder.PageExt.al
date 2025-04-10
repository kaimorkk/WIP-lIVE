PageExtension 52193535 pageextension52193535 extends "Assembly Order" 
{
    actions
    {

        //Unsupported feature: Code Modification on ""Copy Document"(Action 67).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CopyAssemblyDocument.SetAssemblyHeader(Rec);
            CopyAssemblyDocument.RUNMODAL;
            IF GET("Document Type","No.") THEN;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CopyAssemblyDocument.SetAssemblyHeader(Rec);
            CopyAssemblyDocument.RUNMODAL;
            */
        //end;
    }
}

