TableExtension 52193799 tableextension52193799 extends "Internal Movement Line" 
{

    //Unsupported feature: Property Insertion (PasteIsValid) on ""Internal Movement Line"(Table 7347)".

    fields
    {

        //Unsupported feature: Code Modification on ""From Bin Code"(Field 12).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF xRec."From Bin Code" <> "From Bin Code" THEN
              IF "From Bin Code" <> '' THEN BEGIN
                GetLocation("Location Code");
                Location.TESTFIELD("Bin Mandatory");
                IF "From Bin Code" = Location."Adjustment Bin Code" THEN
                  FIELDERROR(
                    "From Bin Code",
                    STRSUBSTNO(
                      Text000Err,Location.FIELDCAPTION("Adjustment Bin Code"),
                      Location.TABLECAPTION));
                VALIDATE(Quantity,0);
              END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..8
                      Text000,Location.FIELDCAPTION("Adjustment Bin Code"),
            #10..12
            */
        //end;


        //Unsupported feature: Code Modification on "Quantity(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            "Qty. (Base)" := CalcBaseQty(Quantity);

            IF CurrFieldNo = FIELDNO(Quantity) THEN
              CheckBinContentQty;

            IF NOT xRec.ISEMPTY THEN
              IF NOT CheckQtyItemTrackingLines THEN
                ERROR(Text003Err,"Item No.",TABLECAPTION);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..4
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnRename".

    //trigger OnRename()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        ERROR(Text002Err,TABLECAPTION);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        ERROR(Text002,TABLECAPTION);
        */
    //end;


    //Unsupported feature: Code Modification on "CheckBinContentQty(PROCEDURE 9)".

    //procedure CheckBinContentQty();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        GetLocation("Location Code");

        IF Location."Bin Mandatory" AND
        #4..23
            FIELDERROR(
              "Qty. (Base)",
              STRSUBSTNO(
                Text001Err,AvailQtyBase - InternalMovementLine."Qty. (Base)"));
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..26
                Text001,AvailQtyBase - InternalMovementLine."Qty. (Base)"));
        END;
        */
    //end;


    //Unsupported feature: Code Modification on "OpenItemTrackingLines(PROCEDURE 6500)".

    //procedure OpenItemTrackingLines();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD("Item No.");
        TESTFIELD("Qty. (Base)");
        WhseWorksheetLine.INIT;
        SetFilterWhseWorksheetLine(WhseWorksheetLine);
        WhseItemTrackingLinesForm.SetSource(WhseWorksheetLine,DATABASE::"Internal Movement Line");
        WhseItemTrackingLinesForm.RUNMODAL;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..3
        WhseWorksheetLine."Whse. Document Type" :=
          WhseWorksheetLine."Whse. Document Type"::"Internal Movement";
        WhseWorksheetLine."Whse. Document No." := "No.";
        WhseWorksheetLine."Whse. Document Line No." := "Line No.";
        WhseWorksheetLine."Location Code" := "Location Code";
        WhseWorksheetLine."Item No." := "Item No.";
        WhseWorksheetLine."Qty. (Base)" := "Qty. (Base)";
        WhseWorksheetLine."Qty. to Handle (Base)" := "Qty. (Base)";
        WhseWorksheetLine."Qty. per Unit of Measure" := "Qty. per Unit of Measure";
        WhseItemTrackingLinesForm.SetSource(WhseWorksheetLine,DATABASE::"Internal Movement Line");
        WhseItemTrackingLinesForm.RUNMODAL;
        */
    //end;

    var
        Text000: label 'must not be the %1 of the %2';
        Text001: label 'must not be greater than %1 units';
        Text002: label 'You cannot rename a %1.';
}

