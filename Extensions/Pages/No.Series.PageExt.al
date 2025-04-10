PageExtension 52193501 pageextension52193501 extends "No. Series" 
{
    Caption = 'No. Series';

    //Unsupported feature: Property Modification (PromotedActionCategoriesML) on ""No. Series"(Page 456)".

    layout
    {
        modify(StartDate)
        {
            Caption = 'Starting Date';
        }
        modify(StartNo)
        {
            Caption = 'Starting No.';
        }
        modify(EndNo)
        {
            Caption = 'Ending No.';
        }
        modify(LastDateUsed)
        {
            Caption = 'Last Date Used';
        }
        modify(LastNoUsed)
        {
            Caption = 'Last No. Used';
        }
        modify(WarningNo)
        {
            Caption = 'Warning No.';
        }
        modify(IncrementByNo)
        {
            Caption = 'Increment-by No.';
        }
    }
    actions
    {
        modify("&Series")
        {
            Caption = '&Series';
        }
        modify(Lines)
        {
            Caption = 'Lines';
        }
        modify(Relationships)
        {
            Caption = 'Relationships';
        }
    }

    //Unsupported feature: Code Modification on "DrillDownActionOnPage(PROCEDURE 4)".

    //procedure DrillDownActionOnPage();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        DrillDown;
        CurrPage.UPDATE(FALSE);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        DrillDown;
        CurrPage.UPDATE;
        */
    //end;
}

