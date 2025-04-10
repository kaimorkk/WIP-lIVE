
table 70205 "Tender Addendum Amendment"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Addendum Notice No."; Code[30])
        {
            TableRelation = "Tender Addendum Notice"."Addendum Notice No.";
        }
        field(2; "Line No."; Code[30])
        {
        }
        field(3; "Amended Section of Tender Doc"; Text[100])
        {
            Caption = 'Amended Section of Tender Document';
            Description = 'Amended Section of Tender Document';
        }
        field(4; "Amendment Type"; Code[30])
        {
            TableRelation = "Tender Addendum Type".Code;
        }
        field(5; "Amendment Description"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Addendum Notice No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

