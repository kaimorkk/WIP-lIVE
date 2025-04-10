report 95017 "Auditee Entrance Meeting Summa"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Auditee Entrance Meeting Summa.rdlc';

    dataset
    {
        dataitem("Audit Mobilization Header1"; "Audit Mobilization Header1")
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
            column(DocumentType_AuditMobilizationHeader; "Audit Mobilization Header1"."Document Type")
            {
            }
            column(DocumentNo_AuditMobilizationHeader; "Audit Mobilization Header1"."Document No.")
            {
            }
            column(DocumentDate_AuditMobilizationHeader; "Audit Mobilization Header1"."Document Date")
            {
            }
            column(AuditCommencementNoticeNo_AuditMobilizationHeader; "Audit Mobilization Header1"."Audit Commencement Notice No.")
            {
            }
            column(AuditeeNoticeResponseNo_AuditMobilizationHeader; "Audit Mobilization Header1"."Auditee Notice Response No.")
            {
            }
            column(EntraceMeetingNo_AuditMobilizationHeader; "Audit Mobilization Header1"."Entrace Meeting No.")
            {
            }
            column(EngagementID_AuditMobilizationHeader; "Audit Mobilization Header1"."Engagement ID")
            {
            }
            column(Description_AuditMobilizationHeader; "Audit Mobilization Header1".Description)
            {
            }
            column(AuditPlanID_AuditMobilizationHeader; "Audit Mobilization Header1"."Audit Plan ID")
            {
            }
            column(AuditWorkType_AuditMobilizationHeader; "Audit Mobilization Header1"."Audit  Work Type")
            {
            }
            column(EngagementName_AuditMobilizationHeader; "Audit Mobilization Header1"."Engagement Name")
            {
            }
            column(EngagementCategory_AuditMobilizationHeader; "Audit Mobilization Header1"."Engagement Category")
            {
            }
            column(AuditorType_AuditMobilizationHeader; "Audit Mobilization Header1"."Auditor Type")
            {
            }
            column(AuditLeadID_AuditMobilizationHeader; "Audit Mobilization Header1"."Audit Lead ID")
            {
            }
            column(AuditeeType_AuditMobilizationHeader; "Audit Mobilization Header1"."Auditee Type")
            {
            }
            column(ProjectID_AuditMobilizationHeader; "Audit Mobilization Header1"."Project ID")
            {
            }
            column(PrimaryAuditeeID_AuditMobilizationHeader; "Audit Mobilization Header1"."Primary Auditee ID")
            {
            }
            column(AuditeeName_AuditMobilizationHeader; "Audit Mobilization Header1"."Auditee Name")
            {
            }
            column(AuditeeLeadID_AuditMobilizationHeader; "Audit Mobilization Header1"."Auditee Lead ID")
            {
            }
            column(GlobalDimension1Code_AuditMobilizationHeader; "Audit Mobilization Header1"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AuditMobilizationHeader; "Audit Mobilization Header1"."Global Dimension 2 Code")
            {
            }
            column(DimensionSetID_AuditMobilizationHeader; "Audit Mobilization Header1"."Dimension Set ID")
            {
            }
            column(Status_AuditMobilizationHeader; "Audit Mobilization Header1".Status)
            {
            }
            column(Posted_AuditMobilizationHeader; "Audit Mobilization Header1".Posted)
            {
            }
            column(CreatedBy_AuditMobilizationHeader; "Audit Mobilization Header1"."Created By")
            {
            }
            column(CreatedDateTime_AuditMobilizationHeader; "Audit Mobilization Header1"."Created DateTime")
            {
            }
            column(EntranceMeetingVenue_AuditMobilizationHeader; "Audit Mobilization Header1"."Entrance Meeting Venue")
            {
            }
            column(EntranceMeetingStartDate_AuditMobilizationHeader; "Audit Mobilization Header1"."Entrance Meeting Start Date")
            {
            }
            column(EntranceMeetingStartTime_AuditMobilizationHeader; "Audit Mobilization Header1"."Entrance Meeting Start Time")
            {
            }
            column(EntranceMeetingEndDate_AuditMobilizationHeader; "Audit Mobilization Header1"."Entrance Meeting End Date")
            {
            }
            column(EntranceMeetingEndTime_AuditMobilizationHeader; "Audit Mobilization Header1"."Entrance Meeting End Time")
            {
            }
            column(Duration_AuditMobilizationHeader; "Audit Mobilization Header1".Duration)
            {
            }
            column(MeetingMedium_AuditMobilizationHeader; "Audit Mobilization Header1"."Meeting Medium")
            {
            }
            column(NoSeries_AuditMobilizationHeader; "Audit Mobilization Header1"."No. Series")
            {
            }
            dataitem("Entrance Meeting Agenda"; "Entrance Meeting Agenda")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentType_EntranceMeetingAgenda; "Entrance Meeting Agenda"."Document Type")
                {
                }
                column(DocumentNo_EntranceMeetingAgenda; "Entrance Meeting Agenda"."Document No.")
                {
                }
                column(EngagementID_EntranceMeetingAgenda; "Entrance Meeting Agenda"."Engagement ID")
                {
                }
                column(AgendaCode_EntranceMeetingAgenda; "Entrance Meeting Agenda"."Agenda Code")
                {
                }
                column(AgendaDescription_EntranceMeetingAgenda; "Entrance Meeting Agenda"."Agenda Description")
                {
                }
                column(EstimateTimeMinutes_EntranceMeetingAgenda; "Entrance Meeting Agenda"."Estimate Time (Minutes)")
                {
                }
                column(NoofDiscussedItems_EntranceMeetingAgenda; "Entrance Meeting Agenda"."No. of Discussed Items")
                {
                }
                dataitem("Entrance Meeting Summary"; "Entrance Meeting Summary")
                {
                    DataItemLink = "Document No." = field("Document No."), "Agenda Code" = field("Agenda Code");
                    column(DocumentType_EntranceMeetingSummary; "Entrance Meeting Summary"."Document Type")
                    {
                    }
                    column(DocumentNo_EntranceMeetingSummary; "Entrance Meeting Summary"."Document No.")
                    {
                    }
                    column(EngagementID_EntranceMeetingSummary; "Entrance Meeting Summary"."Engagement ID")
                    {
                    }
                    column(AgendaCode_EntranceMeetingSummary; "Entrance Meeting Summary"."Agenda Code")
                    {
                    }
                    column(LineNo_EntranceMeetingSummary; "Entrance Meeting Summary"."Line No")
                    {
                    }
                    column(ItemDiscussed_EntranceMeetingSummary; "Entrance Meeting Summary"."Item Discussed")
                    {
                    }
                    column(SummaryNotes_EntranceMeetingSummary; "Entrance Meeting Summary"."Summary Notes")
                    {
                    }
                }
            }
            dataitem("Entrace Meeting Attendance"; "Entrace Meeting Attendance")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentType_EntraceMeetingAttendance; "Entrace Meeting Attendance"."Document Type")
                {
                }
                column(DocumentNo_EntraceMeetingAttendance; "Entrace Meeting Attendance"."Document No.")
                {
                }
                column(EngagementID_EntraceMeetingAttendance; "Entrace Meeting Attendance"."Engagement ID")
                {
                }
                column(ResourceNo_EntraceMeetingAttendance; "Entrace Meeting Attendance"."Resource No.")
                {
                }
                column(Name_EntraceMeetingAttendance; "Entrace Meeting Attendance".Name)
                {
                }
                column(JobTitle_EntraceMeetingAttendance; "Entrace Meeting Attendance"."Job Title")
                {
                }
                column(PhoneNo_EntraceMeetingAttendance; "Entrace Meeting Attendance"."Phone No.")
                {
                }
                column(Email_EntraceMeetingAttendance; "Entrace Meeting Attendance".Email)
                {
                }
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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

