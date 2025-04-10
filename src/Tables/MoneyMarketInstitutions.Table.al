Table 52193968 "Money Market Institutions"
{
    // //DrillDownPageID = UnknownPage74221;
    // //LookupPageID = UnknownPage74221;

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(9; "Investment type"; Text[30])
        {
            //TableRelation = Table74012;

            trigger OnValidate()
            begin
                if InvestmentType.Get("Investment type") then
                    "Investment Type Name" := InvestmentType.Description;
            end;
        }
        field(10; "Investment Type Name"; Text[30])
        {
        }
        field(11; "Asset Type"; Option)
        {
            OptionCaption = ',Equity,Money Market';
            OptionMembers = ,Equity,"Money Market";
        }
        field(12; "Search Name"; Text[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; Description)
        {
        }
    }

    fieldgroups
    {
    }

    var
        InvestmentType: Record "Investment Types";
}

