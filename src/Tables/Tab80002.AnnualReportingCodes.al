table 80002 "Annual Reporting Codes"
{
    DrillDownPageID = "Annual Reporting Codes";
    LookupPageID = "Annual Reporting Codes";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[100])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Reporting Start Date"; Date)
        {
        }
        field(4; "Reporting End Date"; Date)
        {
        }
        field(5; "Current Year"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Current Year" then begin
                    AnnualReportingCodes.Reset();
                    AnnualReportingCodes.SetRange("Current Year", true);
                    AnnualReportingCodes.SetFilter(Code, '<>%1', Rec.Code);
                    if AnnualReportingCodes.FindFirst() then
                        Error('Kindly uncheck the existing  year, we can only have one current year at a time!');
                end;
            end;
        }
        field(6; "Annual Procurement Plan"; Code[20])
        {
            // TableRelation = "Procurement Header".No where(Status = const(Approved));
        }
        field(7; "Previous Year"; Boolean)
        {
            trigger OnValidate()
            begin
                if "Previous Year" then begin
                    AnnualReportingCodes.Reset();
                    AnnualReportingCodes.SetRange("Previous Year", true);
                    AnnualReportingCodes.SetFilter(Code, '<>%1', Rec.Code);
                    if AnnualReportingCodes.FindFirst() then
                        Error('Kindly uncheck the existing previous year, We can only have one previous year at a time!');
                end;
            end;
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

    var
        AnnualReportingCodes: Record "Annual Reporting Codes";
}

