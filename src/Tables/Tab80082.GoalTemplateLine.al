
table 80082 "Goal Template Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Goal ID"; Code[50])
        {
        }
        field(2; "Goal Template ID"; Code[100])
        {

            trigger OnValidate()
            begin
                if GoalTemplate.Get("Goal Template ID") then begin
                    "Corporate Strategic Plan ID" := GoalTemplate."Corporate Strategic Plan ID";
                end;
            end;
        }
        field(3; Description; Text[50])
        {
        }
        field(4; "Goal Category"; Code[100])
        {
            TableRelation = "Goal Category";
        }
        field(5; "Corporate Strategic Plan ID"; Code[100])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(6; "Strategic Objective ID"; Code[100])
        {
            TableRelation = "Strategic Objective"."Objective ID";
        }
    }

    keys
    {
        key(Key1; "Goal ID", "Goal Template ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GoalTemplate: Record "Goal Template";
}

