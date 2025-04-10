
table 80089 "Per Diary Journal Batch"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Owner Staff No"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "No. Series"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

