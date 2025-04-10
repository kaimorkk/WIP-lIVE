PageExtension 52193597 pageextension52193597 extends "Registered Put-away" 
{
    var
        ChangeLocation: Boolean;

    var
        CurrentLocationCode: Code[10];


    //Unsupported feature: Code Insertion on "OnAfterGetRecord".

    //trigger OnAfterGetRecord()
    //begin
        /*
        CurrentLocationCode := "Location Code";
        */
    //end;


    //Unsupported feature: Code Insertion (VariableCollection) on "OnOpenPage".

    //trigger (Variable: ChangeLocation)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        SetWhseLocationFilter;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ChangeLocation := "Location Code" <> CurrentLocationCode;
        CurrentLocationCode := "Location Code";
        OpenRegisteredActivityHeader(1,ChangeLocation,CurrentLocationCode,Rec);
        */
    //end;
}

