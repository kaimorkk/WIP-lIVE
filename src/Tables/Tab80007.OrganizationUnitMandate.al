
table 80007 "Organization Unit Mandate"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Organization Unit Code"; Option)
        {
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,Section,Region,Branch;
        }
        field(3; Description; Text[255])
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

