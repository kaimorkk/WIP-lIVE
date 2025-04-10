
table 69434 "HSE Plan Line Hazard Control"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Hazard ID"; Code[20])
        {
            TableRelation = "HSE Plan Line"."Hazard ID" where("Plan ID" = field("Plan ID"));
        }
        field(3; "Hazard Type"; Code[20])
        {
            TableRelation = "HSE Plan Line"."Hazard Type" where("Plan ID" = field("Plan ID"));
        }
        field(4; "Control ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Description; Text[2048])
        {
        }
        field(6; Responsibility; Code[20])
        {
            TableRelation = "HSE Plan Role"."Role ID";
        }
        field(7; "Responsible Officer No."; Code[20])
        {
        }
        field(8; "Action Status"; Option)
        {
            OptionMembers = " ",Planned,Ongoing,Completed;
        }
        field(9; "% Complete"; Decimal)
        {
        }
        field(10; "Task Priority"; Option)
        {
            OptionMembers = " ",Normal,Low,High;
        }
        field(11; "Planned Start Date"; Date)
        {
        }
        field(12; "Planned Due Date"; Date)
        {
        }
        field(13; "Actual Date Done"; Date)
        {
        }
        field(14; "Action Type"; Option)
        {
            OptionMembers = " ",Corrective,Preventive;
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Hazard ID", "Hazard Type", "Control ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

