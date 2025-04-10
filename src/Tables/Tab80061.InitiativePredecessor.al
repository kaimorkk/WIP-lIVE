
table 80061 "Initiative Predecessor"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
        }
        field(2; "Initiative No."; Integer)
        {
        }
        field(3; "Preceeding Initiative"; Integer)
        {
        }
        field(4; Description; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Workplan No.")
        {
            Clustered = true;
        }
        key(Key2; "Initiative No.")
        {
        }
        key(Key3; "Preceeding Initiative")
        {
        }
    }

    fieldgroups
    {
    }
}

