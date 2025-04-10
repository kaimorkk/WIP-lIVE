
table 69696 "Medical History Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; "Record Type"; Option)
        {
            OptionCaption = 'Medical Condition,General Health Question,Medical Examination,Lab Test';
            OptionMembers = "Medical Condition","General Health Question","Medical Examination","Lab Test";
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Vaccine-Preventable Condition"; Boolean)
        {
        }
        field(5; "Examination Type"; Code[30])
        {
            TableRelation = "Medical Examination Type";
        }
        field(6; "Applicable Gender"; Option)
        {
            OptionCaption = 'Both Male/Female,Male Only,Female Only';
            OptionMembers = "Both Male/Female","Male Only","Female Only";
        }
        field(7; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

