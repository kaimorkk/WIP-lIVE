table 52193665 "PR Bank Accounts"
{
    DrillDownPageID = "PR Bank Accounts";
    LookupPageID = "PR Bank Accounts";
    DataCaptionFields = "Bank Code", "Bank Name";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Bank Code"; Code[20])
        {
        }
        field(2; "Bank Name"; Text[100])
        {
        }
        field(3; "Bank Type"; Option)
        {
            OptionMembers = Bank,Sacco;
        }
        field(4; ByPassValidation; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Bank Code")
        {
            Clustered = true;
        }
        key(Key2; "Bank Name")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Bank Code", "Bank Name")
        {
        }
    }
}

