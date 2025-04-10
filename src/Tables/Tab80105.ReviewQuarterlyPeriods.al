
table 80105 "Review Quarterly Periods"
{
    DrillDownPageID = "Quarterly Reporting Periods";
    LookupPageID = "Quarterly Reporting Periods";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
            TableRelation = "Quarterly Reporting Periods".Code where("Year Code" = field("Year Code"));

            trigger OnValidate()
            begin
                QuarterlyReportingPeriods.Reset;
                QuarterlyReportingPeriods.SetRange(Code, Code);
                if QuarterlyReportingPeriods.Find('-') then begin
                    Description := QuarterlyReportingPeriods.Description;
                    "Reporting Start Date" := QuarterlyReportingPeriods."Reporting Start Date";
                    "Reporting End Date" := QuarterlyReportingPeriods."Reporting End Date";
                    "Current Year?" := QuarterlyReportingPeriods."Current Year?";
                end;
            end;
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
        field(7; "Review Period Code"; Code[50])
        {
            TableRelation = "Review Periods";
        }
    }

    keys
    {
        key(Key1; "Code", "Year Code", "Review Period Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        QuarterlyReportingPeriods: Record "Quarterly Reporting Periods";
}

