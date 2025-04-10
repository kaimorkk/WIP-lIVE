
table 70112 "Vendor Special Group Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Certifcate No"; Code[30])
        {
        }
        field(2; "Vendor No"; Code[30])
        {
            TableRelation = Vendor."No.";
        }
        field(3; "Vendor Category"; Code[30])
        {
            TableRelation = "Special Vendor Category".Code;
        }
        field(4; "Certifying Agency"; Code[30])
        {
            TableRelation = Contact;
        }
        field(5; "Products/Service Category"; Text[50])
        {
        }
        field(6; "Certificate Expiry Date"; Date)
        {
        }
        field(7; "Effective Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; Blocked; Boolean)
        {
        }
        field(10; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(11; "Registered Special Group"; Code[30])
        {
            TableRelation = "Special Vendor Category".Code;
        }
    }

    keys
    {
        key(Key1; "Certifcate No", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

