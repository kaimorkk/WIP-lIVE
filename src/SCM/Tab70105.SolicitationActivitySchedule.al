
table 70105 "Solicitation Activity Schedule"
{
    Caption = 'Procurement Activity Schedule';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Solicitation Type ID"; Code[30])
        {
            TableRelation = "Solicitation Type".Code;
        }
        field(2; "Activity Code"; Code[30])
        {
            TableRelation = "Procurement Activity Code"."Activity Code";
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Default Planned Duration"; Decimal)
        {
            Description = 'Default Planned Duration (Days)';
        }
    }

    keys
    {
        key(Key1; "Solicitation Type ID", "Activity Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

