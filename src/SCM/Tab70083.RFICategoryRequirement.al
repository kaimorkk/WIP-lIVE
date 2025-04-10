
table 70083 "RFI Category Requirement"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Category ID"; Code[30])
        {
            TableRelation = "Procurement Category".Code;
        }
        field(2; "Requirement Code"; Code[30])
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Requirement Type"; Option)
        {
            OptionCaption = ',Mandatory,Supporting';
            OptionMembers = ,Mandatory,Supporting;
        }
    }

    keys
    {
        key(Key1; "Category ID", "Requirement Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

