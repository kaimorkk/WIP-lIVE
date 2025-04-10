
table 56905 "Applications Accomplishments"
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
                /*JobIndicatorsSetup.SETRANGE("Indicator  Code","Job Indicator Code");
                IF JobIndicatorsSetup.FINDSET THEN
                  "Indicator Description":=JobIndicatorsSetup."Indicator Description";*/

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
        field(7; "Job ID"; Text[30])
        {
        }
        field(8; Amount; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Job Application No", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

