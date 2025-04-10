
table 80094 "Improvement Plan Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PIP ID"; Code[30])
        {
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Document Type"; Option)
        {
            OptionCaption = 'PIP,PIP Review';
            OptionMembers = PIP,"PIP Review";
        }
        field(4; "Expectation to be met"; Code[100])
        {
        }
        field(5; "Performance Deficiency ID"; Code[100])
        {
        }
        field(6; "Achievement Due Date"; Date)
        {
        }
        field(7; "Outcome Perfomance Indicator"; Code[100])
        {
        }
        field(8; "Unit of Measure"; Code[100])
        {
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Target Qty"; Decimal)
        {
        }
        field(11; "Achievement Qty"; Decimal)
        {
        }
        field(12; "Final Performance Rating"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "PIP ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

