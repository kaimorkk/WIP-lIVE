
table 69446 "Emergency Drill Rating"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Emergency Drill Log"."Drill ID";
        }
        field(2; "Evacuation Event ID"; Code[20])
        {
            TableRelation = "Evacuation Event".Code;
        }
        field(3; "Code"; Code[20])
        {
            TableRelation = "Evacuation Event Drill Criteri".Code where("Event ID" = field("Evacuation Event ID"));

            trigger OnValidate()
            begin
                EvacuationEventDrillCriteri.Reset;
                EvacuationEventDrillCriteri.SetRange(Code, Code);
                if EvacuationEventDrillCriteri.FindSet then
                    "Evaluation Criterion" := EvacuationEventDrillCriteri.Description;
            end;
        }
        field(4; "Evaluation Criterion"; Text[2048])
        {
        }
        field(5; "General Rating"; Option)
        {
            OptionCaption = ' ,Excellent,Good,Fair,Poor,Very Poor';
            OptionMembers = " ",Excellent,Good,Fair,Poor,"Very Poor";
        }
        field(6; "Additional Comments/Notes"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Evacuation Event ID", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EvacuationEventDrillCriteri: Record "Evacuation Event Drill Criteri";
}

