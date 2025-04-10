
table 95218 "Audit Survey Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Pre-Audit Survey Invitation,Pre-Audit Survey Response,Post-Audit Survey Invitation,Post-Audit Survey Response';
            OptionMembers = " ","Pre-Audit Survey Invitation","Pre-Audit Survey Response","Post-Audit Survey Invitation","Post-Audit Survey Response";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            Editable = false;
        }
        field(4; "PreAudit Survey Invitation  No"; Code[20])
        {
            Description = 'Pre-Audit Survey Invitation No.';
            TableRelation = "Audit Survey Header"."Document No." where("Document Type" = filter("Pre-Audit Survey Invitation"));

            trigger OnValidate()
            begin
                AuditSurveyHeader.Reset;
                AuditSurveyHeader.SetRange(AuditSurveyHeader."Document No.", "PreAudit Survey Invitation  No");
                if AuditSurveyHeader.FindSet then begin
                    TransferFields(AuditSurveyHeader);
                    "Document No." := "Document No.";
                    "Document Type" := "Document Type";
                    if not Insert(true) then
                        Modify(true);
                end;
            end;
        }
        field(5; "PostAudit Survey Invitation No"; Code[20])
        {
            Description = 'Post-Audit Survey Invitation No.';
            TableRelation = "Audit Survey Header"."Document No." where("Document Type" = filter("Post-Audit Survey Invitation"));

            trigger OnValidate()
            begin
                AuditSurveyHeader.Reset;
                AuditSurveyHeader.SetRange(AuditSurveyHeader."Document No.", "PostAudit Survey Invitation No");
                if AuditSurveyHeader.FindSet then begin
                    TransferFields(AuditSurveyHeader);
                    "Document No." := "Document No.";
                    "Document Type" := "Document Type";
                    if not Insert(true) then
                        Modify(true);
                end;
            end;
        }
        field(6; "Engagement ID"; Code[20])
        {
            TableRelation = "Audit Project"."Engagement ID" where(Status = filter(<> Completed));

            trigger OnValidate()
            begin
                Description := Format("Document Type") + ' ' + "Engagement ID";


                AuditProject.Reset;
                AuditProject.SetRange(AuditProject."Engagement ID", "Engagement ID");
                if AuditProject.FindSet then begin
                    "Audit Plan ID" := AuditProject."Audit Plan ID";
                    "Audit  Work Type" := AuditProject."Audit  Work Type";
                    "Engagement Name" := AuditProject."Engagement Name";
                    "Engagement Category" := AuditProject."Engagement Category";
                    "Auditor Type" := AuditProject."Auditor Type";
                    "Auditee Type" := AuditProject."Auditee Type";
                    "Project ID" := AuditProject."Project ID";
                    "Primary Auditee ID" := AuditProject."Primary Auditee ID";
                    "Auditee Name" := AuditProject."Auditee Name";

                end;

                //Populate Required Documents
                AuditProjRequiredDocument.Reset;
                AuditProjRequiredDocument.SetRange(AuditProjRequiredDocument."Engagement ID", "Engagement ID");
                if AuditProjRequiredDocument.FindSet then begin
                    repeat
                        AuditACNRequiredDocument.Init;
                        AuditACNRequiredDocument."Document Type" := "Document Type";
                        AuditACNRequiredDocument."Document No." := "Document No.";
                        AuditACNRequiredDocument."Engagement ID" := "Engagement ID";
                        AuditACNRequiredDocument."Line No." := AuditACNRequiredDocument.Count + 1;
                        AuditACNRequiredDocument.Description := AuditProjRequiredDocument.Description;
                        AuditACNRequiredDocument."Audit Procedure ID" := AuditProjRequiredDocument."Audit Procedure ID";
                        AuditACNRequiredDocument."Preferred Format" := AuditProjRequiredDocument."Preferred Format";
                        AuditACNRequiredDocument."Requirement Type" := AuditProjRequiredDocument."Requirement Type";
                        AuditACNRequiredDocument."Date Requested" := AuditProjRequiredDocument."Date Requested";
                        AuditACNRequiredDocument."Submission Deadline" := AuditProjRequiredDocument."Submission Deadline";
                        if not AuditACNRequiredDocument.Insert(true) then
                            AuditACNRequiredDocument.Modify(true);
                    until AuditProjRequiredDocument.Next = 0;
                end;

                //Populate Sections
                AuditProjectSection.Reset;
                AuditProjectSection.SetRange(AuditProjectSection."Engagement ID", "Engagement ID");
                if AuditProjectSection.FindSet then begin
                    repeat
                        ObjAuditProjectSection.Init;
                        ObjAuditProjectSection.TransferFields(AuditProjectSection);
                        ObjAuditProjectSection."Engagement ID" := "Document No.";
                        if ObjAuditProjectSection.Insert(true) then
                            ObjAuditProjectSection.Modify(true);
                    until AuditProjectSection.Next = 0;
                end;


                //Populate Objectives
                AuditProjectObjective.Reset;
                AuditProjectObjective.SetRange(AuditProjectObjective."Engagement ID", "Engagement ID");
                if AuditProjectObjective.FindSet then begin
                    repeat
                        ObjAuditProjectObjective.Init;
                        ObjAuditProjectObjective.TransferFields(AuditProjectObjective);
                        AuditProjectObjective."Engagement ID" := "Document No.";
                        if ObjAuditProjectObjective.Insert(true) then
                            ObjAuditProjectObjective.Modify(true);
                    until AuditProjectObjective.Next = 0;
                end;
                //Populate Checlist
                AuditProjectChecklist.Reset;
                AuditProjectChecklist.SetRange(AuditProjectChecklist."Engagement ID", "Engagement ID");
                if AuditProjectChecklist.FindSet then begin
                    repeat
                        ObjAuditProjectChecklist.Init;
                        ObjAuditProjectChecklist.TransferFields(AuditProjectChecklist);
                        ObjAuditProjectChecklist."Engagement ID" := "Document No.";
                        if ObjAuditProjectChecklist.Insert(true) then
                            ObjAuditProjectChecklist.Modify(true);
                    until AuditProjectChecklist.Next = 0;
                end;
                //Populate Locations
                AuditProjectLocation.Reset;
                AuditProjectLocation.SetRange(AuditProjectLocation."Engagement ID", "Engagement ID");
                if AuditProjectLocation.FindSet then begin
                    repeat
                        ObjAuditProjectLocation.Init;
                        ObjAuditProjectLocation.TransferFields(AuditProjectLocation);
                        ObjAuditProjectLocation."Engagement ID" := "Document No.";
                        if ObjAuditProjectLocation.Insert(true) then
                            ObjAuditProjectLocation.Modify(true);
                    until AuditProjectLocation.Next = 0;
                end;
                //Populate Procedures
                AuditProjectProcedure.Reset;
                AuditProjectProcedure.SetRange(AuditProjectProcedure."Engagement ID", "Engagement ID");
                if AuditProjectProcedure.FindSet then begin
                    repeat
                        ObjAuditProjectProcedure.Init;
                        ObjAuditProjectProcedure.TransferFields(AuditProjectProcedure);
                        ObjAuditProjectProcedure."Engagement ID" := "Document No.";
                        if ObjAuditProjectProcedure.Insert(true) then
                            ObjAuditProjectProcedure.Modify(true);
                    until AuditProjectProcedure.Next = 0;
                end;
            end;
        }
        field(7; Description; Text[2048])
        {
        }
        field(8; "Audit Plan ID"; Code[20])
        {
            TableRelation = "Audit Plan"."Audit Plan ID" where(Blocked = filter(false));
        }
        field(9; "Audit  Work Type"; Code[20])
        {
            TableRelation = "Audit Work Type".Code where(Blocked = filter(false));
        }
        field(10; "Engagement Name"; Text[2048])
        {
            Editable = false;
        }
        field(11; "Engagement Category"; Option)
        {
            OptionCaption = ' ,New Audit,Work In Process,Audit Follow-up';
            OptionMembers = " ","New Audit","Work In Process","Audit Follow-up";
        }
        field(12; "Auditor Type"; Option)
        {
            OptionCaption = ' ,Internal Audit,External Audit';
            OptionMembers = " ","Internal Audit","External Audit";
        }
        field(13; "Audit Lead ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where("Engagement ID" = field("Engagement ID"),
                                                                       Blocked = filter(false));
        }
        field(14; "Auditee Type"; Option)
        {
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre";
        }
        field(15; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(16; "Primary Auditee ID"; Code[20])
        {
            TableRelation = if ("Auditee Type" = filter("Company-Level")) "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                                                            "Operating Unit Type" = filter(Board))
            else
            if ("Auditee Type" = filter(Board)) "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                                                                                                                                       "Operating Unit Type" = filter(Branch))
            else
            if ("Auditee Type" = filter(Region)) "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                                                                                                                                                                                                                   "Operating Unit Type" = filter(Region))
            else
            if ("Auditee Type" = filter(Directorate)) "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                                                                                                                                                                                                                                                                                                    "Operating Unit Type" = filter(Directorate))
            else
            if ("Auditee Type" = filter(Department)) "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                                                                                                                                                                                                                                                                                                                                                                                    "Operating Unit Type" = filter("Department/Center"))
            else
            if ("Auditee Type" = filter("Section/Team")) "Responsibility Center".Code where("Blocked?" = filter(false),
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        "Operating Unit Type" = filter("Division/Section"));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Primary Auditee ID") then begin
                    "Auditee Name" := ResponsibilityCenter.Name;
                end;
            end;
        }
        field(17; "Auditee Name"; Text[100])
        {
            Editable = false;
        }
        field(18; "Auditee Lead ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where("Audit Team Type" = filter("Auditee Team"),
                                                                       Blocked = filter(false));
        }
        field(19; "Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(20; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(21; "Dimension Set ID"; Integer)
        {
        }
        field(22; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(23; Posted; Boolean)
        {
            Editable = false;
        }
        field(24; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(25; "Created DateTime"; DateTime)
        {
            Editable = false;
        }
        field(26; "No. Series"; Code[20])
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
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        Status := Status::Open;


        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Pre-Audit Survey Invitation" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Commencement Notice Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Commencement Notice Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Post-Audit Survey Invitation" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Commencement Notice Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Commencement Notice Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Pre-Audit Survey Invitation" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Commencement Notice Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Commencement Notice Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Pre-Audit Survey Response" then begin
                AuditAssuranceSetup.Get;
                AuditAssuranceSetup.TestField("Audit Commencement Notice Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Commencement Notice Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;
    end;

    var
        AuditSurveyHeader: Record "Audit Survey Header";
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

