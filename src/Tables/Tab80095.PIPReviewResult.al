
table 80095 "PIP Review Result"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "PIP Review ID"; Code[100])
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
        field(4; "PIP ID"; Code[30])
        {
        }
        field(5; "PIP Objective  ID"; Code[100])
        {
        }
        field(6; "Performance Deficiency ID"; Code[100])
        {
        }
        field(7; "Expectation to be met"; Code[255])
        {
        }
        field(8; "Performance Notes"; Code[255])
        {
        }
        field(9; "Actual Date"; Date)
        {
        }
        field(10; "Outcome Perfomance Indicator"; Code[255])
        {
        }
        field(11; "Unit of Measure"; Code[30])
        {
        }
        field(12; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(13; "Target Qty"; Decimal)
        {
        }
        field(14; "Achievement Qty"; Decimal)
        {
        }
        field(15; "Final Performance Rating"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "PIP Review ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

