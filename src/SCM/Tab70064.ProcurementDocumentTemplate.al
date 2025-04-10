
table 70064 "Procurement Document Template"
{
    Caption = 'Procurement Document Template';
    DrillDownPageID = "Procurement Document Template";
    LookupPageID = "Procurement Document Template";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template ID"; Code[50])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Procurement Type"; Code[30])
        {
            TableRelation = "Procurement Types".Code;
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

