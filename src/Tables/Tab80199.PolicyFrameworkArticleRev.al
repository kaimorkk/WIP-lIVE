
table 80199 "Policy Framework Article Rev"
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
        field(7; "Revision No."; Code[30])
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

