Table 52193554 "Non-Pensionable Pay"
{
    // //DrillDownPageID = UnknownPage51507415;
    // //LookupPageID = UnknownPage51507415;

    fields
    {
        field(1; "Item No."; Code[10])
        {
            NotBlank = true;
            TableRelation = "Non-Pensionable Items".Code;

            trigger OnValidate()
            begin
                if NonPensionable.Get("Item No.") then
                    Description := NonPensionable.Description;
            end;
        }
        field(3; Description; Text[60])
        {
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Earnings.Code;
        }
        field(6; "Employee No"; Code[20])
        {
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "Item No.", "Code", "Employee No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    fieldgroups
    {
    }

    var
        NonPensionable: Record "Non-Pensionable Items";
}

