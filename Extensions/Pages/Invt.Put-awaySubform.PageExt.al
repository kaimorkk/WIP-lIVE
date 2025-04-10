PageExtension 52193640 pageextension52193640 extends "Invt. Put-away Subform" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "SplitWhseActivityLine(Action 1901991804)".

    }

    //Unsupported feature: Code Modification on "CallSplitLine(PROCEDURE 8)".

    //procedure CallSplitLine();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        SplitLine(WhseActivLine);
        COPY(WhseActivLine);
        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WhseActivLine.COPY(Rec);
        SplitLine(WhseActivLine);
        CurrPage.UPDATE(FALSE);
        */
    //end;
}

