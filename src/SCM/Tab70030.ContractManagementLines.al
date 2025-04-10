
table 70030 "Contract Management Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Contract Header"; Code[20])
        {
            TableRelation = "Contract Management Header";
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; Supplier; Code[50])
        {
            TableRelation = Vendor;
        }
        field(4; "Service Provided"; Text[250])
        {
        }
        field(5; "Contract Amount"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Contract Header", Supplier)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

