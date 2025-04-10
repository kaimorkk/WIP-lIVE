
table 57105 "Approval Rejection Comments"
{
    DataCaptionFields = "Code", Description;
    DrillDownPageID = "Approval Rejection Reasons";
    LookupPageID = "Approval Rejection Reasons";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[50])
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

