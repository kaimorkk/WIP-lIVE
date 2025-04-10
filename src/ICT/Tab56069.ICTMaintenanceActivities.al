
table 56069 "ICT Maintenance Activities"
{
    DrillDownPageID = "ICT Maintenance Activities";
    LookupPageID = "ICT Maintenance Activities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Activity; Text[250])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
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
        fieldgroup(DropDown; "Code", Activity)
        {
        }
    }
}

