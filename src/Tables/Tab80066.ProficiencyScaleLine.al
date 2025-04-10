
table 80066 "Proficiency Scale Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Proficiency Scale ID"; Code[30])
        {
            TableRelation = "Competency Proficiency Scale".Code;
        }
        field(2; "Level ID"; Code[100])
        {
        }
        field(3; Description; Text[100])
        {
        }
        field(4; "Default Score Value"; Decimal)
        {
        }
        field(5; "Behavioral Indicator"; Text[255])
        {
        }
        field(6; "General Recommendations"; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Proficiency Scale ID", "Level ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

