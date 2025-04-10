
table 69701 "PreScreen Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Editable = false;
            OptionCaption = 'Ability Test Invitation,Phone Interview Report';
            OptionMembers = "Ability Test Invitation","Phone Interview Report";
        }
        field(2; "Document No."; Code[30])
        {
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            Editable = false;
        }
        field(4; "Vacancy ID"; Code[30])
        {
            TableRelation = "Recruitment Requisition Header" where("Document Type" = filter("Job Vacancy"));

            trigger OnValidate()
            begin
                RequisitionHeader.Reset;
                RequisitionHeader.SetRange("Document No.", "Vacancy ID");
                if RequisitionHeader.FindFirst then begin
                    "Position ID" := RequisitionHeader."Position ID";
                    "Job Title/Designation" := RequisitionHeader."Job Title/Designation";
                    "No. of Openings" := RequisitionHeader."No of Openings";
                    Directorate := RequisitionHeader.Directorate;
                    Department := RequisitionHeader.Department;
                    "Region ID" := RequisitionHeader.Region;
                end
            end;
        }
        field(5; "Lead HR Officer"; Code[30])
        {
            TableRelation = "HR Officers";
        }
        field(6; Description; Text[250])
        {
        }
        field(7; "Ability Test ID"; Code[30])
        {
            TableRelation = "Ability Test";
        }
        field(8; "Maximum Test Duration(Min)"; Integer)
        {
        }
        field(9; "Phone Interview Template ID"; Code[30])
        {
            TableRelation = "Pre-Screen Template" where("Pre-Screening Stage" = filter("Interview-Invitation"));
        }
        field(10; "Position ID"; Code[30])
        {
            Editable = false;
        }
        field(11; "Job Title/Designation"; Text[150])
        {
            Editable = false;
        }
        field(12; "No. of Openings"; Integer)
        {
            Editable = false;
        }
        field(13; Directorate; Code[30])
        {
            Editable = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(14; Department; Code[30])
        {
            Editable = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(15; "Region ID"; Code[30])
        {
            Editable = false;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Region));
        }
        field(16; "Planned Start Date"; Date)
        {
        }
        field(17; "Planned End Date"; Date)
        {
        }
        field(18; "Document Status"; Option)
        {
            OptionCaption = 'Active,Cancelled';
            OptionMembers = Active,Cancelled;
        }
        field(19; "Created By"; Code[30])
        {
            Editable = false;
        }
        field(20; "Created On"; DateTime)
        {
            Editable = false;
        }
        field(21; Posted; Boolean)
        {
            Editable = false;
        }
        field(22; "No. Series"; Code[10])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HRSetup.Get();
        if ("Document Type" = "document type"::"Phone Interview Report") then begin
            HRSetup.TestField("Phone Interview Report Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Phone Interview Report Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        if ("Document Type" = "document type"::"Ability Test Invitation") then begin
            HRSetup.TestField("Ability Test Invitation Nos.");
            if "Document No." = '' then
                NoSeriesMgt.InitSeries(HRSetup."Ability Test Invitation Nos.", xRec."No. Series", 0D, "Document No.", "No. Series");
        end;
        "Created By" := UserId;
        "Created On" := CurrentDatetime;
        "Document Date" := Today;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRSetup: Record "Human Resources Setup";
        RequisitionHeader: Record "Recruitment Requisition Header";
}

