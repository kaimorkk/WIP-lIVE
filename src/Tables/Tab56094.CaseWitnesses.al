
table 56094 "Case Witnesses"
{

    fields
    {
        field(1; "Case No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "ID No"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "First Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Middle Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Last Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Phone No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Title; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Mr,Mrs,Ms';
            OptionMembers = " ",Mr,Mrs,Ms;
        }
        field(8; Designation; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(9; Remarks; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Comments; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(11; Relationship; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Plantif,Defendant';
            OptionMembers = Plantif,Defendant;
        }
        field(13; Email; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14; Address; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Case No", "ID No", Type)
        {
            Clustered = true;
        }
        key(Key2; "First Name")
        {
        }
        key(Key3; Title)
        {
        }
    }

    fieldgroups
    {
    }
}

