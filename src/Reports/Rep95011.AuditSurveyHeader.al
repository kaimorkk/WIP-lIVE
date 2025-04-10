report 95011 "Audit Survey Header"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Audit Survey Header.rdlc';

    dataset
    {
        dataitem("Audit Survey Header"; "Audit Survey Header")
        {
            column(DocumentType_AuditSurveyHeader; "Audit Survey Header"."Document Type")
            {
            }
            column(DocumentNo_AuditSurveyHeader; "Audit Survey Header"."Document No.")
            {
            }
            column(DocumentDate_AuditSurveyHeader; "Audit Survey Header"."Document Date")
            {
            }
            column(PreAuditSurveyInvitNo_AuditSurveyHeader; "Audit Survey Header"."PreAudit Survey Invitation  No")
            {
            }
            column(PostAuditSurveyInvitNo_AuditSurveyHeader; "Audit Survey Header"."PostAudit Survey Invitation No")
            {
            }
            column(EngagementID_AuditSurveyHeader; "Audit Survey Header"."Engagement ID")
            {
            }
            column(Description_AuditSurveyHeader; "Audit Survey Header".Description)
            {
            }
            column(AuditPlanID_AuditSurveyHeader; "Audit Survey Header"."Audit Plan ID")
            {
            }
            column(AuditWorkType_AuditSurveyHeader; "Audit Survey Header"."Audit  Work Type")
            {
            }
            column(EngagementName_AuditSurveyHeader; "Audit Survey Header"."Engagement Name")
            {
            }
            column(EngagementCategory_AuditSurveyHeader; "Audit Survey Header"."Engagement Category")
            {
            }
            column(AuditorType_AuditSurveyHeader; "Audit Survey Header"."Auditor Type")
            {
            }
            column(AuditLeadID_AuditSurveyHeader; "Audit Survey Header"."Audit Lead ID")
            {
            }
            column(AuditeeType_AuditSurveyHeader; "Audit Survey Header"."Auditee Type")
            {
            }
            column(ProjectID_AuditSurveyHeader; "Audit Survey Header"."Project ID")
            {
            }
            column(PrimaryAuditeeID_AuditSurveyHeader; "Audit Survey Header"."Primary Auditee ID")
            {
            }
            column(AuditeeName_AuditSurveyHeader; "Audit Survey Header"."Auditee Name")
            {
            }
            column(AuditeeLeadID_AuditSurveyHeader; "Audit Survey Header"."Auditee Lead ID")
            {
            }
            column(GlobalDimension1Code_AuditSurveyHeader; "Audit Survey Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AuditSurveyHeader; "Audit Survey Header"."Global Dimension 2 Code")
            {
            }
            column(DimensionSetID_AuditSurveyHeader; "Audit Survey Header"."Dimension Set ID")
            {
            }
            column(Status_AuditSurveyHeader; "Audit Survey Header".Status)
            {
            }
            column(Posted_AuditSurveyHeader; "Audit Survey Header".Posted)
            {
            }
            column(CreatedBy_AuditSurveyHeader; "Audit Survey Header"."Created By")
            {
            }
            column(CreatedDateTime_AuditSurveyHeader; "Audit Survey Header"."Created DateTime")
            {
            }
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
}

