
table 69429 "HSE Plan Calendar"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "OSH Activity Type"; Option)
        {
            OptionCaption = ' ,OSH Training,OSH Meeting,Emergency Drill,OSH Inspection';
            OptionMembers = " ","OSH Training","OSH Meeting","Emergency Drill","OSH Inspection";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Primary Mission"; Text[2048])
        {
        }
        field(6; Responsibility; Code[20])
        {
            TableRelation = "HSE Plan Role"."Role ID";
        }
        field(7; "Overall Owner ID"; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(8; "Planned Start Date"; Date)
        {
        }
        field(9; "Planned Due Date"; Date)
        {
        }
        field(10; "Action Status"; Option)
        {
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(11; "% Complete"; Decimal)
        {
        }
        field(12; "Activity Priority"; Option)
        {
            OptionMembers = " ",Normal,Low,High;
        }
        field(13; "Actual Date Done"; Date)
        {
        }
        field(14; "Venue/Location"; Text[2048])
        {
        }
        field(15; "Meeting Medium"; Option)
        {
            OptionMembers = " ","Face to Face",Online;
        }
        field(16; "Evacuation Event ID"; Code[20])
        {
            TableRelation = "Evacuation Event".Code where(Blocked = const(false));
        }
    }

    keys
    {
        key(Key1; "Plan ID", "OSH Activity Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

