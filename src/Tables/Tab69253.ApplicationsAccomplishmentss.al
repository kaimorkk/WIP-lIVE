
table 69253 "Applications Accomplishmentss"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Job Application No"; Code[30])
        {
            TableRelation = "HR Job Applications";
        }
        field(3; "Job Indicator Code"; Code[30])
        {
            TableRelation = "Job Indicators Setup"."Indicator  Code";

            trigger OnValidate()
            begin
                JobIndicatorsSetup.SetRange("Indicator  Code", "Job Indicator Code");
                if JobIndicatorsSetup.FindSet then
                    "Indicator Description" := JobIndicatorsSetup."Indicator Description";
            end;
        }
        field(4; "Indicator Description"; Text[100])
        {
        }
        field(5; Number; Integer)
        {
        }
        field(6; "Additional Comments"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Job Application No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobIndicatorsSetup: Record "Job Indicators Setup";
}

