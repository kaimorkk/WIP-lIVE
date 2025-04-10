
table 69177 "Trainers Involved"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "ID No."; Code[10])
        {
        }
        field(3; "Trainer Full Name"; Text[100])
        {
        }
        field(4; Comments; Text[200])
        {
        }
        field(5; "Training Application No"; Code[30])
        {
        }
        field(6; Email; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No.", "ID No.", "Training Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

