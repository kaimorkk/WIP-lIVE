
table 80126 "Policy Stakeholder Revision"
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
        field(4; "Revision No."; Code[30])
        {
        }
        field(5; "Code"; Code[50])
        {
        }
        field(6; Entry; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Policy ID", "Revision No.", "Code")
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

