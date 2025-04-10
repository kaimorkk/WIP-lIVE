TableExtension 52193744 tableextension52193744 extends "Service Contract Header" 
{
    fields
    {

        //Unsupported feature: Code Modification on ""Salesperson Code"(Field 15).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            ValidateSalesPersonOnServiceContractHeader(Rec,FALSE,FALSE);

            CheckChangeStatus;
            MODIFY;

            CreateDim(
              DATABASE::"Salesperson/Purchaser","Salesperson Code",
              DATABASE::Customer,"Bill-to Customer No.",
              DATABASE::"Responsibility Center","Responsibility Center",
              DATABASE::"Service Contract Template","Template No.",
              DATABASE::"Service Order Type","Service Order Type");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               (NOT SuspendChangeStatus)
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #4..11
            */
        //end;


        //Unsupported feature: Code Modification on ""Bill-to Customer No."(Field 16).OnValidate".

        //trigger "(Field 16)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            IF xRec."Bill-to Customer No." <> "Bill-to Customer No." THEN
              IF xRec."Bill-to Customer No." <> '' THEN BEGIN
                IF HideValidationDialog THEN
            #5..11
              IF "Bill-to Customer No." <> xRec."Bill-to Customer No." THEN
                IF "Bill-to Customer No." <> '' THEN BEGIN
                  Cust.GET("Bill-to Customer No.");
                  IF Cust."Privacy Blocked" THEN
                    Cust.CustPrivacyBlockedErrorMessage(Cust,FALSE);
                  IF Cust.Blocked = Cust.Blocked::All THEN
                    Cust.CustBlockedErrorMessage(Cust,FALSE);
                END;

              IF "Customer No." <> '' THEN BEGIN
            #22..34
                  "Bill-to Contact" := Cust.Contact;
              END;

              IF NOT HideValidationDialog THEN
                CustCheckCrLimit.ServiceContractHeaderCheck(Rec);

              CALCFIELDS(
                "Bill-to Name","Bill-to Name 2","Bill-to Address","Bill-to Address 2",
                "Bill-to Post Code","Bill-to City","Bill-to County","Bill-to Country/Region Code");
            #44..52
              DATABASE::"Responsibility Center","Responsibility Center",
              DATABASE::"Service Contract Template","Template No.",
              DATABASE::"Service Order Type","Service Order Type");
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               (NOT SuspendChangeStatus)
            THEN
              TESTFIELD("Change Status","Change Status"::Open);

            #2..14
                  IF Cust.Blocked = Cust.Blocked::All THEN
                    Cust.CustBlockedErrorMessage(Cust,FALSE)
            #19..37
            #41..55
            */
        //end;


        //Unsupported feature: Code Modification on ""Starting Date"(Field 35).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;

            IF "Last Invoice Date" <> 0D THEN
              ERROR(
            #5..46
                  VALIDATE("Last Invoice Date");
              VALIDATE("Service Period");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               NOT SuspendChangeStatus
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..49
            */
        //end;


        //Unsupported feature: Code Modification on ""Expiration Date"(Field 36).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;

            IF "Expiration Date" <> xRec."Expiration Date" THEN BEGIN
              IF "Expiration Date" <> 0D THEN BEGIN
            #5..8
                    ERROR(
                      Text023,FIELDCAPTION("Expiration Date"),FIELDCAPTION("Last Invoice Date"));
              END;

              ServContractLine.RESET;
              ServContractLine.SETRANGE("Contract Type","Contract Type");
            #15..40
                  MODIFY(TRUE);
                END;
              END;
              VALIDATE("Invoice Period");
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               NOT SuspendChangeStatus
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..11
              VALIDATE("Invoice Period");
            #12..43
            END;
            */
        //end;


        //Unsupported feature: Code Modification on ""Response Time (Hours)"(Field 55).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;

            IF "Response Time (Hours)" <> xRec."Response Time (Hours)" THEN BEGIN
              ServContractLine.RESET;
            #5..12
                THEN
                  ServContractLine.MODIFYALL("Response Time (Hours)","Response Time (Hours)",TRUE);
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF (Status <> Status::Canceled) AND
               NOT SuspendChangeStatus
            THEN
              TESTFIELD("Change Status","Change Status"::Open);
            #2..15
            */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 1 Code"(Field 67).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            MODIFY;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            MODIFY;
            */
        //end;


        //Unsupported feature: Code Modification on ""Shortcut Dimension 2 Code"(Field 68).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckChangeStatus;
            ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            MODIFY;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
            MODIFY;
            */
        //end;
    }


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        CheckChangeStatus;
        IF ("Contract Type" = "Contract Type"::Contract) AND ("Contract No." <> '') THEN BEGIN
          ServMgtSetup.GET;
          IF ServMgtSetup."Register Contract Changes" THEN
        #5..14
        THEN
          ContractGainLossEntry.AddEntry(4,"Contract Type",
            "Contract No.","Annual Amount" - xRec."Annual Amount",'');
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF (Status <> Status::Canceled) AND
           NOT SuspendChangeStatus
        THEN
          TESTFIELD("Change Status","Change Status"::Open);
        #2..17
        */
    //end;

    //Unsupported feature: Variable Insertion (Variable: NoOfMonths) (VariableCollection) on "ValidateNextInvoicePeriod(PROCEDURE 9)".


    //Unsupported feature: Variable Insertion (Variable: NoOfDays) (VariableCollection) on "ValidateNextInvoicePeriod(PROCEDURE 9)".



    //Unsupported feature: Code Modification on "ValidateNextInvoicePeriod(PROCEDURE 9)".

    //procedure ValidateNextInvoicePeriod();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF NextInvoicePeriod = '' THEN BEGIN
          "Amount per Period" := 0;
          EXIT;
        #4..13
        END ELSE BEGIN
          TempDate := CalculateEndPeriodDate(FALSE,"Next Invoice Date");
          DaysInFullInvPeriod := "Next Invoice Date" - TempDate + 1;
          IF (DaysInFullInvPeriod = DaysInThisInvPeriod) AND ("Next Invoice Date" = "Expiration Date") THEN
            DaysInFullInvPeriod := CalculateEndPeriodDate(TRUE,TempDate) - TempDate + 1;
        END;

        IF DaysInFullInvPeriod = DaysInThisInvPeriod THEN
          "Amount per Period" :=
            ROUND("Annual Amount" / ReturnNoOfPer("Invoice Period"),Currency."Amount Rounding Precision")
        ELSE
          "Amount per Period" := ROUND(
              ServContractMgt.CalcContractAmount(Rec,InvFrom,InvTo),Currency."Amount Rounding Precision");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..16
        #19..24
          IF Prepaid THEN BEGIN
            IF (DATE2DMY(InvFrom,2) = DATE2DMY(InvTo,2)) AND
               (DATE2DMY(InvFrom,3) = DATE2DMY(InvTo,3))
            THEN BEGIN
              "Amount per Period" := ServContractMgt.CalcContractAmount(Rec,InvFrom,InvTo);
            END ELSE BEGIN
              "Amount per Period" := 0;
              ServContractMgt.NoOfMonthsAndDaysInPeriod(InvFrom,InvTo,NoOfMonths,NoOfDays);
              "Amount per Period" :=
                ("Annual Amount" / 12 * NoOfMonths) +
                ("Annual Amount" / ServContractMgt.NoOfDayInYear(InvFrom) * NoOfDays);
            END;
          END ELSE
            "Amount per Period" :=
              ROUND(
                ("Annual Amount" / ServContractMgt.NoOfDayInYear(InvTo)) * DaysInThisInvPeriod,
                Currency."Amount Rounding Precision");
        */
    //end;
}

