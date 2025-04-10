xmlport 50000 "Export Workplan Ceilings"
{
    Caption = 'Export Ceilings';
    Format = VariableText;
    Direction = Export;
    UseRequestPage = false;
    TableSeparator = '<CR/LF>';

    schema
    {
        textelement(Root)
        {
            tableelement(Integer; Integer)
            {
                SourceTableView = where(Number = const(1));
                textelement(ResourceReqTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        ResourceReqTxt := 'Resource Req No (Do not Change)'
                    end;
                }
                textelement(SpendingUnitNameTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        SpendingUnitNameTxt := 'Name of Spending Unit/Court Station (Do not Change)'
                    end;
                }

                textelement(GeograpLocationTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        GeograpLocationTxt := StrSubstNo('%1 (Do not Change)', Workplan.FieldCaption("Global Dimension 1 Code"));
                    end;
                }
                textelement(SubHeadTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        SubHeadTxt := StrSubstNo('%1 (Do not Change)', Workplan.FieldCaption("Global Dimension 2 Code"));
                    end;
                }
                textelement(PlannedAmountTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        PlannedAmountTxt := 'Resource Requirement Amount (Do not Change)';
                    end;
                }
                textelement(CeilingAmtTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        CeilingAmtTxt := 'Ceiling Amount';
                    end;
                }
            }
            tableelement(AnnualWorkplan; "Annual Strategy Workplan")
            {
                SourceTableView = where(Consolidated = const(true));
                fieldelement(AWP_NO; AnnualWorkplan.No)
                {
                }
                textelement(SpendingUnitAWPNameTxt)
                {
                    trigger OnBeforePassVariable()
                    var
                        DimensionValue: Record "Dimension Value";
                    begin
                        SpendingUnitAWPNameTxt := DimensionValue.GetDimensionDescription(2, AnnualWorkplan."Global Dimension 2 Code");
                    end;
                }
                fieldelement(GlobalDimension1Code; AnnualWorkplan."Global Dimension 1 Code")
                {
                }
                fieldelement(GlobalDimension2Code; AnnualWorkplan."Global Dimension 2 Code")
                {
                }
                textelement(PlannedAmtTxt)
                {
                    trigger OnBeforePassVariable()
                    begin
                        PlannedAmtTxt := StrSubstNo('%1', AnnualWorkplan.GetBudgetAmount());
                    end;
                }
                fieldelement(CeilingAmount; AnnualWorkplan."Ceiling Amount")
                {
                }
                trigger OnPreXmlItem()
                begin
                    AnnualWorkplan.SetRange("Annual Workplan", BatchHeader);
                end;
            }
        }
    }
    trigger OnPostXmlPort()
    begin
        currXMLport.Filename := StrSubstNo('%1_Ceiling_Amounts.csv', BatchHeader);
    end;

    var
        Workplan: Record "Annual Strategy Workplan";
        BatchHeader: Code[20];

    procedure GetBatchHeader(BHeader: Code[20])
    begin
        BatchHeader := BHeader;
    end;
}