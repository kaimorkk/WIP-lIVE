
table 69628 "Recruitment Agency"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Agency No."; Code[30])
        {
        }
        field(2; Name; Text[50])
        {
        }
        field(3; "Phone No."; Text[30])
        {
        }
        field(4; Email; Text[30])
        {
        }
        field(5; Address; Text[30])
        {
        }
        field(6; Address2; Text[30])
        {
        }
        field(7; "Post Code"; Code[30])
        {
        }
        field(8; City; Text[30])
        {
        }
        field(9; Contact; Text[50])
        {
        }
        field(10; "Accreditation Cert No."; Code[30])
        {
        }
        field(11; "No. of Vacancy Posting"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Agency No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

