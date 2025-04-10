TableExtension 52193589 tableextension52193589 extends "VAT Report Header" 
{
    fields
    {
        modify("VAT Report Config. Code")
        {
            OptionCaption = ' ,Option1';

            //Unsupported feature: Property Modification (OptionString) on ""VAT Report Config. Code"(Field 2)".

        }
        modify("VAT Report Type")
        {
            OptionCaption = 'Standard,Corrective,Supplementary ';
        }
        modify(Status)
        {
            OptionCaption = 'Open,Released,Submitted';

            //Unsupported feature: Property Modification (OptionString) on "Status(Field 6)".

        }

        //Unsupported feature: Property Deletion (TableRelation) on ""VAT Report Config. Code"(Field 2)".


        //Unsupported feature: Code Modification on ""Start Date"(Field 4).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckEditingAllowed;
            TESTFIELD("Start Date");
            HandleDateInput;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CheckEditingAllowed;
            TESTFIELD("Start Date");
            */
        //end;


        //Unsupported feature: Code Modification on ""End Date"(Field 5).OnValidate".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckEditingAllowed;
            TESTFIELD("End Date");
            CheckEndDate;
            HandleDateInput;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..3
            */
        //end;


        //Unsupported feature: Code Modification on ""Original Report No."(Field 9).OnLookup".

        //trigger "(Field 9)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            TypeFilterText := '';
            ShowLookup := FALSE;

            #4..7

            IF ShowLookup THEN BEGIN
              LookupVATReportHeader.SETFILTER("No.",'<>' + "No.");
              LookupVATReportHeader.SETRANGE(Status,Status::Accepted);
              LookupVATReportHeader.SETFILTER("VAT Report Type",TypeFilterText);
              VATReportList.SETTABLEVIEW(LookupVATReportHeader);
              VATReportList.LOOKUPMODE(TRUE);
              IF VATReportList.RUNMODAL = ACTION::LookupOK THEN BEGIN
                VATReportList.GETRECORD(LookupVATReportHeader);
                VALIDATE("Original Report No.",LookupVATReportHeader."No.");
              END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..10
              LookupVATReportHeader.SETRANGE(Status,Status::Submitted);
            #12..19
            */
        //end;


        //Unsupported feature: Code Modification on ""Original Report No."(Field 9).OnValidate".

        //trigger "(Field 9)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CheckEditingAllowed;

            CASE "VAT Report Type" OF
            #4..10
                  TESTFIELD("Original Report No.");
                  IF "Original Report No." = "No." THEN
                    ERROR(Text005);
                  VATReportHeader.GET("VAT Report Config. Code","Original Report No.");
                  "Start Date" := VATReportHeader."Start Date";
                  "End Date" := VATReportHeader."End Date";
                END;
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            #1..13
                  VATReportHeader.GET("Original Report No.");
            #15..18
            */
        //end;

        //Unsupported feature: Deletion (FieldCollection) on ""Period Type"(Field 10)".


        //Unsupported feature: Deletion (FieldCollection) on ""Period No."(Field 11)".


        //Unsupported feature: Deletion (FieldCollection) on ""Period Year"(Field 12)".


        //Unsupported feature: Deletion (FieldCollection) on ""Message Id"(Field 13)".


        //Unsupported feature: Deletion (FieldCollection) on ""Statement Template Name"(Field 14)".


        //Unsupported feature: Deletion (FieldCollection) on ""Statement Name"(Field 15)".


        //Unsupported feature: Deletion (FieldCollection) on ""VAT Report Version"(Field 16)".


        //Unsupported feature: Deletion (FieldCollection) on ""Submitted By"(Field 17)".


        //Unsupported feature: Deletion (FieldCollection) on ""Submitted Date"(Field 18)".


        //Unsupported feature: Deletion (FieldCollection) on ""Return Period No."(Field 19)".


        //Unsupported feature: Deletion (FieldCollection) on ""Amounts in Add. Rep. Currency"(Field 100)".

    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""VAT Report Config. Code","No."(Key)".
        // 
        // key(Key1;"No.")
        // {
        // Clustered = true;
        // }
    }


    //Unsupported feature: Code Insertion (VariableCollection) on "OnDelete".

    //trigger (Variable: VATReportLine)()
    //Parameters and return type have not been exported.
    //begin
        /*
        */
    //end;


    //Unsupported feature: Code Modification on "OnDelete".

    //trigger OnDelete()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        TESTFIELD(Status,Status::Open);
        VATStatementReportLine.SETRANGE("VAT Report No.","No.");
        VATStatementReportLine.SETRANGE("VAT Report Config. Code","VAT Report Config. Code");
        VATStatementReportLine.DELETEALL;
        VATReportLineRelation.SETRANGE("VAT Report No.","No.");
        VATReportLineRelation.DELETEALL;
        RemoveVATReturnPeriodLink;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        TESTFIELD(Status,Status::Open);
        VATReportLine.SETRANGE("VAT Report No.","No.");
        VATReportLine.DELETEALL;
        VATReportLineRelation.SETRANGE("VAT Report No.","No.");
        VATReportLineRelation.DELETEALL;
        */
    //end;


    //Unsupported feature: Code Modification on "GetNoSeriesCode(PROCEDURE 1)".

    //procedure GetNoSeriesCode();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        VATReportSetup.GET;
        IF "VAT Report Config. Code" = "VAT Report Config. Code"::"VAT Return" THEN BEGIN
          VATReportSetup.TESTFIELD("VAT Return No. Series");
          EXIT(VATReportSetup."VAT Return No. Series");
        END;

        VATReportSetup.TESTFIELD("No. Series");
        EXIT(VATReportSetup."No. Series");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        VATReportSetup.GET;
        VATReportSetup.TESTFIELD("No. Series");
        EXIT(VATReportSetup."No. Series");
        */
    //end;


    //Unsupported feature: Code Modification on "InitRecord(PROCEDURE 3)".

    //procedure InitRecord();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF ("VAT Report Config. Code" = "VAT Report Config. Code"::"EC Sales List") OR
           ("VAT Report Config. Code" = "VAT Report Config. Code"::"VAT Return")
        THEN BEGIN
          date := CALCDATE('<-1M>',WORKDATE);
          VALIDATE("Period Year",DATE2DMY(date,3));
          VALIDATE("Period Type","Period Type"::Month);
          VALIDATE("Period No.",DATE2DMY(date,2));
        END ELSE BEGIN
          "Start Date" := WORKDATE;
          "End Date" := WORKDATE;
        END;

        VATReportsConfiguration.SETRANGE("VAT Report Type","VAT Report Config. Code");
        IF VATReportsConfiguration.FINDFIRST AND (VATReportsConfiguration.COUNT = 1) THEN
          "VAT Report Version" := VATReportsConfiguration."VAT Report Version";
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        "VAT Report Config. Code" := "VAT Report Config. Code"::Option1;
        "Start Date" := WORKDATE;
        "End Date" := WORKDATE;
        */
    //end;


    //Unsupported feature: Code Modification on "CheckEditingAllowed(PROCEDURE 4)".

    //procedure CheckEditingAllowed();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF Status <> Status::Open THEN
          ERROR(Text002,FORMAT(Status));
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        IF Status IN [Status::Released,Status::Submitted] THEN
          ERROR(Text002,FORMAT(Status));
        */
    //end;


    //Unsupported feature: Code Modification on "CheckIfCanBeReopened(PROCEDURE 8)".

    //procedure CheckIfCanBeReopened();
    //Parameters and return type have not been exported.
    //>>>> ORIGINAL CODE:
    //begin
        /*
        IF VATReportHeader.Status <> VATReportHeader.Status::Released THEN
          IF VATReportSetup.GET THEN
            IF NOT VATReportSetup."Modify Submitted Reports" THEN
              ERROR(Text007,VATReportSetup.TABLECAPTION);
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        CASE VATReportHeader.Status OF
          VATReportHeader.Status::Submitted:
            BEGIN
              VATReportSetup.GET;
              IF NOT VATReportSetup."Modify Submitted Reports" THEN
                ERROR(Text007,VATReportSetup.TABLECAPTION);
            END
        END;
        */
    //end;

    //Unsupported feature: Deletion (VariableCollection) on "InitRecord(PROCEDURE 3).VATReportsConfiguration(Variable 1011)".


    //Unsupported feature: Deletion (VariableCollection) on "InitRecord(PROCEDURE 3).date(Variable 1000)".


    var
        VATReportLine: Record "VAT Report Line";
}

