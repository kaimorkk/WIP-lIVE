TableExtension 52193766 tableextension52193766 extends "Analysis Type" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Item Ledger Entry Type Filter"(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Item Ledger Entry Type Filter" <> '' THEN
              IF NOT ("Value Type" IN
                      ["Value Type"::Quantity,
            #4..7
                ERROR(Text000,FIELDCAPTION("Item Ledger Entry Type Filter"),"Value Type");
            AnalysisRepMgmt.ValidateFilter(
              "Item Ledger Entry Type Filter",DATABASE::"Analysis Type",
              FIELDNO("Item Ledger Entry Type Filter"),CurrFieldNo <> FIELDNO("Item Ledger Entry Type Filter"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
              FIELDNO("Item Ledger Entry Type Filter"),TRUE);
            */
        //end;


        //Unsupported feature: Code Modification on ""Value Entry Type Filter"(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Value Entry Type Filter" <> '' THEN
              IF NOT ("Value Type" IN
                      ["Value Type"::"Cost Amount",
            #4..6
                ERROR(Text000,FIELDCAPTION("Value Entry Type Filter"),"Value Type");
            AnalysisRepMgmt.ValidateFilter(
              "Value Entry Type Filter",DATABASE::"Analysis Type",
              FIELDNO("Value Entry Type Filter"),CurrFieldNo <> FIELDNO("Value Entry Type Filter"));
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..9
              FIELDNO("Value Entry Type Filter"),TRUE);
            */
        //end;
    }
}

