report 95016 "Auditee Notice Response"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Auditee Notice Response.rdlc';

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
            column(leadname; leadname)
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
            dataitem("Audit Project Team"; "Audit Project Team")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
                column(EngagementID_AuditProjectTeam; "Audit Project Team"."Engagement ID")
                {
                }
                column(ResourceNo_AuditProjectTeam; "Audit Project Team"."Resource No.")
                {
                }
                column(Name_AuditProjectTeam; "Audit Project Team".Name)
                {
                }
                column(AuditTeamType_AuditProjectTeam; "Audit Project Team"."Audit Team Type")
                {
                }
                column(EngagementRole_AuditProjectTeam; "Audit Project Team"."Engagement Role")
                {
                }
                column(StartDate_AuditProjectTeam; "Audit Project Team"."Start Date")
                {
                }
                column(EndDate_AuditProjectTeam; "Audit Project Team"."End Date")
                {
                }
                column(DefaultAuditLocationID_AuditProjectTeam; "Audit Project Team"."Default Audit Location ID")
                {
                }
                column(JobTitle_AuditProjectTeam; "Audit Project Team"."Job Title")
                {
                }
                column(PhoneNo_AuditProjectTeam; "Audit Project Team"."Phone No.")
                {
                }
                column(Email_AuditProjectTeam; "Audit Project Team".Email)
                {
                }
                column(Blocked_AuditProjectTeam; "Audit Project Team".Blocked)
                {
                }
            }

            trigger OnPreDataItem()
            begin
                Resource.Reset;
                Resource.SetRange("No.", AuditProject."Lead Auditee Representative ID");
                if Resource.FindSet then begin
                    leadname := Resource.Name;
                end;
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

