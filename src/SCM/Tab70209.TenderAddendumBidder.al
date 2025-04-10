
table 70209 "Tender Addendum Bidder"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Addendum Notice No."; Code[20])
        {
            TableRelation = "Tender Addendum Notice"."Addendum Notice No.";
        }
        field(2; "IFS No."; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;
        }
        field(3; "Vendor No."; Code[20])
        {
            TableRelation = Vendor."No.";
        }
        field(4; "Vendor Name"; Text[100])
        {
        }
        field(5; "Primary Email"; Text[80])
        {
        }
        field(6; "Addendum e-Notice Sent"; Boolean)
        {
            Editable = false;
        }
        field(7; "e-Notice Sent Date/Time"; DateTime)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Addendum Notice No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

