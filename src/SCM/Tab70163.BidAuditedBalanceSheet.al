
table 70163 "Bid Audited Balance Sheet"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Caption = 'Document Type';
            OptionCaption = 'Quote,Order,Invoice,Credit Memo,Blanket Order,Return Order,Store Requisition,Purchase Requisition,,,,,,IEC Materials';
            OptionMembers = Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","Store Requisition","Purchase Requisition",,,,,,"IEC Materials";
        }
        field(2; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = "Purchase Header"."No.";
        }
        field(3; "Audit Year Code Reference"; Code[30])
        {
            //TableRelation = "Calendar Year Code".Code;
        }
        field(4; "Vendor No."; Code[30])
        {
            TableRelation = Vendor."No.";
        }
        field(5; "Current Assets (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Current Assets (LCY)"+="Audit Year Code Reference";
            end;
        }
        field(6; "Fixed Assets (LCY)"; Decimal)
        {
            Description = 'Long-term assets such as Investments, Tangible assets (e.g. Property, Land, F&F etc) and Intangible assets (e.g. Patent, Copyright etc)';

            trigger OnValidate()
            begin
                //"Current Assets (LCY)"+="Vendor No.";
            end;
        }
        field(7; "Total Assets (LCY)"; Decimal)
        {
        }
        field(8; "Current Liabilities (LCY)"; Decimal)
        {
            Description = 'Obligations to be paid in the short-term such as Accounts payables, Short-term loans, tax payables, wages, unearned revenue etc';

            trigger OnValidate()
            begin
                /*"Current Liabilities (LCY)"+="Fixed Assets (LCY)";
                "Total Liabilities & Equity(LCY":="Audit Year Code Reference"/"Fixed Assets (LCY)";
                "Debt Ratio":="Audit Year Code Reference"-"Fixed Assets (LCY)";
                "Current Ratio":="Current Assets (LCY)"/"Total Liabilities & Equity(LCY";
                "Working Capital (LCY)":="Current Liabilities (LCY)"/"Total Liabilities & Equity(LCY";*/

            end;
        }
        field(9; "Long-term Liabilities (LCY)"; Decimal)
        {
            Description = 'Long-term debt (e.g. loans, mortgages, lease payments etc) and other payment obligations (e.g. deferred income tax)';

            trigger OnValidate()
            begin
                "Current Liabilities (LCY)" += "Total Assets (LCY)"
            end;
        }
        field(10; "Total Liabilities (LCY)"; Decimal)
        {

            trigger OnValidate()
            begin
                //"Owners Equity (LCY)":="Current Liabilities (LCY)"/"Current Assets (LCY)";
            end;
        }
        field(11; "Owners Equity (LCY)"; Decimal)
        {
            Description = 'It includes the Owners investment and retained earnings. The Owners Equity is generally computed by subtracting Total Liabilities from Total Assets';

            trigger OnValidate()
            begin
                //"Total Liabilities (LCY)":="Current Liabilities (LCY)"+"Long-term Liabilities (LCY)";
            end;
        }
        field(12; "Total Liabilities & Equity(LCY"; Decimal)
        {
            Description = 'Total Liabilities & Owners Equity (LCY)';
        }
        field(13; "Debt Ratio"; Decimal)
        {
            DecimalPlaces = 9 : 9;
            Description = 'Total Liabilities/Total Assets';
        }
        field(14; "Current Ratio"; Decimal)
        {
            DecimalPlaces = 9 : 9;
            Description = 'Current Assets/Current Liabilities';
        }
        field(15; "Working Capital (LCY)"; Decimal)
        {
            DecimalPlaces = 6 : 6;
            Description = 'Current Assets-Current Liabilities';
        }
        field(16; "Assets-To-Equity Ratio"; Decimal)
        {
            DecimalPlaces = 9 : 9;
            Description = 'Total Assets/Owners Equity';
        }
        field(17; "Debt-To-Equity Ratio"; Decimal)
        {
            DecimalPlaces = 9 : 9;
            Description = 'Total Liabilities/Owners Equity';
        }
    }

    keys
    {
        key(Key1; "Document Type", "No.", "Audit Year Code Reference")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

