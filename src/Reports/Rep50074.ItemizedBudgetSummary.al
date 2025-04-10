report 50074 "Itemized Budget Summary"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report/Rep50074.ItemizedBudgetSummary.rdl';

    dataset
    {
        dataitem(DimensionTotalHeader; "Dimension Value")
        {
            DataItemTableView = where("Global Dimension No." = const(2), "Dimension Value Type" = const(Total), "Totaling Filter" = filter(<> ''));
            column(DimensionTotalHeaderCode; DimensionTotalHeader.Code)
            {
            }
            column(DimensionTotalHeaderDescription; DimensionValue.GetDimensionDescription(2, DimensionTotalHeader.Code))
            {
            }
            column(PrevYearCode; YearCodes[1])
            {
            }
            column(CurrYear; YearCodes[2])
            {
            }
            column(NextYear; YearCodes[3])
            {
            }
            column(ClassType; DimensionTotalHeader.GetDimensionDescription(5, ClassFilter).ToUpper())
            {
            }
            column(NextYearBut1; YearCodes[4])
            {
            }
            column(DimensionHeaderValuePrevYearEstimate; TotalAmounts[2] [1])
            {
            }
            column(DimensionHeaderValueCurrYearEstimate; TotalAmounts[2] [2])
            {
            }
            column(DimensionHeaderValueNextYearEstimate; TotalAmounts[2] [3])
            {
            }
            column(DimensionHeaderValueNextYearBut1Estimate; TotalAmounts[2] [4])
            {
            }
            column(CumulativeValuePrevYearEstimate; TotalAmounts[1] [1])
            {
            }
            column(CumulativeValueCurrYearEstimate; TotalAmounts[1] [2])
            {
            }
            column(CumulativeValueNextYearEstimate; TotalAmounts[1] [3])
            {
            }
            column(CumulativeValueNextYearBut1Estimate; TotalAmounts[1] [4])
            {
            }
            dataitem(DimensionValues; "Dimension Value")
            {
                column(DimensionValueCode; DimensionValues.Code)
                {
                }
                column(DimensionValueDescription; DimensionValues.Name)
                {
                }
                column(DimensionValuePrevYearEstimate; TotalAmounts[3] [1])
                {
                }
                column(DimensionValueCurrYearEstimate; TotalAmounts[3] [2])
                {
                }
                column(DimensionValueNextYearEstimate; TotalAmounts[3] [3])
                {
                }
                column(DimensionValueNextYearBut1Estimate; TotalAmounts[3] [4])
                {
                }
                dataitem(AccountAmountDetails; Integer)
                {
                    column(AccountDetailsCounter; Number)
                    {
                    }
                    column(AccountDetailsCode; AccountDetails[Number] [1])
                    {
                    }
                    column(AccountDetailsDescription; AccountDetails[Number] [2])
                    {
                    }
                    column(AccountIsHeader; AccountDetails[Number] [3] = 'Header')
                    {
                    }
                    column(AccountPrevYearEstimate; AccountAmounts[Number] [1])
                    {
                    }
                    column(AccountCurrYearEstimate; AccountAmounts[Number] [2])
                    {
                    }
                    column(AccountNextYearEstimate; AccountAmounts[Number] [3])
                    {
                    }
                    column(AccountNextYearBut1Estimate; AccountAmounts[Number] [4])
                    {
                    }
                    trigger OnPreDataItem()
                    begin
                        Setrange(Number, 1, AccountCounter);
                    end;
                }

                trigger OnPredataItem()
                begin
                    DimensionValues.SetFilter(Code, DimensionTotalHeader."Totaling Filter");
                end;

                trigger OnAfterGetRecord()
                var
                    KeyTxt: Text;
                    I, HeaderCounter : Integer;
                    BudgetEntry: Query "G/L Budget Entries_Custom";
                    DimensionCodes: array[8] of Code[20];
                    GLAcc, GLAcc2 : Record "G/L Account";
                    DimensionAccDict, GLAccDict : Dictionary of [Text, Integer];
                    GLAccount: Record "G/L Account";
                    GLHeaderCode: Code[20];
                    Amount: Decimal;
                begin
                    clear(AccountCounter);
                    Clear(HeaderCounter);
                    Clear(AccountDetails);
                    Clear(AccountAmounts);
                    clear(TotalAmounts[3]);
                    DimensionCodes[2] := DimensionValues.Code;

                    //Get Amounts 
                    Clear(BudgetEntry);
                    BudgetEntry.Setrange(BudgetEntry.Date, YearDates[1] [1], YearDates[2] [2]);
                    BudgetEntry.SetRange(BudgetEntry.Shortcut_Dimension_5_Code, ClassFilter);
                    BudgetEntry.SetFilter(BudgetEntry.Entry_Type, '%1|%2|%3', BudgetEntry.Entry_Type::Allocation, BudgetEntry.Entry_Type::ReAllocation, BudgetEntry.Entry_Type::Supplimentary);
                    BudgetEntry.SetFilter(BudgetEntry.Global_Dimension_2_Code, DimensionValues.Code);
                    BudgetEntry.SetFilter(BudgetEntry.Amount, '<>%1', 0);
                    BudgetEntry.Open();
                    while BudgetEntry.Read() do begin
                        KeyTxt := StrSubstNo('%1_%2', BudgetEntry.Global_Dimension_2_Code, BudgetEntry.G_L_Account_No_);
                        GLHeaderCode := GLAcc2.GetGrouping(BudgetEntry.G_L_Account_No_);
                        HeaderCounter := 0;
                        if not DimensionAccDict.ContainsKey(KeyTxt) then begin
                            if GLHeaderCode <> '' then begin
                                if not GLAccDict.ContainsKey(GLHeaderCode) then begin
                                    AccountCounter += 1;
                                    GLAccDict.Add(GLHeaderCode, AccountCounter);
                                    HeaderCounter := AccountCounter;
                                    if GLAcc2.Get(GLHeaderCode) then;
                                    AccountDetails[HeaderCounter] [1] := GLAcc2."No.";
                                    AccountDetails[HeaderCounter] [2] := GLAcc2.Name;
                                    AccountDetails[HeaderCounter] [3] := 'Header';
                                end else
                                    GLAccDict.Get(GLHeaderCode, HeaderCounter);
                            end;

                            AccountCounter += 1;
                            DimensionAccDict.Add(KeyTxt, AccountCounter);

                            if GLAcc.Get(BudgetEntry.G_L_Account_No_) then;
                            AccountDetails[AccountCounter] [1] := GLAcc."No.";
                            AccountDetails[AccountCounter] [2] := GLAcc.Name;
                            //Get Values
                            //PrevYear
                            AccountAmounts[AccountCounter] [1] := BudgetMgt.GetBudgetAllocated(YearBudgetCode[1], GLAcc."No.", DimensionCodes, YearDates[1] [1], YearDates[1] [2]);
                            Amount := AccountAmounts[AccountCounter] [1];
                            AccountAmounts[AccountCounter] [2] := BudgetMgt.GetBudgetAllocated(YearBudgetCode[2], GLAcc."No.", DimensionCodes, YearDates[2] [1], YearDates[2] [2]);
                            Amount := AccountAmounts[AccountCounter] [2];
                            //AccountAmounts[AccountCounter] [3] := BudgetMgt.GetBudgetAllocated(YearBudgetCode[3], GLAcc."No.", DimensionCodes, YearDates[3] [1], YearDates[3] [2]);
                            //AccountAmounts[AccountCounter] [4] := BudgetMgt.GetBudgetAllocated(YearBudgetCode[4], GLAcc."No.", DimensionCodes, YearDates[4] [1], YearDates[4] [2]);
                            //Remmoved // AccountAmounts[AccountCounter] [3] := AccountAmounts[AccountCounter] [2] * Budget."Total Budget(Expectation 1)";
                            // AccountAmounts[AccountCounter] [4] := AccountAmounts[AccountCounter] [3] * Budget."Total Budget(Expectation 2)";
                            //Add  Totals
                            if HeaderCounter <> 0 then begin
                                AccountAmounts[HeaderCounter] [1] += AccountAmounts[AccountCounter] [1];
                                Amount := AccountAmounts[HeaderCounter] [1];
                                AccountAmounts[HeaderCounter] [2] += AccountAmounts[AccountCounter] [2];
                                Amount := AccountAmounts[HeaderCounter] [2];
                                AccountAmounts[HeaderCounter] [3] += AccountAmounts[AccountCounter] [3];
                                AccountAmounts[HeaderCounter] [4] += AccountAmounts[AccountCounter] [4];
                            end;

                            TotalAmounts[3] [1] += AccountAmounts[AccountCounter] [1];
                            TotalAmounts[3] [2] += AccountAmounts[AccountCounter] [2];
                            TotalAmounts[3] [3] += AccountAmounts[AccountCounter] [3];
                            TotalAmounts[3] [4] += AccountAmounts[AccountCounter] [4];
                        end;
                    end;
                    BudgetEntry.Close();

                    if AccountCounter = 0 then
                        CurrReport.Skip();

                    //Group Dimension Totals
                    TotalAmounts[2] [1] += TotalAmounts[3] [1];
                    TotalAmounts[2] [2] += TotalAmounts[3] [2];
                    TotalAmounts[2] [3] += TotalAmounts[3] [3];
                    TotalAmounts[2] [4] += TotalAmounts[3] [4];

                    //Total Amounts
                    TotalAmounts[1] [1] += TotalAmounts[3] [1];
                    TotalAmounts[1] [2] += TotalAmounts[3] [2];
                    TotalAmounts[1] [3] += TotalAmounts[3] [3];
                    TotalAmounts[1] [4] += TotalAmounts[3] [4];
                end;
            }
            trigger OnPreDataItem()
            begin
                If DimCode <> '' then
                    DimensionTotalHeader.SetFilter(Code, DimCode);
            end;

            trigger OnAfterGetRecord()
            begin
                if DimensionTotalHeader."Totaling Filter" = '' then
                    CurrReport.Skip();

                clear(TotalAmounts[2]);
            end;
        }
    }
    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(BudgetCode; BudgetCode)
                    {
                        ApplicationArea = Basic, Suite;
                        TableRelation = "G/L Budget Name".Name;
                        Caption = 'Budget Code';
                    }
                    field(FromDate; FromDate)
                    {
                        ApplicationArea = Basic, Suite;
                        ShowMandatory = true;
                        Caption = 'Start Date';
                        Visible = false;
                    }
                    field(ToDate; ToDate)
                    {
                        ApplicationArea = Basic, Suite;
                        ShowMandatory = true;
                        Caption = 'End Date';
                        Visible = false;
                    }
                    field(ClassFilter; ClassFilter)
                    {
                        ShowMandatory = true;
                        ApplicationArea = Basic, Suite;
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(5));
                        CaptionClass = '1,2,5';
                    }
                    field(DimCode; DimCode)
                    {
                        Caption = 'Header';
                        ApplicationArea = Basic, Suite;
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2), "Dimension Value Type" = const(Total), "Totaling Filter" = filter(<> ''));
                    }
                }

            }
        }
    }

    trigger OnPreReport()
    begin

        if BudgetCode = '' then
            Error('Please provide the budget code');

        if ClassFilter = '' then
            Error('Please input %1', BudgetItemLines.FieldCaption("Shortcut Dimension 5 Code"));

        PopulateBudgetDetails(BudgetCode);
    end;

    var
        DateFilter, FromDate, ToDate : Date;
        BudgetCode, DimCode : Code[20];
        ClassFilter: Code[20];
        BudgetItemLines: Record "Workplan Budget Line";
        PrevPrdBudgetCode: Code[20];
        YearCodes, YearBudgetCode : array[4] of Code[20];
        YearDates: array[4, 2] of Date;
        Budget: Record "G/L Budget Name";
        DimensionValue: Record "Dimension Value";
        AccountCounter: Integer;
        AccountAmounts: array[10000, 6] of Decimal;
        AccountDetails: array[10000, 4] of Text;
        TotalAmounts: array[4, 6] of Decimal;
        BudgetMgt: Codeunit "Budget Management";
        WorkplanMgt: Codeunit "Workplan Management";
        Y1Growth, Y2Growth : Decimal;

    local procedure PopulateBudgetDetails(BudgetCode: Code[20])
    var
        I: Integer;
        LocalBudget: Record "G/L Budget Name";
    begin
        //Curr Budget Details
        Budget.Get(BudgetCode);
        Budget.TestField("Start Date");
        Budget.TestField("End Date");
        //Curr Year
        YearDates[2] [1] := Budget."Start Date";
        YearDates[2] [2] := Budget."End Date";

        //Prev year
        YearDates[1] [1] := CalcDate('-1Y', YearDates[2] [1]);
        YearDates[1] [2] := CalcDate('-1Y', YearDates[2] [2]);

        //Next Immediate Year
        YearDates[3] [1] := CalcDate('1Y', YearDates[2] [1]);
        YearDates[3] [2] := CalcDate('1Y', YearDates[2] [2]);

        YearDates[4] [1] := CalcDate('2Y', YearDates[2] [1]);
        YearDates[4] [2] := CalcDate('2Y', YearDates[2] [2]);

        //Generate Year Codes
        for I := 1 to 4 do begin
            if Date2DMY(YearDates[i] [1], 3) = Date2DMY(YearDates[i] [2], 3) then
                YearCodes[i] := Format(Date2DMY(YearDates[I] [1], 3))
            else
                YearCodes[i] := StrSubstNo('%1/%2', (Date2DMY(YearDates[I] [1], 3)), Date2DMY(YearDates[I] [2], 3));

            LocalBudget.Reset();
            LocalBudget.SetRange("Start Date", YearDates[I] [1]);
            LocalBudget.SetRange("End Date", YearDates[I] [2]);
            if LocalBudget.FindFirst() then
                YearBudgetCode[i] := LocalBudget.Name;

        end;

        // if Date2DMY(Budget."Start Date", 2) = Date2DMY(Budget."End Date", 2) then
        //     YearCodes[2] := Format(Date2DMY(Budget."Start Date", 3))
        // else
    end;

}