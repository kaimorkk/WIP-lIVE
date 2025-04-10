
table 69663 "Passed Mandatory"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Vacancy ID"; Code[30])
        {
        }
        field(4; Description; Text[50])
        {
        }
        field(5; "Qualification Category"; Option)
        {
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes,Proffessional Bodies';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes","Proffessional Bodies";
        }
        field(6; "Qualification Code"; Code[30])
        {
            TableRelation = Qualification;
        }
        field(7; "Specialized Domain Area"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

