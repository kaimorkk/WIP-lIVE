Table 52193547 "Leave Approval"
{
    // //DrillDownPageID = UnknownPage51507407;
    // //LookupPageID = UnknownPage51507407;

    fields
    {
        field(2; "Department code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(3; Approved; Boolean)
        {
        }
        field(4; "Entry No"; Integer)
        {
        }
        field(5; "Approve By"; Text[100])
        {
        }
        field(6; "Approved Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Department code", "Entry No")
        {
            Clustered = true;
        }
        key(Key2; Approved)
        {
        }
    }

    fieldgroups
    {
    }

    var
        Approval: Record "Leave Approval";
}

