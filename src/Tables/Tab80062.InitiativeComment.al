
table 80062 "Initiative Comment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[100])
        {
        }
        field(2; "Initiative No."; Code[10])
        {
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; "Comment/Additional Notes"; Text[255])
        {
        }
        field(5; "User ID"; Code[100])
        {
        }
        field(6; "Last Update Date"; Date)
        {
        }
        field(7; "External Document No"; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Workplan No.", "Initiative No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

