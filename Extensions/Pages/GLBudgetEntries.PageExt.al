PageExtension 52193468 pageextension52193468 extends "G/L Budget Entries" 
{

    //Unsupported feature: Code Modification on "OnDeleteRecord".

    //trigger OnDeleteRecord(): Boolean
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF "Entry No." < LowestModifiedEntryNo THEN
          LowestModifiedEntryNo := "Entry No.";
        EXIT(IsEditable);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF "Entry No." < LowestModifiedEntryNo THEN
          LowestModifiedEntryNo := "Entry No.";
        EXIT(TRUE);
        */
    //end;


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF GETFILTER("Budget Name") = '' THEN
          GLBudgetName.INIT
        ELSE BEGIN
          COPYFILTER("Budget Name",GLBudgetName.Name);
          GLBudgetName.FINDFIRST;
        END;
        CurrPage.EDITABLE := NOT GLBudgetName.Blocked AND IsEditable;
        GLSetup.GET;
        "Global Dimension 1 CodeEnable" := GLSetup."Global Dimension 1 Code" <> '';
        "Global Dimension 2 CodeEnable" := GLSetup."Global Dimension 2 Code" <> '';
        #11..17
        "Budget Dimension 2 CodeVisible" := GLBudgetName."Budget Dimension 2 Code" <> '';
        "Budget Dimension 3 CodeVisible" := GLBudgetName."Budget Dimension 3 Code" <> '';
        "Budget Dimension 4 CodeVisible" := GLBudgetName."Budget Dimension 4 Code" <> '';
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6
        CurrPage.EDITABLE := NOT GLBudgetName.Blocked;
        #8..20
        */
    //end;

    //Unsupported feature: Property Modification (Length) on "GetFirstBusUnit(PROCEDURE 5).ReturnValue".

}

