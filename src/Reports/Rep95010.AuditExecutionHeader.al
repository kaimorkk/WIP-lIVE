report 95010 "Audit Execution Header"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Audit Execution Header.rdlc';

    dataset
    {
        dataitem("Audit Execution Header"; "Audit Execution Header")
        {
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

