
table 80190 "Policy Framework Article"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Framework Code"; Code[50])
        {
            TableRelation = "Policy Framework Implication"."Framework Code";
        }
        field(3; "Implication ID"; Integer)
        {
            TableRelation = "Policy Framework Implication"."Line No.";
        }
        field(4; "Line No"; Integer)
        {
        }
        field(5; Description; Text[255])
        {
        }
        field(6; "External Document No."; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Framework Code", "Implication ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

