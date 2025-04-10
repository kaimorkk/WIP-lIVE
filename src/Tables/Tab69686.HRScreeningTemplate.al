
table 69686 "HR Screening Template"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Template Type"; Option)
        {
            OptionCaption = 'Application Submission,Phone Pre-Screening Interview,Interview Scoresheet';
            OptionMembers = "Application Submission","Phone Pre-Screening Interview","Interview Scoresheet";
        }
        field(2; "Code"; Code[30])
        {
        }
        field(3; Description; Text[150])
        {
        }
        field(4; "Effective Date"; Date)
        {
        }
        field(5; "No. of Questions"; Integer)
        {
            CalcFormula = count("Hr Screening Template Line" where("Template ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6; "Total Weight"; Decimal)
        {
            CalcFormula = sum("Hr Screening Template Line".Weight where("Template ID" = field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; "Created By"; Code[30])
        {
        }
        field(8; "Created On"; Date)
        {
        }
        field(9; "Created Time"; Time)
        {
        }
        field(10; Blocked; Boolean)
        {
        }
        field(11; "No. Series"; Code[30])
        {
        }
        field(12; "Total Oral Weight"; Decimal)
        {
            CalcFormula = sum("Hr Screening Template Line".Weight where("Template ID" = field(Code), "Interview Area" = filter("Oral Interview")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(13; "Total Technical Weight"; Decimal)
        {
            CalcFormula = sum("Hr Screening Template Line".Weight where("Template ID" = field(Code), "Interview Area" = filter("Technical Interview")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Template Type", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get;
        if "Template Type" = "template type"::"Application Submission" then begin
            HRSetup.TestField("Applicant Template Nos.");
            if Code = '' then
                NoSeriesMgt.InitSeries(HRSetup."Applicant Template Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        if "Template Type" = "template type"::"Phone Pre-Screening Interview" then begin
            HRSetup.TestField("Phone Template Nos.");
            if Code = '' then
                NoSeriesMgt.InitSeries(HRSetup."Phone Template Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        if "Template Type" = "template type"::"Interview Scoresheet" then begin
            HRSetup.TestField("Scoresheet Template Nos.");
            if Code = '' then
                HRSetup.TestField("Scoresheet Template Nos.");
            NoSeriesMgt.InitSeries(HRSetup."Scoresheet Template Nos.", xRec."No. Series", 0D, Code, "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := Today;
        "Created Time" := Time;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

