TableExtension 52193603 tableextension52193603 extends "Assembly Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Unit of Measure Code"(Field 80).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckIsNotAsmToOrder;
            TESTFIELD("Assembled Quantity",0);
            TestStatusOpen;
            SetCurrentFieldNum(FIELDNO("Unit of Measure Code"));

            GetItem;
            "Qty. per Unit of Measure" := UOMMgt.GetQtyPerUnitOfMeasure(Item,"Unit of Measure Code");
            "Unit Cost" := GetUnitCost;
            "Overhead Rate" := Item."Overhead Rate";

            AssemblyLineMgt.UpdateAssemblyLines(Rec,xRec,FIELDNO("Unit of Measure Code"),ReplaceLinesFromBOM,CurrFieldNo,CurrentFieldNum);
            ClearCurrentFieldNum(FIELDNO("Unit of Measure Code"));

            VALIDATE(Quantity);
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..8
            "Overhead Rate" := RoundUnitAmount(Item."Overhead Rate" * "Qty. per Unit of Measure");
            #10..14
            */
        //end;

        //Unsupported feature: Property Deletion (DataClassification) on ""Assigned User ID"(Field 9000)".

    }


    //Unsupported feature: Code Modification on "TestNoSeries(PROCEDURE 6)".

    //procedure TestNoSeries();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        AssemblySetup.GET;
        CASE "Document Type" OF
          "Document Type"::Quote:
            AssemblySetup.TESTFIELD("Assembly Quote Nos.");
          "Document Type"::Order:
            BEGIN
              AssemblySetup.TESTFIELD("Posted Assembly Order Nos.");
              AssemblySetup.TESTFIELD("Assembly Order Nos.");
            END;
          "Document Type"::"Blanket Order":
            AssemblySetup.TESTFIELD("Blanket Assembly Order Nos.");
        END;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..5
            AssemblySetup.TESTFIELD("Assembly Order Nos.");
        #10..12
        */
    //end;


    //Unsupported feature: Code Modification on "GetPostingNoSeriesCode(PROCEDURE 8)".

    //procedure GetPostingNoSeriesCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        EXIT(AssemblySetup."Posted Assembly Order Nos.");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        EXIT(AssemblySetup."Assembly Order Nos.");
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateDates(PROCEDURE 34)".

    //procedure ValidateDates();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CASE FieldNumToCalculateFrom OF
          FIELDNO("Due Date"):
            BEGIN
        #4..18
                "Due Date" := NewDueDate;
                "Starting Date" := NewStartDate;
              END ELSE BEGIN
                ValidateStartDate(NewStartDate,FALSE);
                IF NOT IsAsmToOrder THEN BEGIN
                  IF "Due Date" <> NewDueDate THEN
                    IF GUIALLOWED AND
        #26..31
                    THEN
                      ValidateDueDate(NewDueDate,FALSE);
                END;
              END;
            END;
          FIELDNO("Starting Date"):
        #38..73
          ERROR(Text015,FIELDCAPTION("Due Date"),"Due Date",FIELDCAPTION("Ending Date"),"Ending Date");
        IF "Ending Date" < "Starting Date" THEN
          ERROR(Text015,FIELDCAPTION("Ending Date"),"Ending Date",FIELDCAPTION("Starting Date"),"Starting Date");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..21
        #23..34
                ValidateStartDate(NewStartDate,FALSE);
        #35..76
        */
    //end;


    //Unsupported feature: Code Modification on "ValidateDueDate(PROCEDURE 35)".

    //procedure ValidateDueDate();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Due Date" := NewDueDate;
        CheckIsNotAsmToOrder;
        TestStatusOpen;

        IF CallValidateOnOtherDates THEN
          ValidateDates(FIELDNO("Due Date"),FALSE);
        IF (xRec."Due Date" <> "Due Date") AND (Quantity <> 0) THEN
          ReservationCheckDateConfl.AssemblyHeaderCheck(Rec,(CurrFieldNo <> 0) OR TestReservationDateConflict);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..4
        IF (xRec."Due Date" <> "Due Date") AND (Quantity <> 0) THEN
          ReservationCheckDateConfl.AssemblyHeaderCheck(Rec,(CurrFieldNo <> 0) OR TestReservationDateConflict);
        IF CallValidateOnOtherDates THEN
          ValidateDates(FIELDNO("Due Date"),FALSE);
        */
    //end;

    procedure GetCurrencyCode(): Code[10]
    begin
        if not GLSetupRead then begin
          GLSetup.Get;
          GLSetupRead := true;
        end;
        exit(GLSetup."Additional Reporting Currency");
    end;

    var
    GLSetupRead: Boolean;
    GLSetup: Record "General Ledger Setup";
}

