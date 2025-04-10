
table 80044 "Risk Mitigation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Risk Register ID"; Integer)
        {
            TableRelation = "Risk Register"."Entry No";
        }
        field(2; "Document No"; Code[50])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; "Mitigation Measure"; Text[255])
        {
        }
    }

    keys
    {
        key(Key1; "Risk Register ID", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

