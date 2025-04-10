
table 69643 "HR Document Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Issuing Agency Code"; Code[30])
        {
            TableRelation = Contact;
        }
        field(4; Blocked; Boolean)
        {
        }
        field(5; "Local Verification URL"; Text[100])
        {
            ExtendedDatatype = URL;
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

