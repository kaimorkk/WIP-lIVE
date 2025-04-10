
table 80057 "PC Goal Hub"
{
    DrillDownPageID = "Aligned Business Goals";
    LookupPageID = "Aligned Business Goals";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Goal ID"; Code[50])
        {
        }
        field(2; "Performance Contract ID"; Code[50])
        {
            TableRelation = "Perfomance Contract Header".No;
        }
        field(3; "Goal Description"; Code[100])
        {
        }
        field(4; "Aligned-To Strategic Plan ID"; Code[100])
        {
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(5; "Aligned-To PC ID"; Code[100])
        {
        }
        field(6; "Aligned-To PC Goal ID"; Code[100])
        {
        }
    }

    keys
    {
        key(Key1; "Goal ID", "Performance Contract ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

