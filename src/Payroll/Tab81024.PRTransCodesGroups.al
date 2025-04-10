table 81024 "PR Trans Codes Groups"
{
    Caption = 'PR Transaction Code Groups';
    DrillDownPageID = "PR Trans Codes Groups - List";
    LookupPageID = "PR Trans Codes Groups - List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Group Code"; Code[20])
        {
        }
        field(2; "Group Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Group Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        PRTransCode: Record "PR Trans Codes Groups";
}

