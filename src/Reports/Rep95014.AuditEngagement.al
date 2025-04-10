report 95014 "Audit Engagement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Audit Engagement.rdlc';

    dataset
    {
        dataitem("Audit Project"; "Audit Project")
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
            column(EngagementID_AuditProject; "Audit Project"."Engagement ID")
            {
            }
            column(AuditPlanID_AuditProject; "Audit Project"."Audit Plan ID")
            {
            }
            column(AuditPlanAssignmentNo_AuditProject; "Audit Project"."Audit Plan Assignment No.")
            {
            }
            column(AuditWorkType_AuditProject; "Audit Project"."Audit  Work Type")
            {
            }
            column(EngagementName_AuditProject; "Audit Project"."Engagement Name")
            {
            }
            column(EngagementCategory_AuditProject; "Audit Project"."Engagement Category")
            {
            }
            column(ParentAuditProjectID_AuditProject; "Audit Project"."Parent Audit Project ID")
            {
            }
            column(AuditorType_AuditProject; "Audit Project"."Auditor Type")
            {
            }
            column(LeadAuditorID_AuditProject; "Audit Project"."Lead Auditor ID")
            {
            }
            column(LeadAuditorEmail_AuditProject; "Audit Project"."Lead Auditor Email")
            {
            }
            column(PlannedStartDate_AuditProject; "Audit Project"."Planned Start Date")
            {
            }
            column(PlannedEndDate_AuditProject; "Audit Project"."Planned End Date")
            {
            }
            column(AuditeeType_AuditProject; "Audit Project"."Auditee Type")
            {
            }
            column(AuditTemplateID_AuditProject; "Audit Project"."Audit Template ID")
            {
            }
            column(ProjectID_AuditProject; "Audit Project"."Project ID")
            {
            }
            column(PrimaryAuditeeID_AuditProject; "Audit Project"."Primary Auditee ID")
            {
            }
            column(AuditeeName_AuditProject; "Audit Project"."Auditee Name")
            {
            }
            column(LeadAuditeeRepresentativeID_AuditProject; "Audit Project"."Lead Auditee Representative ID")
            {
            }
            column(LeadAuditeeEmail_AuditProject; "Audit Project"."Lead Auditee Email")
            {
            }
            column(Status_AuditProject; "Audit Project".Status)
            {
            }
            column(FundingSourceID_AuditProject; "Audit Project"."Funding Source ID")
            {
            }
            column(BudgetCostLCY_AuditProject; "Audit Project"."Budget Cost (LCY)")
            {
            }
            column(BudgetControlJobNo_AuditProject; "Audit Project"."Budget Control Job No")
            {
            }
            column(BudgetControlJobTaskNo_AuditProject; "Audit Project"."Budget Control Job Task No.")
            {
            }
            column(GlobalDimension1Code_AuditProject; "Audit Project"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_AuditProject; "Audit Project"."Global Dimension 2 Code")
            {
            }
            column(DimensionSetID_AuditProject; "Audit Project"."Dimension Set ID")
            {
            }
            column(InternalAuditCharterID_AuditProject; "Audit Project"."Internal Audit Charter ID")
            {
            }
            column(ChiefAuditExecutiveID_AuditProject; "Audit Project"."Chief Audit Executive ID")
            {
            }
            column(RiskLikelihoodRateScaleID_AuditProject; "Audit Project"."Risk Likelihood Rate Scale ID")
            {
            }
            column(RiskImpactRatingScaleID_AuditProject; "Audit Project"."Risk Impact Rating Scale ID")
            {
            }
            column(OverallRiskRatingScaleID_AuditProject; "Audit Project"."Overall Risk Rating Scale ID")
            {
            }
            column(RiskAppetiteRatingScaleID_AuditProject; "Audit Project"."Risk Appetite Rating Scale ID")
            {
            }
            column(NoofAuditObjectives_AuditProject; "Audit Project"."No. of Audit Objectives")
            {
            }
            column(AuditProcedureID_AuditProject; "Audit Project"."Audit Procedure ID")
            {
            }
            column(NofoAuditChecklists_AuditProject; "Audit Project"."No. fo Audit Checklists")
            {
            }
            column(NoOfRecommAuditTestMetho_AuditProject; "Audit Project"."No. Of Recomm Audit Test Metho")
            {
            }
            column(NoofBusinessRisks_AuditProject; "Audit Project"."No. of Business Risks")
            {
            }
            column(NoofControls_AuditProject; "Audit Project"."No. of Controls")
            {
            }
            column(NoOfAuditCommenceNotices_AuditProject; "Audit Project"."No. Of Audit Commence Notices")
            {
            }
            column(NoOfAuditeeNoticeResponse_AuditProject; "Audit Project"."No. Of Auditee Notice Response")
            {
            }
            column(NoofAuditEntraceMeetings_AuditProject; "Audit Project"."No. of Audit Entrace Meetings")
            {
            }
            column(NoOfPreAuditSuvyInivitati_AuditProject; "Audit Project"."No. Of PreAudit Suvy Inivitati")
            {
            }
            column(NoOfPreAuditSuvyResponses_AuditProject; "Audit Project"."No. Of PreAudit Suvy Responses")
            {
            }
            column(NoSeries_AuditProject; "Audit Project"."No. Series")
            {
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
            dataitem("Audit Project Procedure"; "Audit Project Procedure")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
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
                DataItemLink = "Engagement ID" = field("Engagement ID");
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
                dataitem("Audit Checklist Test Method"; "Audit Checklist Test Method")
                {
                    DataItemLink = "Checklist ID" = field("Checklist ID"), "Engagement ID" = field("Engagement ID");
                    column(EngagementID_AuditChecklistTestMethod; "Audit Checklist Test Method"."Engagement ID")
                    {
                    }
                    column(ChecklistID_AuditChecklistTestMethod; "Audit Checklist Test Method"."Checklist ID")
                    {
                    }
                    column(LineNo_AuditChecklistTestMethod; "Audit Checklist Test Method"."Line No.")
                    {
                    }
                    column(AuditTestingMethod_AuditChecklistTestMethod; "Audit Checklist Test Method"."Audit Testing Method")
                    {
                    }
                    column(Desription_AuditChecklistTestMethod; "Audit Checklist Test Method".Desription)
                    {
                    }
                    column(AuditProcedureID_AuditChecklistTestMethod; "Audit Checklist Test Method"."Audit Procedure ID")
                    {
                    }
                    column(AuditObjectiveID_AuditChecklistTestMethod; "Audit Checklist Test Method"."Audit Objective ID")
                    {
                    }
                }
            }
            dataitem("Audit ProjectLocation"; "Audit ProjectLocation")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
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
            dataitem("Audit Proj Required Document"; "Audit Proj Required Document")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
                column(EngagementID_AuditProjRequiredDocument; "Audit Proj Required Document"."Engagement ID")
                {
                }
                column(DocumentNo_AuditProjRequiredDocument; "Audit Proj Required Document"."Document No.")
                {
                }
                column(Description_AuditProjRequiredDocument; "Audit Proj Required Document".Description)
                {
                }
                column(AuditProcedureID_AuditProjRequiredDocument; "Audit Proj Required Document"."Audit Procedure ID")
                {
                }
                column(PreferredFormat_AuditProjRequiredDocument; "Audit Proj Required Document"."Preferred Format")
                {
                }
                column(SubmissionDeadline_AuditProjRequiredDocument; "Audit Proj Required Document"."Submission Deadline")
                {
                }
                column(RequirementType_AuditProjRequiredDocument; "Audit Proj Required Document"."Requirement Type")
                {
                }
                column(LeadAuditorID_AuditProjRequiredDocument; "Audit Proj Required Document"."Lead Auditor ID")
                {
                }
                column(LeadAuditeeRepresentativeID_AuditProjRequiredDocument; "Audit Proj Required Document"."Lead Auditee Representative ID")
                {
                }
                column(DateRequested_AuditProjRequiredDocument; "Audit Proj Required Document"."Date Requested")
                {
                }
                column(DateSubmitted_AuditProjRequiredDocument; "Audit Proj Required Document"."Date Submitted")
                {
                }
                column(SubmissionStatus_AuditProjRequiredDocument; "Audit Proj Required Document"."Submission Status")
                {
                }
                column(NoofFiledAuditeeDocuments_AuditProjRequiredDocument; "Audit Proj Required Document"."No. of Filed Audit Papers")
                {
                }
            }
            dataitem("Audit Project Schedule"; "Audit Project Schedule")
            {
                DataItemLink = "Engagement ID" = field("Engagement ID");
                column(EngagementID_AuditProjectSchedule; "Audit Project Schedule"."Engagement ID")
                {
                }
                column(AuditPhase_AuditProjectSchedule; "Audit Project Schedule"."Audit Phase")
                {
                }
                column(TaskNo_AuditProjectSchedule; "Audit Project Schedule"."Task No.")
                {
                }
                column(Description_AuditProjectSchedule; "Audit Project Schedule".Description)
                {
                }
                column(StartDate_AuditProjectSchedule; "Audit Project Schedule"."Start Date")
                {
                }
                column(EndDate_AuditProjectSchedule; "Audit Project Schedule"."End Date")
                {
                }
                column(AuditDurationDays_AuditProjectSchedule; "Audit Project Schedule"."Audit Duration (Days)")
                {
                }
                column(Status_AuditProjectSchedule; "Audit Project Schedule".Status)
                {
                }
                column(Completion_AuditProjectSchedule; "Audit Project Schedule"."Completion %")
                {
                }
                column(LeadAuditorID_AuditProjectSchedule; "Audit Project Schedule"."Lead Auditor ID")
                {
                }
                column(LeadAuditeeRepresentativeID_AuditProjectSchedule; "Audit Project Schedule"."Lead Auditee Representative ID")
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

