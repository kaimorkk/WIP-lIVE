
table 95103 "Risk Rating Actual Scale"
{
    DrillDownPageID = "Risk Rating Actual Scale";
    LookupPageID = "Risk Rating Actual Scale";

    fields
    {
        field(1; "Risk Rating Scale Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
        }
        field(2; "Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Rating Score"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Actual Rating"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Risk Rating Scale Type", "Rating Scale ID", "Code", "Rating Score", "Actual Rating")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Code", "Actual Rating")
        {
        }
    }
}

