Table 52193841 "Bracket Tablesx1"
{
    DrillDownPageID = "Bracket Tables";
    LookupPageID = "Bracket Tables";

    fields
    {
        field(1;"Bracket Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;"Bracket Description";Text[80])
        {
        }
        field(3;"Effective Starting Date";Date)
        {
        }
        field(4;"Effective End Date";Date)
        {
        }
        field(5;Annual;Boolean)
        {
        }
        field(6;Type;Option)
        {
            OptionCaption = 'Fixed,Graduating Scale';
            OptionMembers = "Fixed","Graduating Scale";
        }
    }

    keys
    {
        key(Key1;"Bracket Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

