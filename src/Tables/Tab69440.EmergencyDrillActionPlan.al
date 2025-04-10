
table 69440 "Emergency Drill Action Plan"
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
        field(4; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(5; "Action"; Text[2048])
        {
        }
        field(6; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(7; Responsibility; Code[20])
        {
            TableRelation = "HSE Role".Code;
        }
        field(8; "Owner ID"; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person));
        }
        field(9; "Planned Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Evacuation Event ID", "Criteria Code", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

