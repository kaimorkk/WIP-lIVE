
table 56074 "Maintenance Activities"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            TableRelation = "ICT Maintenance Activities".Code;

            trigger OnValidate()
            begin
                ICTMaintenanceActivities.Reset;
                ICTMaintenanceActivities.SetRange(Code, Code);
                if ICTMaintenanceActivities.FindSet then
                    Activity := ICTMaintenanceActivities.Activity;
                Type := ICTMaintenanceActivities.Type;
            end;
        }
        field(2; Activity; Text[250])
        {
        }
        field(3; Type; Option)
        {
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
        }
        field(4; "Document No"; Code[50])
        {
        }
        field(5; "Maintenance Code"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Document No", "Maintenance Code")
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

    var
        ICTMaintenanceActivities: Record "ICT Maintenance Activities";
}

