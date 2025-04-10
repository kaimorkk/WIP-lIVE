
table 69401 "Hazard Type"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Description; Text[440])
        {
        }
        field(3; "Hazard Category"; Option)
        {
            OptionCaption = ' ,Physical,Chemical,Biological,Psychosocial,General Environment';
            OptionMembers = " ",Physical,Chemical,Biological,Psychosocial,"General Environment";
        }
        field(4; "No. of Reported Incidents"; Integer)
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(5; Blocked; Boolean)
        {
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

