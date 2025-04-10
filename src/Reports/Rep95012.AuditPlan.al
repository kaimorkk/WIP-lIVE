report 95012 "Audit Plan"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Audit Plan.rdlc';

    dataset
    {
        dataitem("Audit Plan"; "Audit Plan")
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
            column(AuditPlanID_AuditPlan; "Audit Plan"."Audit Plan ID")
            {
            }
            column(AuditPlanType_AuditPlan; "Audit Plan"."Audit Plan Type")
            {
            }
            column(DocumentDate_AuditPlan; "Audit Plan"."Document Date")
            {
            }
            column(YearCode_AuditPlan; "Audit Plan"."Year Code")
            {
            }
            column(PlanningStartDate_AuditPlan; "Audit Plan"."Planning Start Date")
            {
            }
            column(PlanningEndDate_AuditPlan; "Audit Plan"."Planning End Date")
            {
            }
            column(CorporateStrategicPlanID_AuditPlan; "Audit Plan"."Corporate Strategic Plan ID")
            {
            }
            column(ProjectID_AuditPlan; "Audit Plan"."Budget Code")
            {
            }
            column(ProjectName_AuditPlan; "Audit Plan"."Budget Name")
            {
            }
            column(Description_AuditPlan; "Audit Plan".Description)
            {
            }
            column(OverallPurpose_AuditPlan; "Audit Plan"."Overall Purpose")
            {
            }
            column(InternalAuditCharterID_AuditPlan; "Audit Plan"."Internal Audit Charter ID")
            {
            }
            column(ChiefAuditExecutiveID_AuditPlan; "Audit Plan"."Chief Audit Executive ID")
            {
            }
            column(Blocked_AuditPlan; "Audit Plan".Blocked)
            {
            }
            column(NoOfBudgetedNewAuditProj_AuditPlan; "Audit Plan"."No. Of Budgeted New Audit Proj")
            {
            }
            column(NoOfBudgetedWIPAuditProj_AuditPlan; "Audit Plan"."No. Of Budgeted WIP Audit Proj")
            {
            }
            column(NoOfBudgetedAuditFollowu_AuditPlan; "Audit Plan"."No. Of Budgeted Audit Follow-u")
            {
            }
            column(Status_AuditPlan; "Audit Plan".Status)
            {
            }
            column(CreatedBy_AuditPlan; "Audit Plan"."Created By")
            {
            }
            column(CreatedDatetime_AuditPlan; "Audit Plan"."Created Datetime")
            {
            }
            column(DimensionSetID_AuditPlan; "Audit Plan"."Dimension Set ID")
            {
            }
            column(NoSeries_AuditPlan; "Audit Plan"."No. Series")
            {
            }
            dataitem("Audit Plan Line"; "Audit Plan Line")
            {
                DataItemLink = "Audit Plan ID" = field("Audit Plan ID");
                column(AuditPlanID_AuditPlanLine; "Audit Plan Line"."Audit Plan ID")
                {
                }
                column(EngagementLineNo_AuditPlanLine; "Audit Plan Line"."Engagement Line No.")
                {
                }
                column(AuditWorkType_AuditPlanLine; "Audit Plan Line"."Audit  Work Type")
                {
                }
                column(EngagementName_AuditPlanLine; "Audit Plan Line"."Engagement Name")
                {
                }
                column(EngagementCategory_AuditPlanLine; "Audit Plan Line"."Engagement Category")
                {
                }
                column(ParentAuditProjectID_AuditPlanLine; "Audit Plan Line"."Parent Audit Project ID")
                {
                }
                column(AuditorType_AuditPlanLine; "Audit Plan Line"."Auditor Type")
                {
                }
                column(LeadAuditorID_AuditPlanLine; "Audit Plan Line"."Lead Auditor ID")
                {
                }
                column(LeadAuditorEmail_AuditPlanLine; "Audit Plan Line"."Lead Auditor Email")
                {
                }
                column(PlannedStartDate_AuditPlanLine; "Audit Plan Line"."Planned Start Date")
                {
                }
                column(PlannedEndDate_AuditPlanLine; "Audit Plan Line"."Planned End Date")
                {
                }
                column(AuditeeType_AuditPlanLine; "Audit Plan Line"."Auditee Type")
                {
                }
                column(AuditTemplateID_AuditPlanLine; "Audit Plan Line"."Audit Template ID")
                {
                }
                column(ProjectID_AuditPlanLine; "Audit Plan Line"."Project ID")
                {
                }
                column(PrimaryAuditeeID_AuditPlanLine; "Audit Plan Line"."Primary Auditee ID")
                {
                }
                column(AuditeeName_AuditPlanLine; "Audit Plan Line"."Auditee Name")
                {
                }
                column(LeadAuditeeRepresentativeID_AuditPlanLine; "Audit Plan Line"."Lead Auditee Representative ID")
                {
                }
                column(LeadAuditeeEmail_AuditPlanLine; "Audit Plan Line"."Lead Auditee Email")
                {
                }
                column(FundingSourceID_AuditPlanLine; "Audit Plan Line"."Funding Source ID")
                {
                }
                column(BudgetCostLCY_AuditPlanLine; "Audit Plan Line"."Budget Cost (LCY)")
                {
                }
                column(BudgetControlJobNo_AuditPlanLine; "Audit Plan Line"."Budget Control Job No")
                {
                }
                column(BudgetControlJobTaskNo_AuditPlanLine; "Audit Plan Line"."Budget Control Job Task No.")
                {
                }
                column(GlobalDimensionDim1Code_AuditPlanLine; "Audit Plan Line"."Global Dimension Dim 1 Code")
                {
                }
                column(GlobalDimensionDim2Code_AuditPlanLine; "Audit Plan Line"."Global Dimension  Dim 2 Code")
                {
                }
                column(DimensionSetID_AuditPlanLine; "Audit Plan Line"."Dimension Set ID")
                {
                }
                column(InternalAuditCharterID_AuditPlanLine; "Audit Plan Line"."Internal Audit Charter ID")
                {
                }
                column(ChiefAuditExecutiveID_AuditPlanLine; "Audit Plan Line"."Chief Audit Executive ID")
                {
                }
                column(AuditPlanType_AuditPlanLine; "Audit Plan Line"."Audit Plan Type")
                {
                }
            }
            dataitem("Audit Plan Section"; "Audit Plan Section")
            {
                DataItemLink = "Document No." = field("Audit Plan ID");
                column(Description_AuditPlanSection; "Audit Plan Section".Description)
                {
                }
                column(SectionType_AuditPlanSection; "Audit Plan Section"."Section Type")
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

