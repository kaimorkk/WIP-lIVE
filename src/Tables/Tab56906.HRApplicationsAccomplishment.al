
table 56906 "HR Applications Accomplishment"
{

    fields
    {
        field(1; "Code"; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Job Application No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Job Applications"."Application No";
        }
        field(3; "Job Indicator Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Indicators Setup"."Indicator  Code";

            trigger OnValidate()
            begin
                /*JobIndicatorsSetup.SETRANGE("Indicator  Code","Job Indicator Code");
                IF JobIndicatorsSetup.FINDSET THEN
                  "Indicator Description":=JobIndicatorsSetup."Indicator Description";*/

            end;
        }
        field(4; "Indicator Description"; Text[500])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Number; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Additional Comments"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Job ID"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Employee No"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Id Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Amount; Text[50])
        {
            DataClassification = ToBeClassified;
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

