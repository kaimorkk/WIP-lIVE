
table 80025 "Situational Analysis Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Matrix ID"; Code[30])
        {
            TableRelation = "Situational Analysis Matrix";
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Situational Analysis Model"; Code[50])
        {
        }
        field(4; "Entry Type"; Option)
        {
            OptionCaption = 'Strength,Weakness,Opportunity,Threat';
            OptionMembers = Strength,Weakness,Opportunity,Threat;
        }
        field(5; Description; Text[255])
        {
        }
        field(6; "Primary Directorate"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const(Directorate));
        }
        field(7; "Primary Department"; Code[50])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"));
        }
    }

    keys
    {
        key(Key1; "Matrix ID", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

