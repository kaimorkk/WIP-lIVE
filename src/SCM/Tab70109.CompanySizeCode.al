
table 70109 "Company Size Code"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; Description; Text[60])
        {
        }
        field(3; "Min No. Of Employees"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(4; "Max No. Of Employees"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(5; "No. of Vendors"; Integer)
        {
            CalcFormula = count(Vendor where("Company Size" = field(Code)));
            FieldClass = FlowField;
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

