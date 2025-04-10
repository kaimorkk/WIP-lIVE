
table 69103 "Manpower Plan Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[30])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Start Date"; Date)
        {
        }
        field(4; "End Date"; Date)
        {
        }
        field(5; Global; Boolean)
        {
        }
        field(6; "Department Code"; Code[30])
        {
            TableRelation = "Responsibility Center";
        }
        field(7; "Department  Name"; Text[100])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Department Code")));
            FieldClass = FlowField;
        }
        field(8; "Year Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes".Code;

            trigger OnValidate()
            begin
                if AnnualReportingCodes.Get("Year Code") then
                    "Start Date" := AnnualReportingCodes."Reporting Start Date";
                "End Date" := AnnualReportingCodes."Reporting End Date";
            end;
        }
        field(9; "Approved Status"; Option)
        {
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(10; "Created By"; Code[30])
        {
        }
        field(11; "Created On"; Date)
        {
        }
        field(12; "Corporate Strategic Plan Code"; Code[30])
        {
        }
        field(13; "No. Series"; Code[30])
        {
        }
        field(14; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        // GENERATE DOCUMENT NUMBER
        if No = '' then begin
            HRSetup.Get;
            HRSetup.TestField(HRSetup."Manpower Planning Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Manpower Planning Nos.", xRec."No. Series", 0D, No, "No. Series");
        end;

        "Created By" := UserId;
        "Created On" := Today;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        userSetup: Record "User Setup";
        AnnualReportingCodes: Record "Annual Reporting Codes";
}

