
table 65016 "Funding Source"
{
    DrillDownPageID = "Funding Source List";
    LookupPageID = "Funding Source List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Funding Source Text Code"; Code[100])
        {
        }
        field(5; "Short Name"; Text[250])
        {
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Percentage; Decimal)
        {
            DataClassification = ToBeClassified;
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

