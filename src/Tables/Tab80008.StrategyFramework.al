
table 80008 "Strategy Framework"
{
    DrillDownPageID = "Strategy Framework";
    LookupPageID = "Strategy Framework";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Default; Boolean)
        {
        }
        field(4; Type; Option)
        {
            OptionCaption = 'Perfomance Management  Model,Situational Analysis Model';
            OptionMembers = "Perfomance Management  Model","Situational Analysis Model";
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

