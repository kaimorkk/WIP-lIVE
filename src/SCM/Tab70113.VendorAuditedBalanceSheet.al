
table 70113 "Vendor Audited Balance Sheet"
{
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
        field(3; "Current Assets (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                "Total Assets (LCY)" += "Current Assets (LCY)";
            end;
        }
        field(4; "Fixed Assets (LCY)"; Decimal)
        {
            Description = 'Long-term assets such as Investments, Tangible assets (e.g. Property, Land, F&F etc) and Intangible assets (e.g. Patent, Copyright etc)';

            trigger OnValidate()
            begin
                "Total Assets (LCY)" += "Fixed Assets (LCY)";
            end;
        }
        field(5; "Total Assets (LCY)"; Decimal)
        {
        }
        field(6; "Current Liabilities (LCY)"; Decimal)
        {
            Description = 'Obligations to be paid in the short-term such as Accounts payables, Short-term loans, tax payables, wages, unearned revenue etc';

            trigger OnValidate()
            begin
                "Total Liabilities (LCY)" += "Current Liabilities (LCY)";
                "Current Ratio" := "Current Assets (LCY)" / "Current Liabilities (LCY)";
                "Working Capital (LCY)" := "Current Assets (LCY)" - "Current Liabilities (LCY)";
                "Assets-To-Equity Ratio" := "Total Assets (LCY)" / "Current Ratio";
                "Debt-To-Equity Ratio" := "Total Liabilities (LCY)" / "Current Ratio";
            end;
        }
        field(7; "Long-term Liabilities (LCY)"; Decimal)
        {
            Description = 'Long-term debt (e.g. loans, mortgages, lease payments etc) and other payment obligations (e.g. deferred income tax)';

            trigger OnValidate()
            begin
                "Total Liabilities (LCY)" += "Long-term Liabilities (LCY)"
            end;
        }
        field(8; "Total Liabilities (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                "Debt Ratio" := "Total Liabilities (LCY)" / "Total Assets (LCY)";
            end;
        }
        field(9; "Owners Equity (LCY)"; Decimal)
        {
            Description = 'It includes the Owners investment and retained earnings. The Owners Equity is generally computed by subtracting Total Liabilities from Total Assets';

            trigger OnValidate()
            begin
                "Total Liabilities & Equity(LCY" := "Total Liabilities (LCY)" + "Owners Equity (LCY)";
            end;
        }
        field(10; "Total Liabilities & Equity(LCY"; Decimal)
        {
            Description = 'Total Liabilities & Owners Equity (LCY)';
        }
        field(11; "Debt Ratio"; Decimal)
        {
            DecimalPlaces = 6 : 6;
            Description = 'Total Liabilities/Total Assets';
        }
        field(12; "Current Ratio"; Decimal)
        {
            DecimalPlaces = 6 : 6;
            Description = 'Current Assets/Current Liabilities';
        }
        field(13; "Working Capital (LCY)"; Decimal)
        {
            DecimalPlaces = 6 : 6;
            Description = 'Current Assets-Current Liabilities';
        }
        field(14; "Assets-To-Equity Ratio"; Decimal)
        {
            DecimalPlaces = 6 : 6;
            Description = 'Total Assets/Owners Equity';
        }
        field(15; "Debt-To-Equity Ratio"; Decimal)
        {
            DecimalPlaces = 6 : 6;
            Description = 'Total Liabilities/Owners Equity';
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

