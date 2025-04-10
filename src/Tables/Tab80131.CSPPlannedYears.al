
table 80131 "CSP Planned Years"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "CSP Code"; Code[30])
        {
        }
        field(2; "Annual Year Code"; Code[50])
        {
            Caption = 'Code';
            TableRelation = "Annual Reporting Codes".Code;
            trigger onValidate()
            var
                AnnualReportDates: Record "Annual Reporting Codes";
            begin
                if AnnualReportDates.Get("Annual Year Code") then begin
                    Description := AnnualReportDates.Description;
                    "Start Date" := AnnualReportDates."Reporting Start Date";
                    "End Date" := AnnualReportDates."Reporting End Date";
                end;
            end;
        }
        field(3; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "Description"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6; "Budget Code"; Code[50])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(7; "Current"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                CSPYears: Record "CSP Planned Years";
            begin
                Testfield("Budget Code");
                CSPYears.Reset();
                CSPYears.Setrange("CSP Code", Rec."CSP Code");
                CSPYears.SetRange(Current, true);
                CSPYears.SetFilter("Annual Year Code", '<>%1', Rec."Annual Year Code");
                if CSPYears.FindFirst() then
                    Error('There can only be one active reporting year at a time.');
            end;
        }
    }

    keys
    {
        key(Key1; "CSP Code", "Annual Year Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Annual Year Code", Description, "Start Date", "End Date")
        {
        }
    }
}

