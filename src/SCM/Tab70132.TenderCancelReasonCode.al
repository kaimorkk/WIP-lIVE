
table 70132 "Tender Cancel Reason Code"
{
    Caption = 'Tender Cancel Reason Code';
    DataCaptionFields = "Code", Description;
    LookupPageID = "Tender Cancel Reason Code";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; Description; Text[250])
        {
            Caption = 'Description';
        }
        field(3; "No. of Cancelled IFSs"; Integer)
        {
            Caption = 'No. of Cancelled IFSs';
            Editable = false;
        }
        field(4; Blocked; Boolean)
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
        fieldgroup(DropDown; "Code", Description, Blocked)
        {
        }
    }
}

