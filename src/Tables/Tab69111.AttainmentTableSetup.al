
table 69111 "Attainment Table Setup"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Attainment; Text[30])
        {
            TableRelation = Qualification.Code;
        }
        field(3; Level; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Code", Attainment, Level)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; Attainment, Level)
        {
        }
    }
}

