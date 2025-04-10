TableExtension 52193682 tableextension52193682 extends "Item Unit of Measure" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Qty. per Unit of Measure"(Field 3).OnValidate".

        //trigger  per Unit of Measure"(Field 3)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "Qty. per Unit of Measure" <= 0 THEN
              FIELDERROR("Qty. per Unit of Measure",Text000);
            IF xRec."Qty. per Unit of Measure" <> "Qty. per Unit of Measure" THEN
              CheckNoEntriesWithUoM;
            Item.GET("Item No.");
            IF Item."Base Unit of Measure" = Code THEN
              TESTFIELD("Qty. per Unit of Measure",1);
            CalcWeight;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Qty. per Unit of Measure" <= 0 THEN
              FIELDERROR("Qty. per Unit of Measure",Text000);
            #5..8
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TestItemUOM;
        CheckNoEntriesWithUoM;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TestItemSetup;
        TestNoOpenEntriesExist;
        */
    //end;


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TestItemUOM;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TestItemSetup;
        TestNoOpenEntriesExist;
        */
    //end;

    //Unsupported feature: Property Deletion (Local) on "TestNoOpenEntriesExist(PROCEDURE 1)".


    var
        Text002: label 'You cannot delete %1 %2 for item %3 because it is the item''s %4.';
}

