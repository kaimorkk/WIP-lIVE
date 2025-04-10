#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
table 65030 "Funding Year Codes"
{
    DrillDownPageID = "Funding Year Codes";
    LookupPageID = "Funding Year Codes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Year Code"; Code[10])
        {
        }
        field(2; Description; Code[50])
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Year Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

