report 50201 "Summary of Resource By Admin"
{
    Caption = 'Summary of Resource Requirements By Spending Units';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = './SRC/Report/Rep50201.SummaryofResourceByAdmin.rdlc';
    dataset
    {
        dataitem(DimensionTotalHeader; "Dimension Value")
        {
            DataItemTableView = where("Global Dimension No." = const(2), "Dimension Value Type" = const(Total), "Totaling Filter" = filter(<> ''));
            column(CompanyLogo; CompanyInfo.Picture)
            {
            }
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(DimensionTotalHeaderCode; DimensionTotalHeader.Code)
            {
            }
            column(DimensionTotalHeaderDescription; DimensionValue.GetDimensionDescription(2, DimensionTotalHeader.Code))
            {
            }
            column(PrevYearCode; YearCodes[1])
            {
            }
            column(CurrYearCode; YearCodes[2])
            {
            }
            column(FutureYearCode1; YearCodes[3])
            {
            }
            column(FutureYearCode2; YearCodes[4])
            {
            }
            column(StartDate; YearDates[2] [1])
            {
            }
            column(EndDate; YearDates[2] [2])
            {
            }

            column(NextYearBut1; YearCodes[4])
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
                column(PrintedEstimate; AccountAmounts[Number] [1])
                {
                }
                column(Reallocation; AccountAmounts[Number] [2])
                {
                }
                column(Supplementary; AccountAmounts[Number] [3])
                {
                }
                column(ApprovedEstimate; AccountAmounts[Number] [4])
                {
                }
                column(CumulativeExpenditure; AccountAmounts[Number] [5])
                {
                }
                column(OutstandingCommitments; AccountAmounts[Number] [6])
                {
                }
                column(TotalPaymentCommitments; AccountAmounts[Number] [7])
                {
                }
                trigger OnPreDataItem()
                begin
                    Setrange(Number, 1, AccountCounter);
                end;
            }

            trigger OnPreDataItem()
            begin
                If DimCode <> '' then
                    DimensionTotalHeader.SetFilter(Code, DimCode);
            end;

            trigger OnAfterGetRecord()
            var
                KeyTxt: Text;
                I, HeaderCounter : Integer;
                // BudgetEntry: Query "G/L Budget Entries_Custom";
                DimensionCodes: array[8] of Code[20];
                GLAcc, GLAcc2 : Record "G/L Account";
                DimensionAccDict, GLAccDict : Dictionary of [Text, Integer];
                GLAccount: Record "G/L Account";
                GLHeaderCode: Code[20];
                Amount: Decimal;
                Budget: Record "G/L Budget Name";
                AWP, AWP2 : Record "Annual Strategy Workplan";
            begin

                clear(AccountCounter);
                Clear(AccountDetails);
                Clear(AccountAmounts);

                Budget.Get(BudgetCode);
                AWP.Reset();
                AWP.SetRange("Year Reporting Code", YearBudgetCode[2]);
                AWP.SetRange("Planning Budget Type", AWP."Planning Budget Type"::Original);
                AWP.SetFilter("Global Dimension 2 Code", DimensionTotalHeader."Totaling Filter");
                AWP.SetRange("Approval Status", AWP."Approval Status"::Released);
                AWP.SetRange(Archived, false);
                AWP.SetRange(Consolidated, true);
                if AWP.FindSet() then
                    repeat

                        AccountCounter += 1;
                        AccountDetails[AccountCounter] [1] := AWP."Global Dimension 2 Code";
                        AccountDetails[AccountCounter] [2] := DimensionValue.GetDimensionDescription(2, AWP."Global Dimension 2 Code");
                        AccountAmounts[AccountCounter] [1] := AWP.GetBudgetAmount();
                        // AccountAmounts[AccountCounter] [2] := AWP.GetBudgetAmount() * Budget."Total Budget(Expectation 1)";
                        // AccountAmounts[AccountCounter] [3] := AccountAmounts[AccountCounter] [2] * Budget."Total Budget(Expectation 2)";
                        AWP2.Reset();
                        AWP2.CopyFilters(AWP);
                        AWP2.SetRange("Year Reporting Code", YearBudgetCode[1]);
                        if AWP2.FindSet() then
                            AccountAmounts[AccountCounter] [4] := AWP2.GetBudgetAmount();
                    until AWP.Next() = 0;

                if AccountCounter = 0 then
                    CurrReport.Skip();


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

                    field(DimCode; DimCode)
                    {
                        Caption = 'Header';
                        ApplicationArea = Basic, Suite;
                        TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
                    }
                }

            }
        }
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
        if BudgetCode = '' then
            Error('Please provide the budget code');

        PopulateBudgetDetails(BudgetCode);
    end;

    var
        CompanyInfo: Record "Company Information";
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
        AccountAmounts, AccountAmounts2 : array[10000, 10] of Decimal;
        AccountDetails: array[10000, 4] of Text;
        TotalAmounts: array[4, 10] of Decimal;
        BudgetMgt: Codeunit "Budget Management";
        WorkplanMgt: Codeunit "Workplan Management";

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

    end;
}