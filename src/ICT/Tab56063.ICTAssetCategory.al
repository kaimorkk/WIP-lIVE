
table 56063 "ICT Asset Category"
{
    DrillDownPageID = "ICT Category";
    LookupPageID = "ICT Category";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Name; Text[250])
        {
        }
        field(3; "FA Class Code"; Code[30])
        {
            TableRelation = "FA Class".Code;
        }
        field(4; "FA SubClass"; Code[30])
        {
            TableRelation = "FA Subclass".Code where("FA Class Code" = field("FA Class Code"));
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

