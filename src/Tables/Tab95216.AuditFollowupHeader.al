
table 95216 "Audit Followup Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Implementation Status Report,Followup Audit Voucher';
            OptionMembers = " ","Implementation Status Report","Followup Audit Voucher";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            Editable = false;
        }
        field(4; "Primary RC ID"; Code[20])
        {
            Description = 'Primary Responsibility Center ID';
            TableRelation = "Responsibility Center".Code where("Blocked?" = filter(false));

            trigger OnValidate()
            begin
                Description := Format("Document Type") + '-' + "Primary RC ID";
            end;
        }
        field(5; "Reporting As At"; Date)
        {
        }
        field(6; Description; Text[2048])
        {
        }
        field(7; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(8; Posted; Boolean)
        {
            Editable = false;
        }
        field(9; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(10; "Created DateTime"; DateTime)
        {
            Editable = false;
        }
        field(11; "No. Series"; Code[20])
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
        "Document Date" := Today;
        Status := Status::Open;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Implementation Status Report" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Implementation Log Nos");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Implementation Log Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Followup Audit Voucher" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Follow-up Audit Voucher  Nos");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Follow-up Audit Voucher  Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;
    end;

    var
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditMobilizationHeader: Record "Audit Mobilization Header1";
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        AuditProject: Record "Audit Project";
        ResponsibilityCenter: Record "Responsibility Center";
        AuditACNRequiredDocument: Record "Audit ACN Required Document";
        AuditProjRequiredDocument: Record "Audit Proj Required Document";
        AuditProjectSection: Record "Audit Project Section";
        ObjAuditProjectSection: Record "Audit Project Section";
        AuditProjectObjective: Record "Audit Project Objective";
        ObjAuditProjectObjective: Record "Audit Project Objective";
        AuditProjectChecklist: Record "Audit Project Checklist";
        ObjAuditProjectChecklist: Record "Audit Project Checklist";
        AuditProjectProcedure: Record "Audit Project Procedure";
        ObjAuditProjectProcedure: Record "Audit Project Procedure";
        AuditProjectLocation: Record "Audit ProjectLocation";
        ObjAuditProjectLocation: Record "Audit ProjectLocation";
}

