
table 80003 "Quarterly Reporting Periods"
{
    DrillDownPageID = "Quarterly Reporting Periods";
    LookupPageID = "Quarterly Reporting Periods";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; "Year Code"; Code[100])
        {
            TableRelation = "Annual Reporting Codes";
        }
        field(3; Description; Code[100])
        {
        }
        field(4; "Reporting Start Date"; Date)
        {
        }
        field(5; "Reporting End Date"; Date)
        {
        }
        field(6; "Current Year?"; Boolean)
        {
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

