PageExtension 52193603 pageextension52193603 extends "Get Post.Doc - S.ShptLn Sbfrm" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "ShowDocument(Action 1902759804)".


        //Unsupported feature: Property Modification (Name) on "ItemTrackingLines(Action 1901652604)".


        //Unsupported feature: Code Modification on "ItemTrackingLines(Action 1901652604).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ItemTrackingLines;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            PostedShipmentItemTrackingLns;
            */
        //end;
    }

    procedure PostedShipmentItemTrackingLns()
    begin
        GetSelectedLine(Rec);
        ShowItemTrackingLines;
    end;
}

