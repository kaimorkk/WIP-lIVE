Table 52193811 "Commissioner ED1"
{
    DrillDownPageID = "Commissioners E/D List";
    LookupPageID = "Commissioners E/D List";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;Type;Option)
        {
            OptionCaption = ' ,Earning,Deduction,Allowance';
            OptionMembers = " ",Earning,Deduction,Allowance;
        }
        field(4;"GL Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5;Taxable;Boolean)
        {
        }
        field(6;PAYE;Boolean)
        {
        }
        field(7;"Calculation Type";Option)
        {
            OptionMembers = " ","Per sitting";
        }
        field(8;"Payment Frequency";Option)
        {
            OptionMembers = " ",Monthly,"Meeting Based";
        }
        field(9;Recurring;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

