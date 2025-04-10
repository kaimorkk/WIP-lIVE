TableExtension 52193777 tableextension52193777 extends "Warehouse Journal Line" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""From Bin Code"(Field 7).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT PhysInvtEntered THEN
              TESTFIELD("Phys. Inventory",FALSE);

            #4..8
              GetBinType("Location Code","From Bin Code");

            Bin.CALCFIELDS("Adjustment Bin");
            IF Bin."Adjustment Bin" AND ("Entry Type" <> "Entry Type"::"Positive Adjmt.") THEN
              Bin.FIELDERROR("Adjustment Bin");

            IF "From Bin Code" <> '' THEN
              "From Zone Code" := Bin."Zone Code";
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..11
            Bin.TESTFIELD("Adjustment Bin",FALSE);
            #14..16
            */
        //end;


        //Unsupported feature: Code Modification on ""To Bin Code"(Field 28).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT PhysInvtEntered THEN
              TESTFIELD("Phys. Inventory",FALSE);

            #4..7
            GetBin("Location Code","To Bin Code");

            Bin.CALCFIELDS("Adjustment Bin");
            IF Bin."Adjustment Bin" AND ("Entry Type" <> "Entry Type"::"Negative Adjmt.") THEN
              Bin.FIELDERROR("Adjustment Bin");

            IF "To Bin Code" <> '' THEN
              "To Zone Code" := Bin."Zone Code";
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
            Bin.TESTFIELD("Adjustment Bin",FALSE);
            #13..15
            */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 67)".



        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 5407).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF NOT PhysInvtEntered THEN
              TESTFIELD("Phys. Inventory",FALSE);

            IF "Item No." <> '' THEN BEGIN
              TESTFIELD("Unit of Measure Code");
              GetItemUnitOfMeasure;
              "Qty. per Unit of Measure" := ItemUnitOfMeasure."Qty. per Unit of Measure";
              CheckBin("Location Code","From Bin Code",FALSE);
              CheckBin("Location Code","To Bin Code",TRUE);
            END ELSE
              "Qty. per Unit of Measure" := 1;
            VALIDATE(Quantity);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            #6..12
            */
        //end;
    }


    //Unsupported feature: Code Modification on "SetUpAdjustmentBin(PROCEDURE 100)".

    //procedure SetUpAdjustmentBin();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        WhseJnlTemplate.GET("Journal Template Name");
        IF WhseJnlTemplate.Type = WhseJnlTemplate.Type::Reclassification THEN
          EXIT;

        Location.GET("Location Code");
        #6..16
              "To Bin Code" := Bin.Code;
            END;
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        WhseJnlTemplate.GET("Journal Template Name");
        IF WhseJnlTemplate.Type <> WhseJnlTemplate.Type::Item THEN
        #3..19
        */
    //end;
}

