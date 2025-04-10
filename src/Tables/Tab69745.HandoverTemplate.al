table 69745 "Handover Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(4; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(5; "Primary Directorate Name"; Text[250])
        {
        }
        field(6; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
                                                           "Direct Reports To" = field("Primary Directorate"));
        }
        field(7; "Primary Department Name"; Text[250])
        {
        }
        field(8; "Created By"; Code[50])
        {
        }
        field(9; "Created At"; Date)
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

