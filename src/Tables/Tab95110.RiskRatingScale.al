
table 95110 "Risk Rating Scale"
{
    DrillDownPageID = "Risk Rating Scales";
    LookupPageID = "Risk Rating Scales";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Risk Rating Scale Type"; Option)
        {
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
        }
        field(2; "Rating Scale ID"; Code[20])
        {
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Additional Comments"; Text[2048])
        {
        }
        field(5; "Effective Date"; Date)
        {
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; "Actual Rating"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Risk Rating Scale Type", "Rating Scale ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

