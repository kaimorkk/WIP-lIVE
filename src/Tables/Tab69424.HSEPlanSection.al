
table 69424 "HSE Plan Section"
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
            OptionCaption = ',Overview,Objective,Guiding Principle,Revision/Version';
            OptionMembers = " ",Overview,Objective,"Guiding Principle","Revision/Version";
        }
        field(3; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Description; Text[2048])
        {
        }
        field(5; "Revision Date"; Date)
        {
        }
        field(6; "No. of Comments"; Integer)
        {
        }
        field(7; "No. of Initiatives"; Integer)
        {
        }
        field(8; "No. of Guiding Principle Stmts"; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Plan ID", "Section Type", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

