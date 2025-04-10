Report 52193686 "Copy Procurement Plan"
{
    Caption = 'Copy G/L Budget';
    ProcessingOnly = true;

    dataset
    {
    }

    requestpage
    {
        SaveValues = true;

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    group(Copyfrom)
                    {
                        Caption = 'Copy from';
                        field(FromSource;FromSource)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Source';
                            OptionCaption = 'G/L Entry,G/L Budget Entry';

                            trigger OnValidate()
                            begin
                                if FromSource = Fromsource::"G/L Entry" then
                                  FromGLBudgetName := '';
                            end;
                        }
                        field(FromGLBudgetName;FromGLBudgetName)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Budget Name';
                            TableRelation = "G/L Budget Name";

                            trigger OnValidate()
                            begin
                                if (FromGLBudgetName <> '') and (FromSource = Fromsource::"G/L Entry") then
                                  FromSource := Fromsource::"G/L Budget Entry";
                            end;
                        }
                        field(FromGLAccountNo;FromGLAccountNo)
                        {
                            ApplicationArea = Basic;
                            Caption = 'G/L Account No.';
                            TableRelation = "G/L Account";
                        }
                        field(FromDate;FromDate)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Date';

                            trigger OnValidate()
                            var
                                GLAcc: Record "G/L Account";
                                //ApplicationManagement: Codeunit ApplicationManagement;
                            begin
                               // if ApplicationManagement.MakeDateFilter(FromDate) = 0 then;
                                GLAcc.SetFilter("Date Filter",FromDate);
                                FromDate := GLAcc.GetFilter("Date Filter");
                            end;
                        }
                        field(FromClosingEntryFilter;FromClosingEntryFilter)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Closing Entries';
                            OptionCaption = 'Include,Exclude';
                        }
                        field(ColumnDim;ColumnDim)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Dimensions';
                            Editable = false;

                            trigger OnAssistEdit()
                            var
                                DimSelectionBuf: Record "Dimension Selection Buffer";
                            begin
                                DimSelectionBuf.SetDimSelectionChange(3,Report::"Copy G/L Budget",ColumnDim);
                            end;
                        }
                    }
                    group(Copyto)
                    {
                        Caption = 'Copy to';
                        field(ToGLBudgetName;ToGLBudgetName)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Budget Name';
                            TableRelation = "G/L Budget Name";
                        }
                        field(ToGLAccountNo;ToGLAccountNo)
                        {
                            ApplicationArea = Basic;
                            Caption = 'G/L Account No.';
                            TableRelation = "G/L Account";

                            trigger OnValidate()
                            begin
                                ToGLAccountNoOnAfterValidate;
                            end;
                        }
                    }
                    group(Apply)
                    {
                        Caption = 'Apply';
                        field(AmountAdjustFactor;AmountAdjustFactor)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Adjustment Factor';
                            DecimalPlaces = 0:5;
                            MinValue = 0;
                            NotBlank = true;
                        }
                        field(RoundingMethod;RoundingMethod.Code)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Rounding Method';
                            TableRelation = "Rounding Method";
                        }
                        field(DateAdjustExpression;DateAdjustExpression)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Date Change Formula';
                            //OptionCaption = 'None,Day,Week,Month,Quarter,Year,Period';
                        }
                        field(ToDateCompression;ToDateCompression)
                        {
                            ApplicationArea = Basic;
                            Caption = 'Date Compression';
                            OptionCaption = 'None,Day,Week,Month,Quarter,Year,Period';
                        }
                    }
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        if AmountAdjustFactor = 0 then
          AmountAdjustFactor := 1;

        if ToDateCompression = Todatecompression::None then
          ToDateCompression := Todatecompression::Day;
    end;

    trigger OnPostReport()
    var
        FromGLBudgetEntry: Record "G/L Budget Entry";
        FromGLEntry: Record "G/L Entry";
    begin
        WindowUpdateDateTime := CurrentDatetime;
        Window.Open(Text007 + Text008 + Text009);
        /*
        CASE FromSource OF
          FromSource::"G/L Entry":
            WITH FromGLEntry DO BEGIN
              SETCURRENTKEY("G/L Account No.","Posting Date");
              IF FromGLAccountNo <> '' THEN
                SETFILTER("G/L Account No.",FromGLAccountNo);
              SETFILTER("Posting Date",FromDate);
              IF FIND('-') THEN BEGIN
                REPEAT
                  ProcessRecord(
                    "G/L Account No.","Business Unit Code","Posting Date",Description,
                    "Dimension Set ID",Amount);
                UNTIL NEXT = 0;
              END;
            END;
          FromSource::"G/L Budget Entry":
            WITH FromGLBudgetEntry DO BEGIN
              SETCURRENTKEY("Budget Name","G/L Account No.",Description,Date);
              SETRANGE("Budget Name",FromGLBudgetName);
              IF FromGLAccountNo <> '' THEN
                SETFILTER("G/L Account No.",FromGLAccountNo);
              IF FromDate <> '' THEN
                SETFILTER(Date,FromDate);
              IF FIND('-') THEN BEGIN
                REPEAT
                  ProcessRecord(
                    "G/L Account No.","Business Unit Code",Date,Description,
                    "Dimension Set ID",Amount);
                UNTIL NEXT = 0;
              END;
            END;
        END;
        */
        //InsertGLBudgetEntry;
        FromPlan.Reset;
        FromPlan.SetRange(FromPlan."Plan Year",FromGLBudgetName);
        if FromPlan.Find('-') then begin
        repeat
          ToPlan.Init;
          ToPlan."Plan Year":=ToGLBudgetName;
          ToPlan."Plan Item No":=FromPlan."Plan Item No";
          ToPlan."Procurement Type":=FromPlan."Procurement Type";
          ToPlan."Unit of Measure":=FromPlan."Unit of Measure";
          // ToPlan."Unit Price":=FromPlan."Unit Price";
          ToPlan."Procurement Method":=FromPlan."Procurement Method";
          ToPlan."Source of Funds":=FromPlan."Source of Funds";
          ToPlan."Estimated Cost":=FromPlan."Estimated Cost";
          /*
          ToPlan."Advertisement Date"
          ToPlan."Bid/Quotation Opening Date"
          ToPlan."Proposal Evaluation date"
          ToPlan."Financial Opening date"
          ToPlan."Negotiation date"
          ToPlan."Notification of award date"
          ToPlan."Contract Date"
          ToPlan."Contract End Date (Planned)"
          ToPlan."TOR/Technical specs due Date"
          */
          ToPlan."Item Description":=FromPlan."Item Description";
          ToPlan.Quantity:=FromPlan.Quantity;
          ToPlan.Category:=FromPlan.Category;
          ToPlan."Process Type":=FromPlan."Process Type";
          ToPlan."Approved Budget":=FromPlan."Approved Budget";
          ToPlan."Plan Status":=FromPlan."Plan Status";
          ToPlan.Type:=FromPlan.Type;
          ToPlan."No.":=FromPlan."No.";
          ToPlan.Commitment:=FromPlan.Commitment;
          ToPlan.Test:=FromPlan.Test;
          ToPlan.Actual:=FromPlan.Actual;
          ToPlan.Insert;
        until FromPlan.Next=0;
        end;
        Window.Close;
        /*
        IF NOT NoMessage THEN
          MESSAGE(Text010);
        */

    end;

    trigger OnPreReport()
    var
        SelectedDim: Record "Selected Dimension";
        GLSetup: Record "General Ledger Setup";
        GLBudgetName: Record "G/L Budget Name";
        Cont: Boolean;
    begin
        if not NoMessage then
          DimSelectionBuf.CompareDimText(3,Report::"Copy G/L Budget",'',ColumnDim,Text001);

        if (FromSource = Fromsource::"G/L Budget Entry") and (FromGLBudgetName = '') then
          Error(StrSubstNo(Text002));

        if (FromSource = Fromsource::"G/L Entry") and (FromDate = '') then
          Error(StrSubstNo(Text003));

        if ToGLBudgetName = '' then
          Error(StrSubstNo(Text004));

        // Cont := true;
        GLBudgetName.SetRange(Name,ToGLBudgetName);
        if not GLBudgetName.FindFirst then begin
          if not NoMessage then
            if not Confirm(
                 Text005,false,GLBudgetName.TableCaption,ToGLBudgetName)
            then
              Cont := false;
          if Cont then begin
            GLBudgetName.Init;
            GLBudgetName.Name := ToGLBudgetName;
            GLBudgetName.Insert;
            Commit;
          end;
        end else begin
          BudgetDim1Code := GLBudgetName."Budget Dimension 1 Code";
          BudgetDim2Code := GLBudgetName."Budget Dimension 2 Code";
          BudgetDim3Code := GLBudgetName."Budget Dimension 3 Code";
          BudgetDim4Code := GLBudgetName."Budget Dimension 4 Code";
        end;

        if (not NoMessage) and Cont then
          if not Confirm(
               Text006,false)
          then
            Cont := false;

        if Cont then begin
          SelectedDim.GetSelectedDim(UserId,3,Report::"Copy G/L Budget",'',TempSelectedDim);
          if TempSelectedDim.Find('-') then
            repeat
              TempSelectedDim.Level := 0;
              if TempSelectedDim."Dimension Value Filter" <> '' then
                if FilterIncludesBlanks(TempSelectedDim."Dimension Value Filter") then
                  TempSelectedDim.Level := 1;
              TempSelectedDim.Modify;
            until TempSelectedDim.Next = 0;

          ToGLBudgetEntry.LockTable;
          if ToGLBudgetEntry.FindLast then
            GLBudgetEntryNo := ToGLBudgetEntry."Entry No." + 1
          else
            GLBudgetEntryNo := 1;

          GLSetup.Get;
          GlobalDim1Code := GLSetup."Global Dimension 1 Code";
          GlobalDim2Code := GLSetup."Global Dimension 2 Code";
        end else
          CurrReport.Quit;
    end;

    var
        Text001: label 'Dimensions';
        Text002: label 'You must specify a budget name to copy from.';
        Text003: label 'You must specify a date interval to copy from.';
        Text004: label 'You must specify a budget name to copy to.';
        Text005: label 'Do you want to create %1 %2.';
        Text006: label 'Do you want to start the copy ?';
        Text007: label 'Copying budget...\\';
        Text008: label 'G/L Account No. #1####################\';
        Text009: label 'Posting Date    #2######';
        Text010: label 'Budget has been successfully copied.';
        Text011: label 'You can define only one G/L Account.';
        ToGLBudgetEntry: Record "G/L Budget Entry";
        TempGLBudgetEntry: Record "G/L Budget Entry" temporary;
        TempSelectedDim: Record "Selected Dimension" temporary;
        TempDimEntryBuffer: Record "Dimension Entry Buffer" temporary;
        DimSetEntry: Record "Dimension Set Entry";
        TempDimSetEntry: Record "Dimension Set Entry" temporary;
        RoundingMethod: Record "Rounding Method";
        DimSelectionBuf: Record "Dimension Selection Buffer";
        DimMgt: Codeunit DimensionManagement;
        Window: Dialog;
        FromDate: Text[30];
        FromSource: Option "G/L Entry","G/L Budget Entry";
        FromGLBudgetName: Code[10];
        FromGLAccountNo: Code[250];
        FromClosingEntryFilter: Option Include,Exclude;
        ToGLBudgetName: Code[10];
        ToGLAccountNo: Code[20];
        ToBUCode: Code[10];
        ToDateCompression: Option "None",Day,Week,Month,Quarter,Year,Period;
        ColumnDim: Text[250];
        AmountAdjustFactor: Decimal;
        DateAdjustExpression: DateFormula;
        GLBudgetEntryNo: Integer;
        GlobalDim1Code: Code[20];
        GlobalDim2Code: Code[20];
        BudgetDim1Code: Code[20];
        BudgetDim2Code: Code[20];
        BudgetDim3Code: Code[20];
        BudgetDim4Code: Code[20];
        NoMessage: Boolean;
        PrevPostingDate: Date;
        PrevCalculatedPostingDate: Date;
        OldGLAccountNo: Code[20];
        OldPostingDate: Date;
        OldPostingDescription: Text[50];
        OldBUCode: Code[10];
        WindowUpdateDateTime: DateTime;
        FromPlan: Record "Procurement Plan1";
        ToPlan: Record "Procurement Plan1";

    local procedure ProcessRecord(GLAccNo: Code[20];BUCode: Code[10];PostingDate: Date;PostingDescription: Text[50];DimSetID: Integer;Amount: Decimal)
    var
        NewDate: Date;
        NewDimSetID: Integer;
    begin
        if CurrentDatetime - WindowUpdateDateTime >= 750 then begin
          Window.Update(1,GLAccNo);
          Window.Update(2,PostingDate);
          WindowUpdateDateTime := CurrentDatetime;
        end;
        NewDate := CalculatePeriodStart(PostingDate);
        if (FromClosingEntryFilter = Fromclosingentryfilter::Exclude) and (NewDate = ClosingDate(NewDate)) then
          exit;

        if (FromSource = Fromsource::"G/L Entry") and
           (ToDateCompression <> Todatecompression::None)
        then
          PostingDescription := '';

        if OldGLAccountNo = '' then begin
          OldGLAccountNo := GLAccNo;
          OldPostingDate := NewDate;
          OldBUCode := BUCode;
          OldPostingDescription := PostingDescription;
        end;

        if (GLAccNo <> OldGLAccountNo) or
           (NewDate <> OldPostingDate) or
           (BUCode <> OldBUCode) or
           (PostingDescription <> OldPostingDescription) or
           (ToDateCompression = Todatecompression::None)
        then begin
          OldGLAccountNo := GLAccNo;
          OldPostingDate := NewDate;
          OldBUCode := BUCode;
          OldPostingDescription := PostingDescription;
          InsertGLBudgetEntry;
        end;

        NewDimSetID := DimSetID;
        if not IncludeFromEntry(NewDimSetID) then
          exit;

        UpdateTempGLBudgetEntry(GLAccNo,NewDate,Amount,PostingDescription,BUCode,NewDimSetID);
    end;

    local procedure UpdateTempGLBudgetEntry(GLAccNo: Code[20];PostingDate: Date;Amount: Decimal;Description: Text[50];BUCode: Code[10];DimSetID: Integer)
    begin
        TempGLBudgetEntry.SetRange("G/L Account No.",GLAccNo);
        TempGLBudgetEntry.SetRange(Date,PostingDate);
        TempGLBudgetEntry.SetRange(Description,Description);
        TempGLBudgetEntry.SetRange("Business Unit Code",BUCode);
        TempGLBudgetEntry.SetRange("Dimension Set ID",DimSetID);

        if TempGLBudgetEntry.FindFirst then begin
          TempGLBudgetEntry.Amount := TempGLBudgetEntry.Amount + Amount;
          TempGLBudgetEntry.Modify;
          TempGLBudgetEntry.Reset;
        end else begin
          TempGLBudgetEntry.Reset;
          if TempGLBudgetEntry.FindLast then
            TempGLBudgetEntry."Entry No." := TempGLBudgetEntry."Entry No." + 1
          else
            TempGLBudgetEntry."Entry No." := 1;
          TempGLBudgetEntry."Dimension Set ID" := DimSetID;
          TempGLBudgetEntry."G/L Account No." := GLAccNo;
          TempGLBudgetEntry.Date := PostingDate;
          TempGLBudgetEntry.Amount := Amount;
          TempGLBudgetEntry.Description := Description;
          TempGLBudgetEntry."Business Unit Code" := BUCode;
          TempGLBudgetEntry.Insert;
        end;
    end;

    local procedure InsertGLBudgetEntry()
    var
        Sign: Decimal;
    begin
        /*
        IF TempGLBudgetEntry.FIND('-') THEN BEGIN
          REPEAT
            IF TempGLBudgetEntry.Amount <> 0 THEN BEGIN
              ToGLBudgetEntry := TempGLBudgetEntry;
              ToGLBudgetEntry."Entry No." := GLBudgetEntryNo;
              GLBudgetEntryNo := GLBudgetEntryNo + 1;
              ToGLBudgetEntry."Budget Name" := ToGLBudgetName;
              IF ToGLAccountNo <> '' THEN
                ToGLBudgetEntry."G/L Account No." := ToGLAccountNo;
              IF ToBUCode <> '' THEN
                ToGLBudgetEntry."Business Unit Code" := ToBUCode;
              ToGLBudgetEntry."User ID" := USERID;
              ToGLBudgetEntry.Date := TempGLBudgetEntry.Date;
              ToGLBudgetEntry.Amount := ROUND(TempGLBudgetEntry.Amount * AmountAdjustFactor);
              IF RoundingMethod.Code <> '' THEN BEGIN
                IF ToGLBudgetEntry.Amount >= 0 THEN
                  Sign := 1
                ELSE
                  Sign := -1;
                RoundingMethod."Minimum Amount" := ABS(ToGLBudgetEntry.Amount);
                IF RoundingMethod.FIND('=<') THEN BEGIN
                  ToGLBudgetEntry.Amount :=
                    ToGLBudgetEntry.Amount + Sign * RoundingMethod."Amount Added Before";
                  IF RoundingMethod.Precision > 0 THEN
                    ToGLBudgetEntry.Amount :=
                      Sign *
                      ROUND(
                        ABS(
                          ToGLBudgetEntry.Amount),RoundingMethod.Precision,COPYSTR('=><',
                          RoundingMethod.Type + 1,1));
                  ToGLBudgetEntry.Amount :=
                    ToGLBudgetEntry.Amount + Sign * RoundingMethod."Amount Added After";
                END;
              END;
              DimSetEntry.RESET;
              DimSetEntry.SETRANGE("Dimension Set ID",TempGLBudgetEntry."Dimension Set ID");
              IF DimSetEntry.FIND('-') THEN BEGIN
                REPEAT
                  IF DimSetEntry."Dimension Code" = GlobalDim1Code THEN
                    ToGLBudgetEntry."Global Dimension 1 Code" := DimSetEntry."Dimension Value Code";
                  IF DimSetEntry."Dimension Code" = GlobalDim2Code THEN
                    ToGLBudgetEntry."Global Dimension 2 Code" := DimSetEntry."Dimension Value Code";
                  IF DimSetEntry."Dimension Code" = BudgetDim1Code THEN
                    ToGLBudgetEntry."Budget Dimension 1 Code" := DimSetEntry."Dimension Value Code";
                  IF DimSetEntry."Dimension Code" = BudgetDim2Code THEN
                    ToGLBudgetEntry."Budget Dimension 2 Code" := DimSetEntry."Dimension Value Code";
                  IF DimSetEntry."Dimension Code" = BudgetDim3Code THEN
                    ToGLBudgetEntry."Budget Dimension 3 Code" := DimSetEntry."Dimension Value Code";
                  IF DimSetEntry."Dimension Code" = BudgetDim4Code THEN
                    ToGLBudgetEntry."Budget Dimension 4 Code" := DimSetEntry."Dimension Value Code";
                UNTIL DimSetEntry.NEXT = 0;
              END;
              ToGLBudgetEntry.INSERT;
            END;
          UNTIL TempGLBudgetEntry.NEXT = 0;
        END;
        TempGLBudgetEntry.RESET;
        TempGLBudgetEntry.DELETEALL;
         */

    end;


    procedure Initialize(FromSource2: Option;FromGLBudgetName2: Code[10];FromGLAccountNo2: Code[250];FromDate2: Text[30];ToGlBudgetName2: Code[10];ToGLAccountNo2: Code[20];ToBUCode2: Code[10];AmountAdjustFactor2: Decimal;RoundingMethod2: Code[10];DateAdjustExpression2: DateFormula;NoMessage2: Boolean)
    begin
        FromSource := FromSource2;
        FromGLBudgetName := FromGLBudgetName2;
        FromGLAccountNo := FromGLAccountNo2;
        FromDate := FromDate2;
        ToGLBudgetName := ToGlBudgetName2;
        ToGLAccountNo := ToGLAccountNo2;
        ToBUCode := ToBUCode2;
        AmountAdjustFactor := AmountAdjustFactor2;
        RoundingMethod.Code := RoundingMethod2;
        DateAdjustExpression := DateAdjustExpression2;
        NoMessage := NoMessage2;
    end;

    local procedure CalculatePeriodStart(PostingDate: Date): Date
    var
        AccountingPeriod: Record "Accounting Period";
    begin
        if Format(DateAdjustExpression) <> '' then
          if PostingDate = ClosingDate(PostingDate) then
            PostingDate := ClosingDate(CalcDate(DateAdjustExpression,NormalDate(PostingDate)))
          else
            PostingDate := CalcDate(DateAdjustExpression,PostingDate);
        if PostingDate = ClosingDate(PostingDate) then
          exit(PostingDate);

        case ToDateCompression of
          Todatecompression::Week:
            PostingDate := CalcDate('<CW+1D-1W>',PostingDate);
          Todatecompression::Month:
            PostingDate := CalcDate('<CM+1D-1M>',PostingDate);
          Todatecompression::Quarter:
            PostingDate := CalcDate('<CQ+1D-1Q>',PostingDate);
          Todatecompression::Year:
            PostingDate := CalcDate('<CY+1D-1Y>',PostingDate);
          Todatecompression::Period:
            begin
              if PostingDate <> PrevPostingDate then begin
                PrevPostingDate := PostingDate;
                AccountingPeriod.SetRange("Starting Date",0D,PostingDate);
                if AccountingPeriod.FindLast then begin
                  PrevCalculatedPostingDate := AccountingPeriod."Starting Date"
                end else
                  PrevCalculatedPostingDate := PostingDate;
              end;
              PostingDate := PrevCalculatedPostingDate;
            end;
        end;
        exit(PostingDate);
    end;

    local procedure FilterIncludesBlanks(TheFilter: Code[250]): Boolean
    var
        TempDimBuf2: Record "Dimension Buffer" temporary;
    begin
        with TempDimBuf2 do begin
          DeleteAll; // Necessary because of C/SIDE error
          Init;
          Insert;
          SetFilter("Dimension Code",TheFilter);
          exit(FindFirst);
        end;
    end;

    local procedure IncludeFromEntry(var DimSetID: Integer): Boolean
    var
        IncludeEntry: Boolean;
    begin
        if TempDimEntryBuffer.Get(DimSetID) then begin
          DimSetID := TempDimEntryBuffer."Dimension Entry No.";
          exit(true);
        end;
        TempDimEntryBuffer."No." := DimSetID;

        IncludeEntry := true;
        DimSetEntry.SetRange("Dimension Set ID",DimSetID);
        TempDimSetEntry.Reset;
        TempDimSetEntry.DeleteAll;
        if TempSelectedDim.Find('-') then
          repeat
            DimSetEntry.Init;
            DimSetEntry.SetRange("Dimension Code",TempSelectedDim."Dimension Code");
            if TempSelectedDim."Dimension Value Filter" <> '' then
              DimSetEntry.SetFilter("Dimension Value Code",TempSelectedDim."Dimension Value Filter");
            if DimSetEntry.FindFirst then begin
              TempDimSetEntry := DimSetEntry;
              TempDimSetEntry."Dimension Set ID" := 0;
              if TempSelectedDim."New Dimension Value Code" <> '' then
                TempDimSetEntry.Validate("Dimension Value Code",TempSelectedDim."New Dimension Value Code");
              TempDimSetEntry.Insert(true);
            end else begin
              if TempSelectedDim."Dimension Value Filter" <> '' then
                if TempSelectedDim.Level = 1 then begin
                  DimSetEntry.SetRange("Dimension Value Code");
                  IncludeEntry := not DimSetEntry.FindFirst;
                end else
                  IncludeEntry := false;
              if IncludeEntry and (TempSelectedDim."New Dimension Value Code" <> '') then begin
                TempDimSetEntry."Dimension Set ID" := 0;
                TempDimSetEntry."Dimension Code" := CopyStr(TempSelectedDim."Dimension Code",1,20);
                TempDimSetEntry.Validate("Dimension Value Code",TempSelectedDim."New Dimension Value Code");
                TempDimSetEntry.Insert(true);
              end;
            end;
            DimSetEntry.SetRange("Dimension Code");
            DimSetEntry.SetRange("Dimension Value Code");
          until (TempSelectedDim.Next = 0) or not IncludeEntry;
        if IncludeEntry then begin
          DimSetID := DimMgt.GetDimensionSetID(TempDimSetEntry);
          TempDimEntryBuffer."Dimension Entry No." := DimSetID;
          TempDimEntryBuffer.Insert;
          exit(true);
        end;
        exit(false);
    end;


    procedure InitializeRequest(FromSource2: Option;FromGLBudgetName2: Code[10];FromGLAccountNo2: Code[250];FromDate2: Text[30];FromClosingEntryFilter2: Option;DimensionText: Text[250];ToGlBudgetName2: Code[10];ToGLAccountNo2: Code[20];AmountAdjustFactor2: Decimal;RoundingMethod2: Code[10];DateAdjustExpression2: DateFormula;ToDateCompression2: Option)
    begin
        FromSource := FromSource2;
        FromGLBudgetName := FromGLBudgetName2;
        FromGLAccountNo := FromGLAccountNo2;
        FromDate := FromDate2;
        FromClosingEntryFilter := FromClosingEntryFilter2;
        ColumnDim := DimensionText;
        ToGLBudgetName := ToGlBudgetName2;
        ToGLAccountNo := ToGLAccountNo2;
        AmountAdjustFactor := AmountAdjustFactor2;
        RoundingMethod.Code := RoundingMethod2;
        DateAdjustExpression := DateAdjustExpression2;
        ToDateCompression := ToDateCompression2;
    end;

    local procedure ToGLAccountNoOnAfterValidate()
    var
        GLAccount: Record "G/L Account";
    begin
        if ToGLAccountNo <> '' then begin
          GLAccount.Get(ToGLAccountNo);
          Message(Text011)
        end;
    end;
}

