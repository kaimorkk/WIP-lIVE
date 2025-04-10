
table 95247 "Risk & Audit Comm Composition"
{
    // DrillDownPageID = "Procurement Comm Composition";
    // LookupPageID = "Procurement Comm Composition";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Committee Type"; Code[20])
        {
            TableRelation = "Audit Committee Types"."Committee Type";
        }
        field(2; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "Minimum No. of Members"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Committee Type", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

