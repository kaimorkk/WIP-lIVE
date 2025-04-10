
table 69698 "Medical Checks Template Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template Id"; Code[30])
        {
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Medical History Type"; Option)
        {
            OptionCaption = ' ,General Health Question,Individual History,Family History,Vaccination History,Medical Examination,Lab Test';
            OptionMembers = " ","General Health Question","Individual History","Family History","Vaccination History","Medical Examination","Lab Test";
        }
        field(4; "Code"; Code[30])
        {
        }
        field(5; Description; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Template Id", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

