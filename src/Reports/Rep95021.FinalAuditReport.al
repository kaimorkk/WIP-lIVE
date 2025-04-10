report 95021 "Final Audit Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Final Audit Report.rdlc';

    dataset
    {
        dataitem("Audit Execution Header"; "Audit Execution Header")
        {
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
            column(Header; leadname)
            {
            }
            column(DocumentType_AuditExecutionHeader; "Audit Execution Header"."Document Type")
            {
            }
            column(DocumentNo_AuditExecutionHeader; "Audit Execution Header"."Document No.")
            {
            }
            column(DocumentDate_AuditExecutionHeader; "Audit Execution Header"."Document Date")
            {
            }
            column(AuditCommencementNoticeNo_AuditExecutionHeader; "Audit Execution Header"."Audit Commencement Notice No.")
            {
            }
            column(EngagementID_AuditExecutionHeader; "Audit Execution Header"."Engagement ID")
            {
            }
            column(Description_AuditExecutionHeader; "Audit Execution Header".Description)
            {
            }
            column(AuditPlanID_AuditExecutionHeader; "Audit Execution Header"."Audit Plan ID")
            {
            }
            column(AuditWorkType_AuditExecutionHeader; "Audit Execution Header"."Audit  Work Type")
            {
            }
            column(EngagementName_AuditExecutionHeader; "Audit Execution Header"."Engagement Name")
            {
            }
            column(EngagementCategory_AuditExecutionHeader; "Audit Execution Header"."Engagement Category")
            {
            }
            column(AuditorType_AuditExecutionHeader; "Audit Execution Header"."Auditor Type")
            {
            }
            column(AuditLeadID_AuditExecutionHeader; "Audit Execution Header"."Audit Lead ID")
            {
            }
            column(AuditeeType_AuditExecutionHeader; "Audit Execution Header"."Auditee Type")
            {
            }
            column(ProjectID_AuditExecutionHeader; "Audit Execution Header"."Project ID")
            {
            }
            column(PrimaryAuditeeID_AuditExecutionHeader; "Audit Execution Header"."Primary Auditee ID")
            {
            }
            column(AuditeeName_AuditExecutionHeader; "Audit Execution Header"."Auditee Name")
            {
            }
            column(AuditeeLeadID_AuditExecutionHeader; "Audit Execution Header"."Auditee Lead ID")
            {
            }
            column(GlobalDimension1Code_AuditExecutionHeader; "Audit Execution Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AuditExecutionHeader; "Audit Execution Header"."Global Dimension 2 Code")
            {
            }
            column(DimensionSetID_AuditExecutionHeader; "Audit Execution Header"."Dimension Set ID")
            {
            }
            column(Status_AuditExecutionHeader; "Audit Execution Header".Status)
            {
            }
            column(Posted_AuditExecutionHeader; "Audit Execution Header".Posted)
            {
            }
            column(CreatedBy_AuditExecutionHeader; "Audit Execution Header"."Created By")
            {
            }
            column(CreatedDateTime_AuditExecutionHeader; "Audit Execution Header"."Created DateTime")
            {
            }
            column(EntranceMeetingVenue_AuditExecutionHeader; "Audit Execution Header"."Meeting Venue")
            {
            }
            column(EntranceMeetingStartDate_AuditExecutionHeader; "Audit Execution Header"."Meeting Start Date")
            {
            }
            column(EntranceMeetingStartTime_AuditExecutionHeader; "Audit Execution Header"."Meeting Start Time")
            {
            }
            column(EntranceMeetingEndDate_AuditExecutionHeader; "Audit Execution Header"."Meeting End Date")
            {
            }
            column(EntranceMeetingEndTime_AuditExecutionHeader; "Audit Execution Header"."Meeting End Time")
            {
            }
            column(Duration_AuditExecutionHeader; "Audit Execution Header".Duration)
            {
            }
            column(MeetingMedium_AuditExecutionHeader; "Audit Execution Header"."Meeting Medium")
            {
            }
            column(NoSeries_AuditExecutionHeader; "Audit Execution Header"."No. Series")
            {
            }
            dataitem("Audit Execution"; "Audit Execution Finding")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Engagement ID" = field("Engagement ID");
                column(DocumentType_AuditExecution; "Audit Execution"."Document Type")
                {
                }
                column(DocumentNo_AuditExecution; "Audit Execution"."Document No.")
                {
                }
                column(EngagementID_AuditExecution; "Audit Execution"."Engagement ID")
                {
                }
                column(ChecklistID_AuditExecution; "Audit Execution"."Checklist ID")
                {
                }
                column(FindingID_AuditExecution; "Audit Execution"."Finding ID")
                {
                }
                column(Description_AuditExecution; "Audit Execution".Description)
                {
                }
                column(ComplianceStatus_AuditExecution; "Audit Execution"."Compliance Status")
                {
                }
                column(RiskRatingCode_AuditExecution; "Audit Execution"."Risk Rating Code")
                {
                }
                column(Implication_AuditExecution; "Audit Execution".Implication)
                {
                }
                dataitem("Audit Management Comment"; "Audit Management Comment")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Engagement ID" = field("Engagement ID"), "Checklist ID" = field("Checklist ID"), "Finding ID" = field("Finding ID");
                    column(Description_AuditManagementComment; "Audit Management Comment".Description)
                    {
                    }
                    column(DocumentNo_AuditManagementComment; "Audit Management Comment"."Document No.")
                    {
                    }
                }
                dataitem("Audit Finding Recommendation"; "Audit Finding Recommendation")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Engagement ID" = field("Engagement ID"), "Checklist ID" = field("Checklist ID"), "Finding ID" = field("Finding ID");
                    column(Description_AuditFindingRecommendation; "Audit Finding Recommendation".Description)
                    {
                    }
                    column(DocumentNo_AuditFindingRecommendation; "Audit Finding Recommendation"."Document No.")
                    {
                    }
                }
            }
            dataitem(ManageFind; "Audit Execution Finding")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Engagement ID" = field("Engagement ID");
                column(Description_ManageFind; ManageFind.Description)
                {
                }
                column(DocumentType_ManageFind; ManageFind."Document Type")
                {
                }
                column(DocumentNo_ManageFind; ManageFind."Document No.")
                {
                }
                column(EngagementID_ManageFind; ManageFind."Engagement ID")
                {
                }
                column(ChecklistID_ManageFind; ManageFind."Checklist ID")
                {
                }
                column(FindingID_ManageFind; ManageFind."Finding ID")
                {
                }
                dataitem("Audit Management Action"; "Audit Management Action")
                {
                    DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("Document No."), "Engagement ID" = field("Engagement ID"), "Checklist ID" = field("Checklist ID"), "Finding ID" = field("Finding ID");
                    column(Description_AuditManagementAction; "Audit Management Action".Description)
                    {
                    }
                    column(DocumentNo_AuditManagementAction; "Audit Management Action"."Document No.")
                    {
                    }
                    column(DueDate_AuditManagementAction; "Audit Management Action"."Due Date")
                    {
                    }
                    column(ActionOwnerID_AuditManagementAction; "Audit Management Action"."Action Owner ID")
                    {
                    }
                }
            }
            dataitem(Managereccom; "Audit Execution Finding")
            {
                DataItemLink = "Document No." = field("Document No."), "Engagement ID" = field("Engagement ID"), "Document Type" = field("Document Type");
                column(DocumentType_Managereccom; Managereccom."Document Type")
                {
                }
                column(DocumentNo_Managereccom; Managereccom."Document No.")
                {
                }
                column(EngagementID_Managereccom; Managereccom."Engagement ID")
                {
                }
                column(ChecklistID_Managereccom; Managereccom."Checklist ID")
                {
                }
                column(FindingID_Managereccom; Managereccom."Finding ID")
                {
                }
                column(Description_Managereccom; Managereccom.Description)
                {
                }
                column(RiskRatingCode_Managereccom; Managereccom."Risk Rating Code")
                {
                }
                column(Implication_Managereccom; Managereccom.Implication)
                {
                }
                column(RiskHeatZone_Managereccom; Managereccom."Risk Heat Zone")
                {
                }
            }
            dataitem("Audit Project Section"; "Audit Project Section")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
                column(EngagementID_AuditProjectSection; "Audit Project Section"."Engagement ID")
                {
                }
                column(SectionType_AuditProjectSection; "Audit Project Section"."Section Type")
                {
                }
                column(LineNo_AuditProjectSection; "Audit Project Section"."Line No.")
                {
                }
                column(Description_AuditProjectSection; "Audit Project Section".Description)
                {
                }
            }
            dataitem("Audit Project Objective"; "Audit Project Objective")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
                column(EngagementID_AuditProjectObjective; "Audit Project Objective"."Engagement ID")
                {
                }
                column(AuditObjectiveID_AuditProjectObjective; "Audit Project Objective"."Audit Objective ID")
                {
                }
                column(Description_AuditProjectObjective; "Audit Project Objective".Description)
                {
                }
            }
            dataitem("Audit Checklist Test Approach"; "Audit Checklist Test Approach")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentNo_AuditChecklistTestApproach; "Audit Checklist Test Approach"."Document No.")
                {
                }
                column(AuditTestingMethod_AuditChecklistTestApproach; "Audit Checklist Test Approach"."Audit Testing Method")
                {
                }
                column(Description_AuditChecklistTestApproach; "Audit Checklist Test Approach".Description)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                leadname := UpperCase(Format("Audit Execution Header"."Document Type"));
            end;

            trigger OnPreDataItem()
            begin
                /*Resource.RESET;
                Resource.SETRANGE("No.",AuditProject."Lead Auditee Representative ID");
                IF Resource.FINDSET THEN BEGIN
                  leadname:=Resource.Name;
                  END;*/

            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        AuditProject: Record "Audit Project";
        Resource: Record Resource;
        leadname: Text[100];
}

