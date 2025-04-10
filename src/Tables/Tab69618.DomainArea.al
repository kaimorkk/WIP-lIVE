
table 69618 "Domain Area"
{
    DrillDownPageID = "Domain Area";
    LookupPageID = "Domain Area";

    fields
    {
        field(1; "Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Description; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Qualified Active Empl"; Integer)
        {
            Caption = 'No. of Qualified Active Employees';
            DataClassification = ToBeClassified;
        }
        field(5; "Qualified Job Applicants"; Integer)
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

