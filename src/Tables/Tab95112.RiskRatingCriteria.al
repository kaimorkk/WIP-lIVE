
table 95112 "Risk Rating Criteria"
{
    DrillDownPageID = "Risk Rating Criteria";
    LookupPageID = "Risk Rating Criteria";

    fields
    {
        field(1; "Risk Rating Scale Type"; Option)
        {
            DataClassification = ToBeClassified;
            Description = '';
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
        }
        field(2; "Rating Scale ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line"."Rating Scale ID";
        }
        field(3; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Risk Rating Scale Line".Code;
        }
        field(4; "Criterion ID"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(5; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Risk Rating Scale Type", "Rating Scale ID", "Code", "Criterion ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

