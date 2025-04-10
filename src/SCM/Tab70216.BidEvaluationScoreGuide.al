
table 70216 "Bid Evaluation Score Guide"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[30])
        {
        }
        field(3; "Criteria Group ID"; Code[30])
        {
        }
        field(4; "Requirement ID"; Integer)
        {
        }
        field(5; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(6; "Target Qty"; Decimal)
        {
        }
        field(7; "Rating Type"; Option)
        {
            OptionCaption = 'Number,Yes/No,Options Text,Date';
            OptionMembers = Number,"Yes/No","Options Text",Date;
        }
        field(8; "Evaluation Type"; Option)
        {
            OptionCaption = 'Preliminary Evaluation,Technical Evaluation,Financial Evaluation';
            OptionMembers = "Preliminary Evaluation","Technical Evaluation","Financial Evaluation";
        }
        field(9; "Desired Perfomance Direction"; Option)
        {
            OptionCaption = 'Increasing KPI,Decreasing KPI,Not Applicable';
            OptionMembers = "Increasing KPI","Decreasing KPI","Not Applicable";
        }
        field(10; "Response Value"; Code[50])
        {
        }
        field(11; "Min Bid Value"; Decimal)
        {
        }
        field(12; "Max Bid Value"; Decimal)
        {
        }
        field(13; "Min Date Value"; Date)
        {
        }
        field(14; "Max Date Value"; Date)
        {
        }
        field(15; "Score %"; Decimal)
        {
            MaxValue = 100;
            MinValue = 0;
        }
        field(16; "Document No"; Code[20])
        {
            TableRelation = "Bid Evaluation Register".Code;
        }
    }

    keys
    {
        key(Key1; "Template ID", "Criteria Group ID", "Requirement ID", "Entry No", "Response Value", "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

