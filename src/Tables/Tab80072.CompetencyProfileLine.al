
table 80072 "Competency Profile Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Integer)
        {
        }
        field(2; "Competency Profile ID"; Code[30])
        {
            TableRelation = "Competency Profile";
        }
        field(3; "Competency Priority"; Option)
        {
            OptionCaption = 'Core/Required,Desired/Added';
            OptionMembers = "Core/Required","Desired/Added";
        }
        field(4; "Competency ID"; Code[50])
        {
            TableRelation = Competency;
        }
        field(5; Description; Text[200])
        {
        }
        field(6; "Competency Rating Scale"; Code[200])
        {
            TableRelation = "Competency Proficiency Scale";
        }
    }

    keys
    {
        key(Key1; "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

