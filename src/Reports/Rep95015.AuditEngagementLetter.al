report 95015 "Audit Engagement Letter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Audit Engagement Letter.rdlc';

    dataset
    {
        dataitem("Audit Mobilization Header1"; "Audit Mobilization Header1")
        {
            column(COMPANY; UpperCase(CompanyInfo.Name))
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
            dataitem("Audit Project Section"; "Audit Project Section")
            {
                DataItemLink = "Engagement ID" = field("Document No.");
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
                DataItemLink = "Engagement ID" = field("Document No.");
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
            dataitem("Audit Project Procedure"; "Audit Project Procedure")
            {
                DataItemLink = "Engagement ID" = field("Document No.");
                column(EngagementID_AuditProjectProcedure; "Audit Project Procedure"."Engagement ID")
                {
                }
                column(AuditProcedureID_AuditProjectProcedure; "Audit Project Procedure"."Audit Procedure ID")
                {
                }
                column(Description_AuditProjectProcedure; "Audit Project Procedure".Description)
                {
                }
                column(AuditObjectiveID_AuditProjectProcedure; "Audit Project Procedure"."Audit Objective ID")
                {
                }
                column(NofoAuditChecklists_AuditProjectProcedure; "Audit Project Procedure"."No. fo Audit Checklists")
                {
                }
                column(NoOfReccommAuditTestMeth_AuditProjectProcedure; "Audit Project Procedure"."No. Of Reccomm Audit Test Meth")
                {
                }
                column(NoofBusinessRisks_AuditProjectProcedure; "Audit Project Procedure"."No. of Business Risks")
                {
                }
                column(NoofControls_AuditProjectProcedure; "Audit Project Procedure"."No. of Controls")
                {
                }
            }
            dataitem("Audit Project Checklist"; "Audit Project Checklist")
            {
                DataItemLink = "Engagement ID" = field("Document No.");
                column(EngagementID_AuditProjectChecklist; "Audit Project Checklist"."Engagement ID")
                {
                }
                column(ChecklistID_AuditProjectChecklist; "Audit Project Checklist"."Checklist ID")
                {
                }
                column(AuditProcedureID_AuditProjectChecklist; "Audit Project Checklist"."Audit Procedure ID")
                {
                }
                column(Description_AuditProjectChecklist; "Audit Project Checklist".Description)
                {
                }
                column(NoOfAuditTestMethods_AuditProjectChecklist; "Audit Project Checklist"."Fieldwork Review Status")
                {
                }
                column(AuditObjectiveID_AuditProjectChecklist; "Audit Project Checklist"."Completion %")
                {
                }
            }
            dataitem("Audit ProjectLocation"; "Audit ProjectLocation")
            {
                DataItemLink = "Engagement ID" = field("Document No.");
                column(EngagementID_AuditProjectLocation; "Audit ProjectLocation"."Engagement ID")
                {
                }
                column(AuditLocationID_AuditProjectLocation; "Audit ProjectLocation"."Audit Location ID")
                {
                }
                column(Description_AuditProjectLocation; "Audit ProjectLocation".Description)
                {
                }
                column(ResponsibilityCenterID_AuditProjectLocation; "Audit ProjectLocation"."Responsibility Center ID")
                {
                }
                column(AuditSiteType_AuditProjectLocation; "Audit ProjectLocation"."Audit Site Type")
                {
                }
                column(ContactPerson_AuditProjectLocation; "Audit ProjectLocation"."Contact Person")
                {
                }
                column(PrimaryEmail_AuditProjectLocation; "Audit ProjectLocation"."Primary Email")
                {
                }
                column(TelephoneNo_AuditProjectLocation; "Audit ProjectLocation"."Telephone No.")
                {
                }
            }
            dataitem("Audit ACN Required Document"; "Audit ACN Required Document")
            {
                DataItemLink = "Document No." = field("Document No.");
                column(DocumentType_AuditACNRequiredDocument; "Audit ACN Required Document"."Document Type")
                {
                }
                column(DocumentNo_AuditACNRequiredDocument; "Audit ACN Required Document"."Document No.")
                {
                }
                column(EngagementID_AuditACNRequiredDocument; "Audit ACN Required Document"."Engagement ID")
                {
                }
                column(LineNo_AuditACNRequiredDocument; "Audit ACN Required Document"."Line No.")
                {
                }
                column(Description_AuditACNRequiredDocument; "Audit ACN Required Document".Description)
                {
                }
                column(AuditProcedureID_AuditACNRequiredDocument; "Audit ACN Required Document"."Audit Procedure ID")
                {
                }
                column(PreferredFormat_AuditACNRequiredDocument; "Audit ACN Required Document"."Preferred Format")
                {
                }
                column(RequirementType_AuditACNRequiredDocument; "Audit ACN Required Document"."Requirement Type")
                {
                }
                column(DateRequested_AuditACNRequiredDocument; "Audit ACN Required Document"."Date Requested")
                {
                }
                column(SubmissionDeadline_AuditACNRequiredDocument; "Audit ACN Required Document"."Submission Deadline")
                {
                }
                column(AuditLeadID_AuditACNRequiredDocument; "Audit ACN Required Document"."Audit Lead ID")
                {
                }
                column(AuditeeLeadID_AuditACNRequiredDocument; "Audit ACN Required Document"."Auditee Lead ID")
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

