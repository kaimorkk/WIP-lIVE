
table 95217 "Audit Execution Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            Editable = false;
            OptionCaption = ' ,Audit Fieldwork Voucher,Audit Exit Conference,Draft Audit Report,Final Audit Report';
            OptionMembers = " ","Audit Fieldwork Voucher","Audit Exit Conference","Draft Audit Report","Final Audit Report";
        }
        field(2; "Document No."; Code[20])
        {
            Editable = false;
        }
        field(3; "Document Date"; Date)
        {
            Editable = false;
        }
        field(4; "Audit Commencement Notice No."; Code[20])
        {
            TableRelation = "Audit Mobilization Header1"."Document No." where("Document Type" = filter("Audit Commencement Notice"));

            trigger OnValidate()
            begin
                AuditMobilizationHeader.Reset;
                AuditMobilizationHeader.SetRange(AuditMobilizationHeader."Document No.", "Audit Commencement Notice No.");
                if AuditMobilizationHeader.FindSet then begin
                    "Engagement ID" := AuditMobilizationHeader."Engagement ID";
                    Validate("Engagement ID");
                    "Audit Plan ID" := AuditMobilizationHeader."Audit Plan ID";
                    "Audit  Work Type" := AuditMobilizationHeader."Audit  Work Type";
                    "Engagement Name" := AuditMobilizationHeader."Engagement Name";
                    "Engagement Category" := AuditMobilizationHeader."Engagement Category";
                    "Auditor Type" := AuditMobilizationHeader."Auditor Type";
                    "Audit Lead ID" := AuditMobilizationHeader."Audit Lead ID";
                    "Auditee Type" := AuditMobilizationHeader."Auditee Type";
                    "Project ID" := AuditMobilizationHeader."Project ID";
                    "Primary Auditee ID" := AuditMobilizationHeader."Primary Auditee ID";
                    "Auditee Name" := AuditMobilizationHeader."Auditee Name";
                    "Audit Lead ID" := AuditMobilizationHeader."Audit Lead ID";
                end;
            end;
        }
        field(5; "Engagement ID"; Code[20])
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
                // AuditProjRequiredDocument.RESET;
                // AuditProjRequiredDocument.SETRANGE(AuditProjRequiredDocument."Engagement ID","Engagement ID");
                // IF AuditProjRequiredDocument.FINDSET THEN BEGIN
                //  REPEAT
                //    AuditACNRequiredDocument.INIT;
                //    AuditACNRequiredDocument."Document Type":="Document Type";
                //    AuditACNRequiredDocument."Document No.":="Document No.";
                //    AuditACNRequiredDocument."Engagement ID":="Engagement ID";
                //    AuditACNRequiredDocument."Line No.":=AuditACNRequiredDocument.COUNT+1;
                //    AuditACNRequiredDocument.Description:=AuditProjRequiredDocument.Description;
                //    AuditACNRequiredDocument."Audit Procedure ID":=AuditProjRequiredDocument."Audit Procedure ID";
                //    AuditACNRequiredDocument."Preferred Format":=AuditProjRequiredDocument."Preferred Format";
                //    AuditACNRequiredDocument."Requirement Type":=AuditProjRequiredDocument."Requirement Type";
                //    AuditACNRequiredDocument."Date Requested":=AuditProjRequiredDocument."Date Requested";
                //    AuditACNRequiredDocument."Submission Deadline":=AuditProjRequiredDocument."Submission Deadline";
                //    IF NOT AuditACNRequiredDocument.INSERT(TRUE) THEN
                //      AuditACNRequiredDocument.MODIFY(TRUE);
                //  UNTIL AuditProjRequiredDocument.NEXT=0;
                //  END;

                //Populate Sections
                // AuditProjectSection.RESET;
                // AuditProjectSection.SETRANGE(AuditProjectSection."Engagement ID","Engagement ID");
                // IF AuditProjectSection.FINDSET THEN BEGIN
                //    REPEAT
                //      ObjAuditProjectSection.INIT;
                //      ObjAuditProjectSection.TRANSFERFIELDS(AuditProjectSection);
                //      ObjAuditProjectSection."Engagement ID":="Document No.";
                //      IF ObjAuditProjectSection.INSERT(TRUE) THEN
                //        ObjAuditProjectSection.MODIFY(TRUE);
                //     UNTIL AuditProjectSection.NEXT=0;
                //  END;


                // //Populate Objectives
                // AuditProjectObjective.RESET;
                // AuditProjectObjective.SETRANGE(AuditProjectObjective."Engagement ID","Engagement ID");
                // IF AuditProjectObjective.FINDSET THEN BEGIN
                //    REPEAT
                //      ObjAuditProjectObjective.INIT;
                //      ObjAuditProjectObjective.TRANSFERFIELDS(AuditProjectObjective);
                //      AuditProjectObjective."Engagement ID":="Document No.";
                //      IF ObjAuditProjectObjective.INSERT(TRUE) THEN
                //        ObjAuditProjectObjective.MODIFY(TRUE);
                //     UNTIL AuditProjectObjective.NEXT=0;
                //  END;
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
                // //Populate Locations
                // AuditProjectLocation.RESET;
                // AuditProjectLocation.SETRANGE(AuditProjectLocation."Engagement ID","Engagement ID");
                // IF AuditProjectLocation.FINDSET THEN BEGIN
                //    REPEAT
                //      ObjAuditProjectLocation.INIT;
                //      ObjAuditProjectLocation.TRANSFERFIELDS(AuditProjectLocation);
                //      ObjAuditProjectLocation."Engagement ID":="Document No.";
                //      IF ObjAuditProjectLocation.INSERT(TRUE) THEN
                //        ObjAuditProjectLocation.MODIFY(TRUE);
                //     UNTIL AuditProjectLocation.NEXT=0;
                //  END;
                // //Populate Procedures
                // AuditProjectProcedure.RESET;
                // AuditProjectProcedure.SETRANGE(AuditProjectProcedure."Engagement ID","Engagement ID");
                // IF AuditProjectProcedure.FINDSET THEN BEGIN
                //    REPEAT
                //      ObjAuditProjectProcedure.INIT;
                //      ObjAuditProjectProcedure.TRANSFERFIELDS(AuditProjectProcedure);
                //      ObjAuditProjectProcedure."Engagement ID":="Document No.";
                //      IF ObjAuditProjectProcedure.INSERT(TRUE) THEN
                //        ObjAuditProjectProcedure.MODIFY(TRUE);
                //     UNTIL AuditProjectProcedure.NEXT=0;
                //  END;
            end;
        }
        field(6; Description; Text[2048])
        {
        }
        field(7; "Audit Plan ID"; Code[20])
        {
            TableRelation = "Audit Plan"."Audit Plan ID" where(Blocked = filter(false));
        }
        field(8; "Audit  Work Type"; Code[20])
        {
            TableRelation = "Audit Work Type".Code where(Blocked = filter(false));
        }
        field(9; "Engagement Name"; Text[2048])
        {
            Editable = false;
        }
        field(10; "Engagement Category"; Option)
        {
            OptionCaption = ' ,New Audit,Work In Process,Audit Follow-up';
            OptionMembers = " ","New Audit","Work In Process","Audit Follow-up";
        }
        field(11; "Auditor Type"; Option)
        {
            OptionCaption = ' ,Internal Audit,External Audit';
            OptionMembers = " ","Internal Audit","External Audit";
        }
        field(12; "Audit Lead ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where("Audit Team Type" = filter("Auditor Team"),
                                                                       Blocked = filter(false),
                                                                       "Engagement ID" = field("Engagement ID"));
        }
        field(13; "Auditee Type"; Option)
        {
            OptionCaption = ' ,Board,Company-Level,Directorate,Department,Section/Team,Region,Branch/Centre';
            OptionMembers = " ",Board,"Company-Level",Directorate,Department,"Section/Team",Region,"Branch/Centre";
        }
        field(14; "Project ID"; Code[20])
        {
            TableRelation = Job."No.";
        }
        field(15; "Primary Auditee ID"; Code[20])
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
        field(16; "Auditee Name"; Text[100])
        {
            Editable = false;
        }
        field(17; "Auditee Lead ID"; Code[20])
        {
            TableRelation = "Audit Project Team"."Resource No." where("Audit Team Type" = filter("Auditee Team"),
                                                                       Blocked = filter(false),
                                                                       "Engagement ID" = field("Engagement ID"));
        }
        field(18; "Global Dimension 1 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(1));
        }
        field(19; "Global Dimension 2 Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = filter(2));
        }
        field(20; "Dimension Set ID"; Integer)
        {
        }
        field(21; Status; Option)
        {
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released';
            OptionMembers = " ",Open,"Pending Approval",Released;
        }
        field(22; Posted; Boolean)
        {
        }
        field(23; "Created By"; Code[50])
        {
            Editable = false;
        }
        field(24; "Created DateTime"; DateTime)
        {
            Editable = false;
        }
        field(25; "Meeting Venue"; Code[100])
        {
            Description = 'Entrance Meeting Venue/Location';
        }
        field(26; "Meeting Start Date"; Date)
        {
        }
        field(27; "Meeting Start Time"; Time)
        {
        }
        field(28; "Meeting End Date"; Date)
        {
        }
        field(29; "Meeting End Time"; Time)
        {
        }
        field(30; Duration; Duration)
        {
        }
        field(31; "Meeting Medium"; Option)
        {
            OptionCaption = ' ,Face to Face,Online';
            OptionMembers = " ","Face to Face",Online;
        }
        field(32; "No. Series"; Code[20])
        {
        }
        field(33; Closed; Boolean)
        {
            Editable = false;
        }
        field(34; "Closed By"; Code[100])
        {
            Editable = false;
        }
        field(35; "Closed DateTime"; DateTime)
        {
            Editable = false;
        }
        field(36; "Draft Audit Report ID"; Code[20])
        {
            TableRelation = "Audit Execution Header"."Document No." where("Document Type" = filter("Draft Audit Report"));

            trigger OnValidate()
            begin
                //Transfer Header
                AuditExecutionHeader.Reset;
                AuditExecutionHeader.SetRange(AuditExecutionHeader."Document No.", "Draft Audit Report ID");
                if AuditExecutionHeader.FindSet then begin
                    Init;
                    TransferFields(AuditExecutionHeader);
                    "Document Type" := "Document Type";
                    "Document No." := "Document No.";
                    if not Insert(true) then
                        Modify;
                end;


                //Transfer Lines..Audit Execution Checklist and change document type and Document No. to the header values
                AuditExecutionChecklist.Reset;
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Document No.", "Draft Audit Report ID");
                AuditExecutionChecklist.SetRange(AuditExecutionChecklist."Document Type", AuditExecutionChecklist."document type"::"Draft Audit Report");
                if AuditExecutionChecklist.FindSet then begin
                    repeat
                        ObjAuditExecutionChecklist.Init;
                        ObjAuditExecutionChecklist.TransferFields(AuditExecutionChecklist);
                        AuditExecutionChecklist."Document Type" := "Document Type";
                        AuditExecutionChecklist."Document No." := "Document No.";
                        if not AuditExecutionChecklist.Insert(true) then
                            AuditExecutionChecklist.Modify(true);
                    until AuditExecutionChecklist.Next = 0;
                end;
            end;
        }
        field(37; "No. Of Findings"; Integer)
        {
            CalcFormula = count("Audit Execution Finding" where("Document Type" = field("Document Type"),
                                                                 "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(38; "No. of Audit Recommendations"; Integer)
        {
            CalcFormula = count("Audit Finding Recommendation" where("Document Type" = field("Document Type"),
                                                                      "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(39; "No. of Filed Audit Wor  Papers"; Integer)
        {
            CalcFormula = count("Filed Audit Working Paper" where("Engagement ID" = field("Engagement ID")));
            Description = 'No. of Filed Audit Working Papers';
            Editable = false;
            FieldClass = FlowField;
        }
        field(40; "Management Comment Deadline"; Date)
        {
        }
        field(41; "No. of Non-Compliant Findings"; Integer)
        {
            CalcFormula = count("Audit Execution Finding" where("Document Type" = field("Document Type"),
                                                                 "Document No." = field("Document No."),
                                                                 "Compliance Status" = filter("Non-Compliant")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(42; "No. of Partially Comp Findings"; Integer)
        {
            CalcFormula = count("Audit Execution Finding" where("Document Type" = field("Document Type"),
                                                                 "Document No." = field("Document No."),
                                                                 "Compliance Status" = filter("Partially Compliant")));
            Description = 'No. of Partially Comp Findings';
            Editable = false;
            FieldClass = FlowField;
        }
        field(43; "No. Of Subs. Compliant Finding"; Integer)
        {
            CalcFormula = count("Audit Execution Finding" where("Document Type" = field("Document Type"),
                                                                 "Document No." = field("Document No."),
                                                                 "Compliance Status" = filter("Substantially Compliant")));
            Description = 'No. of Substantially Compliant Findings';
            Editable = false;
            FieldClass = FlowField;
        }
        field(44; "No of Fully Compliant Findings"; Integer)
        {
            CalcFormula = count("Audit Execution Finding" where("Document Type" = field("Document Type"),
                                                                 "Document No." = field("Document No."),
                                                                 "Compliance Status" = filter("Fully Compliant")));
            Description = 'No of Fully Compliant Findings';
            Editable = false;
            FieldClass = FlowField;
        }
        field(45; "No. of Management Comments"; Integer)
        {
            CalcFormula = count("Audit Management Comment" where("Document Type" = field("Document Type"),
                                                                  "Document No." = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(46; "Overall Audit Opinion Type"; Code[20])
        {
            TableRelation = "Audit Opinion Type".Code where(Blocked = filter(false));
        }
        field(47; "Summarized Auditor Statement"; Text[2048])
        {
        }
        field(48; "Overall Audit Assurance Level"; Code[20])
        {
            TableRelation = "Audit Assurance Level".Code where(Blocked = filter(false));
        }
        field(49; "No Of Audit Implement Logs"; Integer)
        {
            CalcFormula = count("Audit Followup Header" where("Document Type" = filter("Implementation Status Report"),
                                                               "Primary RC ID" = field("Document No.")));
            Description = 'No. of Audit Implementation Logs';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50; "No. of Followup Audits"; Integer)
        {
            CalcFormula = count("Audit Followup Header" where("Document Type" = filter("Followup Audit Voucher"),
                                                               "Primary RC ID" = field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(51; Published; Boolean)
        {
        }
        field(52; "General Details"; Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(53; "Executive Summary"; Text[2048])
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
        Status := Status::Open;
        "Created By" := UserId;
        "Created DateTime" := CreateDatetime(Today, Time);
        "Document Date" := Today;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Audit Fieldwork Voucher" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Fieldwork Voucher Nos");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Fieldwork Voucher Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Audit Exit Conference" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Audit Exit Conference Nos");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Audit Exit Conference Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;


        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Draft Audit Report" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Draft AUidt Report Nos");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Draft AUidt Report Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;

        if "Document No." = '' then begin
            if "Document Type" = "document type"::"Final Audit Report" then begin
                AuditAssuranceSetup.Get();
                AuditAssuranceSetup.TestField("Final Audit Report Nos");
                NoSeriesManagement.InitSeries(AuditAssuranceSetup."Final Audit Report Nos", xRec."No. Series", Today, "Document No.", "No. Series");
            end;
        end;
    end;

    var
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
        AuditExecutionHeader: Record "Audit Execution Header";
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        ObjAuditExecutionChecklist: Record "Audit Execution Checklist";
}

