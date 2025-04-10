#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 52018 "Budget Estimates"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[30])
        {
            // TableRelation = "Road Planning Header";
        }
        field(2; "Template ID"; Code[30])
        {
            // TableRelation = "Budget Template".Code;
        }
        field(3; "Budget Estimates"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

