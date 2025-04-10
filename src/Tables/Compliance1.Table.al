Table 52193719 Compliance1
{
    DrillDownPageID = "Compliance list";
    LookupPageID = "Compliance list";

    fields
    {
        field(1;"Compliance Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;"Compliance Descrption";Text[200])
        {
            NotBlank = true;
        }
        field(3;"Date Created";Date)
        {
        }
        field(4;"Date Modified";Date)
        {
        }
        field(6;"Language Code (Default)";Code[10])
        {
        }
        field(7;Attachement;Option)
        {
            OptionMembers = No,Yes;
        }
    }

    keys
    {
        key(Key1;"Compliance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
         "Date Modified":=Today;
    end;
}

