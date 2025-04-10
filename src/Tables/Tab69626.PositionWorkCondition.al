
table 69626 "Position Work Condition"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Position ID"; Code[30])
        {
            TableRelation = "Company Positions";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Work Condition Category"; Option)
        {
            OptionCaption = 'General Work Environment,Travel/Relocation,Special Tools & Equipment,Other Special Conditions,Workplace Rules';
            OptionMembers = "General Work Environment","Travel/Relocation","Special Tools & Equipment","Other Special Conditions","Workplace Rules";
        }
        field(4; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Position ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

