
table 69408 "Safety Permit Checklist"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Permit Type"; Code[20])
        {
            TableRelation = "Safe Work Permit Type".Code;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; Description; Text[2048])
        {
        }
        field(4; "Condition Type"; Option)
        {
            OptionCaption = ' ,Pre-works,Post-Works';
            OptionMembers = " ","Pre-works","Post-Works";
        }
        field(5; "Requirement Type"; Option)
        {
            OptionCaption = ' ,Mandatory,Optional';
            OptionMembers = " ",Mandatory,Optional;
        }
        field(6; "Severity Level for Violation"; Code[20])
        {
            TableRelation = "Incident Severity Level".Code;
        }
    }

    keys
    {
        key(Key1; "Permit Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

