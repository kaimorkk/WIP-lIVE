PageExtension 52193642 pageextension52193642 extends "Invt. Movement Subform" 
{
    actions
    {

        //Unsupported feature: Property Modification (Name) on "SplitWhseActivityLine(Action 1900206104)".

    }

    //Unsupported feature: Code Modification on "SplitLines(PROCEDURE 6)".

    //procedure SplitLines();
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

