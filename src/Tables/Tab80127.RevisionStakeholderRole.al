
table 80127 "Revision Stakeholder Role"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Code"; Code[50])
        {
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; Responsibility; Text[255])
        {
        }
        field(5; "Revision No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Revision No.", "Code", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

