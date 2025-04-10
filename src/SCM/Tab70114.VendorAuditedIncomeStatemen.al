
table 70114 "Vendor Audited Income Statemen"
{
    Caption = 'Vendor Audited Income Statement';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vendor No."; Code[30])
        {
            TableRelation = Vendor."No.";
        }
        field(2; "Audit Year Code Reference"; Code[30])
        {
        }
        field(3; "Total Revenue (LCY)"; Decimal)
        {
            Description = 'Total Revenue made up of Sales revenue, Service revenue, Interest revenue  and Other revenue';

            trigger OnValidate()
            begin
                "Gross Margin (LCY)" += "Total Revenue (LCY)";
            end;
        }
        field(4; "Total COGS (LCY)"; Decimal)
        {
            Description = 'Long-term assets such as Investments, Tangible assets (e.g. Property, Land, F&F etc) and Intangible assets (e.g. Patent, Copyright etc)';

            trigger OnValidate()
            begin
                "Gross Margin (LCY)" -= "Total COGS (LCY)";
            end;
        }
        field(5; "Gross Margin (LCY)"; Decimal)
        {
            Description = 'Cost of Goods Sold';
        }
        field(6; "Total Operating Expenses (LCY)"; Decimal)
        {
            Description = 'Total Business operation expenses';

            trigger OnValidate()
            begin
                "Operating Income/EBIT (LCY)" := "Gross Margin (LCY)" - "Total Operating Expenses (LCY)";
            end;
        }
        field(7; "Operating Income/EBIT (LCY)"; Decimal)
        {
        }
        field(8; "Other Non-operating Re/Exp LCY"; Decimal)
        {
            Caption = 'Other Non-operating Revenues/Expenses (LCY)';

            trigger OnValidate()
            begin
                "Income Before Taxes (LCY)" := "Operating Income/EBIT (LCY)" + "Other Non-operating Re/Exp LCY";
            end;
        }
        field(9; "Interest Expense (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                "Income Before Taxes (LCY)" -= "Interest Expense (LCY)";
            end;
        }
        field(10; "Income Before Taxes (LCY)"; Decimal)
        {
        }
        field(11; "Income Tax Expense (LCY)"; Decimal)
        {
            DecimalPlaces = 6 : 6;

            trigger OnValidate()
            begin
                "Net Income from Ops  (LCY)" := "Income Before Taxes (LCY)" - "Income Tax Expense (LCY)";
            end;
        }
        field(12; "Net Income from Ops  (LCY)"; Decimal)
        {
            Caption = 'Net Income from Continuing Operations (LCY)';
            DecimalPlaces = 6 : 6;
        }
        field(13; "Below-the-line Items (LCY)"; Decimal)
        {
            DecimalPlaces = 6 : 6;

            trigger OnValidate()
            begin
                "Net Income" := "Net Income from Ops  (LCY)" + "Below-the-line Items (LCY)";
            end;
        }
        field(14; "Net Income"; Decimal)
        {
            DecimalPlaces = 6 : 6;
        }
    }

    keys
    {
        key(Key1; "Vendor No.", "Audit Year Code Reference")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

