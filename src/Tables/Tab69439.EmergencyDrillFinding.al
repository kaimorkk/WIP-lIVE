
table 69439 "Emergency Drill Finding"
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
        field(3; "Criteria Code"; Code[20])
        {
            TableRelation = "Evacuation Event Drill Criteri".Code where("Event ID" = field("Evacuation Event ID"));
        }
        field(4; "Drill Assessment Criteria"; Text[2048])
        {
        }
        field(5; "General Rating"; Code[20])
        {
        }
        field(6; "Additional Comments/Findings"; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Evacuation Event ID", "Criteria Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

