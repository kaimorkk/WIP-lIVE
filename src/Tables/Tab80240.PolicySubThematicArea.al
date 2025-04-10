
table 80240 "Policy Sub Thematic Area"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Thematic Code"; Code[50])
        {
        }
        field(3; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Introduction; Text[200])
        {
        }
        field(5; Purpose; Text[1000])
        {
        }
        field(6; Scope; Text[1000])
        {
        }
        field(7; Application; Text[1000])
        {
        }
        field(8; "Policy statement"; Text[1000])
        {
        }
        field(9; "Policy Guideline"; Text[1000])
        {
        }
        field(10; "Revision No."; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Thematic Code", "Code", "Revision No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

