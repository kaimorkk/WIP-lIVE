
table 70229 "Supplier Registration Periods"
{
    DrillDownPageID = "Supplier Registration Periods";
    LookupPageID = "Supplier Registration Periods";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[250])
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; "Financial Year Code"; Code[10])
        {
            TableRelation = "Annual Reporting Codes".Code where("Current Year" = const(true));
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

