
table 95209 "Audit Mobilization Header1"
{

    fields
    {
        field(1; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitations,Pre-Audit Survey Responses';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitations","Pre-Audit Survey Responses";
        }
        field(2; "Document No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4; "Audit Commencement Notice No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Mobilization Header1"."Document No." where("Document Type" = filter("Audit Commencement Notice"));
        }
        field(5; "Auditee Notice Response No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Mobilization Header1"."Document No." where("Document Type" = filter("Auditee Notice Response"));
        }
        field(6; "Entrace Meeting No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Mobilization Header1"."Document No." where("Document Type" = filter("Audit Entrace Meeting"));
        }
        field(7; "Engagement ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project"."Engagement ID" where(Status = filter(<> Completed));

            trigger OnValidate()
            begin
                Description := Format("Document Type") + '-' + "Engagement ID";


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
                        ObjAuditProjectObjective."Engagement ID" := "Document No.";
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
        field(8; Description; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Audit Plan ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Plan"."Audit Plan ID" where(Blocked = filter(false));
        }
        field(10; "Audit  Work Type"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Work Type".Code where(Blocked = filter(false));
        }
        field(11; "Engagement Name"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "Engagement Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,New Audit,Work In Process,Audit Follow-up';
            OptionMembers = " ","New Audit","Work In Process","Audit Follow-up";
        }
        field(13; "Auditor Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Internal Audit,External Audit';
            OptionMembers = ,"Internal Audit","External Audit";
        }
        field(14; "Audit Lead ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where("Engagement ID" = field("Engagement ID"),
                                                                       "Audit Team Type" = filter("Auditor Team"),
                                                                       Blocked = filter(false));
        }
        field(15; "Auditee Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre ';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre ";
        }
        field(16; "Project ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(17; "Primary Auditee ID"; Code[20])
        {
            DataClassification = ToBeClassified;
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
        field(18; "Auditee Name"; Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19; "Auditee Lead ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Audit Project Team"."Resource No." where("Audit Team Type" = filter("Auditee Team"),
                                                                       Blocked = filter(false),
                                                                       "Engagement ID" = field("Engagement ID"));
        }
        field(20; "Global Dimension 1 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(21; "Global Dimension 2 Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(22; "Dimension Set ID"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(24; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25; "Created By"; Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26; "Created DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27; "Entrance Meeting Venue"; Text[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Entrance Meeting Venue';
        }
        field(28; "Entrance Meeting Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Entrance Meeting Start Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Entrance Meeting End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Entrance Meeting End Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(32; Duration; Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Meeting Medium"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Face to Face,Online';
            OptionMembers = " ","Face to Face",Online;
        }
        field(34; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(35; "Planned Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Planned End Date"; Date)
        {
            DataClassification = ToBeClassified;
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
            if "Document Type" = "document type"::"Audit Commencement Notice" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Audit Commencement Notice Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Commencement Notice Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Audit Entrace Meeting" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Audit Entrace Meeting Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Entrace Meeting Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;


        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Auditee Notice Response" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Auditee Notice Response Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Auditee Notice Response Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Pre-Audit Survey Responses" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("PreAudit Survey Response Nos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."PreAudit Survey Response Nos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;


        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Pre-Audit Survey Invitations" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("PreAudit Survey InvitationNos.");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."PreAudit Survey InvitationNos.", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;
    end;

    var
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

