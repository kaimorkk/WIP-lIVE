
table 69727 "Prehire Medical Report Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
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
        field(6; "Medical History Response"; Option)
        {
            OptionCaption = ' ,NO,YES';
            OptionMembers = " ",NO,YES;
        }
        field(7; "Medical Examination Results"; Option)
        {
            OptionCaption = ' ,NORMAL,ABNORMAL';
            OptionMembers = " ",NORMAL,ABNORMAL;
        }
        field(8; "Additional Details"; Text[500])
        {
        }
        field(9; "Date of Last Vaccination"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

