
table 95113 "Overal Risk Response Action"
{
    DrillDownPageID = "Overal Risk Response Actions";
    LookupPageID = "Overal Risk Response Actions";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Risk Rating Scale Type"; Option)
        {
            Description = '';
            OptionCaption = ' ,Likelihood Rating,Impact Rating,Overall Risk Rating,Risk Appetite Rating';
            OptionMembers = " ","Likelihood Rating","Impact Rating","Overall Risk Rating","Risk Appetite Rating";
            TableRelation = "Risk Rating Scale Line"."Risk Rating Scale Type";
        }
        field(2; "Rating Scale ID"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line"."Rating Scale ID";
        }
        field(3; "Code"; Code[20])
        {
            TableRelation = "Risk Rating Scale Line".Code;
        }
        field(4; "Response Action ID"; Integer)
        {
            AutoIncrement = true;
        }
        field(5; Description; Text[2048])
        {
        }
    }

    keys
    {
        key(Key1; "Risk Rating Scale Type", "Rating Scale ID", "Code", "Response Action ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

