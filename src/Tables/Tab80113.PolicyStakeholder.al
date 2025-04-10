
table 80113 "Policy Stakeholder"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Policy ID"; Code[30])
        {
            TableRelation = Policy.Code;
        }
        field(2; "Stakeholder Group ID"; Code[50])
        {
            TableRelation = "Stakeholder Group".Code;

            trigger OnValidate()
            begin
                if StakeholderGroup.Get("Stakeholder Group ID") then begin
                    Description := StakeholderGroup.Description;
                end;
            end;
        }
        field(3; Description; Text[255])
        {
        }
        field(4; "Code"; Code[50])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StakeholderGroup: Record "Stakeholder Group";
}

