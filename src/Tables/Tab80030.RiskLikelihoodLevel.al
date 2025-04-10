
table 80030 "Risk Likelihood Level"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Likelihood Level"; Code[50])
        {
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Min Occurrence Prob(%)"; Decimal)
        {
        }
        field(5; "Max Occurrence Prob(%)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Likelihood Level")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

