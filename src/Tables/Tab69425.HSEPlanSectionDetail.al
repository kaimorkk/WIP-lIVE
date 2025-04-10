
table 69425 "HSE Plan Section Detail"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Plan ID"; Code[20])
        {
            TableRelation = "HSE Plan"."Plan ID";
        }
        field(2; "Section Type"; Option)
        {
            OptionMembers = " ",Overview,Objective,"Guiding Principle","Revision/Version";
        }
        field(3; "Section Line No."; Integer)
        {
        }
        field(4; "Entry No."; Integer)
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
        field(7; "Unit of Measure"; Code[20])
        {
            TableRelation = "Unit of Measure".Code;
        }
        field(8; "Performance Indicator"; Text[2048])
        {
        }
        field(9; Target; Text[2048])
        {
        }
        field(10; "Planned Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Section Type", "Section Line No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

