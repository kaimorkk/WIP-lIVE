PageExtension 52193641 pageextension52193641 extends "Invt. Pick Subform" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "SplitWhseActivityLine(Action 1900206104)".

    }

    //Unsupported feature: Code Modification on "CallSplitLine(PROCEDURE 7300)".

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

