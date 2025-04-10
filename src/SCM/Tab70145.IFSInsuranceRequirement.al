
table 70145 "IFS Insurance Requirement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "IFS Code"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Insurance Type"; Code[30])
        {
            TableRelation = "Insurance Type".Code;
        }
        field(3; "Policy Cover Type"; Option)
        {
            OptionCaption = 'Third Party,Comprehensive';
            OptionMembers = "Third Party",Comprehensive;
        }
        field(4; Description; Text[100])
        {
        }
        field(5; "Minimum Policy Coverage (LCY)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

