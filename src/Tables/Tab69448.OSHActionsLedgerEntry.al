
table 69448 "OSH Actions Ledger Entry"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Posting Date"; Date)
        {
        }
        field(3; "Source Document Type"; Option)
        {
            OptionCaption = ' ,Emergency Drill';
            OptionMembers = " ","Emergency Drill";
        }
        field(4; "Source Document No"; Code[50])
        {
        }
        field(5; "Action"; Text[2000])
        {
        }
        field(6; "OSH Responsibility"; Code[50])
        {
            TableRelation = "HSE Role".Code;
        }
        field(7; "Primary Responsibility Center"; Code[50])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(8; "Action Owner ID"; Code[50])
        {
            TableRelation = Resource."No." where(Type = const(Person));
        }
        field(9; "Due Date"; Date)
        {
        }
        field(10; "Action Type"; Option)
        {
            OptionCaption = ' ,Corrective,Preventive';
            OptionMembers = " ",Corrective,Preventive;
        }
        field(11; "Task Priority"; Code[50])
        {
        }
        field(13; "Action Status"; Code[50])
        {
        }
        field(14; "% Complete"; Decimal)
        {
        }
        field(15; "Evacuation Event ID"; Code[20])
        {
            TableRelation = "Evacuation Event".Code;
        }
        field(16; "Criteria Code"; Code[20])
        {
            TableRelation = "Evacuation Event Drill Criteri".Code where("Event ID" = field("Evacuation Event ID"));
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

