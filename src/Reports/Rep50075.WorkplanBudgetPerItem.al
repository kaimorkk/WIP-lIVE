report 50075 "Workplan Budget Per Item"
{
    ApplicationArea = All;
    Caption = 'Budget Per Item';
    UsageCategory = ReportsAndAnalysis;
    DataAccessIntent = ReadOnly;
    DefaultLayout = RDLC;
    RDLCLayout = './SRC/Report/Rep50075.WorkplanBudgetPerItem.rdl';

    dataset
    {
        dataitem(AnnualStrategyWorkplan; "Annual Strategy Workplan")
        {
            column(CompanyName; CompInfo.Name)
            {
            }
            column(CompanyLogo; CompInfo.Picture)
            {
            }
            column(CompanyAddress; CompInfo.Address)
            {
            }
            column(CompanyEmail; CompInfo."E-Mail")
            {
            }
            column(CompanyPhoneNo; CompInfo."Phone No.")
            {
            }
            column(No; AnnualStrategyWorkplan."No")
            {
            }
            column(Description; Description)
            {
            }
            column(GeographicalLocation; DimensionValue.GetDimensionDescription(1, "Global Dimension 1 Code"))
            {
            }
            column(SpendingUnit; DimensionValue.GetDimensionDescription(2, "Global Dimension 2 Code"))
            {
            }
            column(Year_Reporting_Code; "Year Reporting Code")
            {
            }
            column(PreparedByName; PreparedBy.GetFullName(PreparedBy."User ID"))
            {
            }
            column(PreparedByDesignation; PreparedBy."User ID")
            {
            }
            column(PreparedDateTime; ApprovalDates[1])
            {
            }
            column(PreparedBySignature; PreparedBy."User Signature")
            {
            }
            column(ApprovedByName; ApprovedBy.GetFullName(ApprovedBy."User ID"))
            {
            }
            column(ApprovedByDesignation; ApprovedBy."User ID")
            {
            }
            column(ApprovedDateTime; ApprovalDates[2])
            {
            }
            column(ApprovedBySignature; ApprovedBy."User Signature")
            {
            }
            dataItem(BudgetItems; Integer)
            {
                column(Number; Number)
                {
                }
                column(GLAccountCode; BudgetDetails[Number] [1])
                {
                }
                column(GLAccountDescription; BudgetDetails[Number] [2])
                {
                }
                column(Quarter1Amounts; BudgetAmounts[Number] [1])
                {
                }
                column(Quarter2Amounts; BudgetAmounts[Number] [2])
                {
                }
                column(Quarter3Amounts; BudgetAmounts[Number] [3])
                {
                }
                column(Quarter4Amounts; BudgetAmounts[Number] [4])
                {
                }
                column(TotalBudgetAmounts; BudgetAmounts[Number] [5])
                {
                }
                column(Comments; '')
                {
                }
                trigger OnPreDataItem()
                begin
                    SetRange(Number, 1, J);
                end;
            }
            trigger OnAfterGetRecord()
            var
                GlDict: Dictionary of [Code[20], Integer];
                WorkplanBudgetLines: Record "Workplan Budget Line";
                x: Integer;
            begin
                clear(J);
                clear(BudgetDetails);
                clear(BudgetAmounts);
                clear(ApprovalDates);
                clear(PreparedBy);
                clear(ApprovedBy);

                //ApprovalsMgt.GetDocApprovers(AnnualStrategyWorkplan.RecordId, PreparedBy, ApprovedBy, ApprovalDates);
                ApprovalsMgt.GetDocApprovers(AnnualStrategyWorkplan.RecordId, PreparedBy, CheckedBy, ApprovedBy, ApprovalDates);

                WorkplanBudgetLines.Reset;
                WorkplanBudgetLines.SetRange("Strategy Plan ID", AnnualStrategyWorkplan.No);
                WorkplanBudgetLines.Setfilter("Budget Item", '<>%1', '');
                if WorkplanBudgetLines.FindSet() then begin
                    repeat
                        if GlDict.ContainsKey(WorkplanBudgetLines."Budget Item") then
                            GlDict.get(WorkplanBudgetLines."Budget Item", x)
                        else begin
                            J += 1;
                            X := J;
                            GlDict.Add(WorkplanBudgetLines."Budget Item", J);
                            BudgetDetails[j] [1] := WorkplanBudgetLines."Budget Item";
                            BudgetDetails[j] [2] := WorkplanBudgetLines."Budget Item Description";
                        end;

                        BudgetAmounts[x] [1] += WorkplanBudgetLines."Q1 Amount";
                        BudgetAmounts[x] [2] += WorkplanBudgetLines."Q2 Amount";
                        BudgetAmounts[x] [3] += WorkplanBudgetLines."Q3 Amount";
                        BudgetAmounts[x] [4] += WorkplanBudgetLines."Q4 Amount";
                        BudgetAmounts[x] [5] += WorkplanBudgetLines."Total Amount";
                    until WorkplanBudgetLines.Next = 0;
                end;


            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
    end;

    var
        CompInfo: Record "Company Information";
        J: Integer;
        BudgetDetails: array[1000, 3] of Text;
        BudgetAmounts: array[1000, 5] of Decimal;
        DimensionValue: Record "Dimension Value";
        ApprovalDates: array[3] of DateTime;
        PreparedBy, ApprovedBy, CheckedBy : Record "User Setup";
        ApprovalsMgt: Codeunit "Custom Approvals Codeunit";

}
