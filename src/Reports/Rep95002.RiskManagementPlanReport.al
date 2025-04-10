report 95002 "Risk Management Plan Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Risk Management Plan Report.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Risk Management Plan"; "Risk Management Plan")
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
            column(DocumentType_RiskManagementPlan; "Risk Management Plan"."Document Type")
            {
            }
            column(DetailedNaration_RiskManagementPlan; "Risk Management Plan"."Detailed Introduction")
            {
            }
            column(DocumentNo_RiskManagementPlan; "Risk Management Plan"."Document No")
            {
            }
            column(DocumentDate_RiskManagementPlan; "Risk Management Plan"."Document Date")
            {
            }
            column(ProjectID_RiskManagementPlan; "Risk Management Plan"."Project ID")
            {
            }
            column(WorkExecutionPlanID_RiskManagementPlan; "Risk Management Plan"."Work Execution Plan ID")
            {
            }
            column(CorporateStrategicPlanID_RiskManagementPlan; "Risk Management Plan"."Corporate Strategic Plan ID")
            {
            }
            column(YearCode_RiskManagementPlan; "Risk Management Plan"."Year Code")
            {
            }
            column(DirectorateID_RiskManagementPlan; "Risk Management Plan"."Directorate ID")
            {
            }
            column(DepartmentID_RiskManagementPlan; "Risk Management Plan"."Department ID")
            {
            }
            column(RegionID_RiskManagementPlan; "Risk Management Plan"."Region ID")
            {
            }
            column(Description_RiskManagementPlan; "Risk Management Plan".Description)
            {
            }
            column(PrimaryMIssion_RiskManagementPlan; "Risk Management Plan"."Primary Mission")
            {
            }
            column(ResponsibleOfficerNo_RiskManagementPlan; "Risk Management Plan"."Responsible Officer No.")
            {
            }
            column(ResponsibleOfficerName_RiskManagementPlan; "Risk Management Plan"."Responsible Officer Name")
            {
            }
            column(RiskLikelihoodRateScaleID_RiskManagementPlan; "Risk Management Plan"."Risk Likelihood Rate Scale ID")
            {
            }
            column(RiskImpactRatingScaleID_RiskManagementPlan; "Risk Management Plan"."Risk Impact Rating Scale ID")
            {
            }
            column(OverallRiskRatingScaleID_RiskManagementPlan; "Risk Management Plan"."Overall Risk Rating Scale ID")
            {
            }
            column(RiskAppetiteRatingScaleID_RiskManagementPlan; "Risk Management Plan"."Risk Appetite Rating Scale ID")
            {
            }
            column(ProjectName_RiskManagementPlan; "Risk Management Plan"."Project Name")
            {
            }
            column(PlanningStartDate_RiskManagementPlan; "Risk Management Plan"."Planning Start Date")
            {
            }
            column(PlanningEndDate_RiskManagementPlan; "Risk Management Plan"."Planning End Date")
            {
            }
            column(Blocked_RiskManagementPlan; "Risk Management Plan".Blocked)
            {
            }
            column(Status_RiskManagementPlan; "Risk Management Plan".Status)
            {
            }
            column(CreatedBy_RiskManagementPlan; "Risk Management Plan"."Created By")
            {
            }
            column(CreatedDateTime_RiskManagementPlan; "Risk Management Plan"."Created Date Time")
            {
            }
            column(NoofNegRisksThreats_RiskManagementPlan; "Risk Management Plan"."No. of Neg. Risks (Threats)")
            {
            }
            column(NoofPositivRisksOpports_RiskManagementPlan; "Risk Management Plan"."No. of Positiv Risks (Opports)")
            {
            }
            column(NoofRisksRed_RiskManagementPlan; "Risk Management Plan"."No. of Risks (Red)")
            {
            }
            column(NoofRisksYellow_RiskManagementPlan; "Risk Management Plan"."No. of Risks (Yellow)")
            {
            }
            column(NoofRisksGreen_RiskManagementPlan; "Risk Management Plan"."No. of Risks (Green)")
            {
            }
            column(NoofRiskIncidents_RiskManagementPlan; "Risk Management Plan"."No. of Risk Incidents")
            {
            }
            column(EstFinancialImpactLCY_RiskManagementPlan; "Risk Management Plan"."Est. Financial Impact (LCY)")
            {
            }
            column(EstimateDelayImpactDays_RiskManagementPlan; "Risk Management Plan"."Estimate Delay Impact (Days)")
            {
            }
            column(ActualFinancialImpactLCY_RiskManagementPlan; "Risk Management Plan"."Actual Financial Impact (LCY)")
            {
            }
            column(ActualScheduleDelayDays_RiskManagementPlan; "Risk Management Plan"."Actual Schedule Delay(Days)")
            {
            }
            column(ActualNoInjuredPersons_RiskManagementPlan; "Risk Management Plan"."Actual No. Injured Persons")
            {
            }
            column(ActualNoofFatalities_RiskManagementPlan; "Risk Management Plan"."Actual No. of Fatalities")
            {
            }
            column(NoofNewRiskVouchers_RiskManagementPlan; "Risk Management Plan"."No. of New Risk Vouchers")
            {
            }
            column(NoofRiskStatusReports_RiskManagementPlan; "Risk Management Plan"."No. of Risk Status Reports")
            {
            }
            dataitem("Risk Management Plan Line"; "Risk Management Plan Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No" = field("Document No");
                column(DocumentType_RiskManagementPlanLine; "Risk Management Plan Line"."Document Type")
                {
                }
                column(DocumentNo_RiskManagementPlanLine; "Risk Management Plan Line"."Document No")
                {
                }
                column(RiskID_RiskManagementPlanLine; "Risk Management Plan Line"."Risk ID")
                {
                }
                column(RiskCategory_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Category")
                {
                }
                column(RiskTitle_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Title")
                {
                }
                column(RiskSourceID_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Source ID")
                {
                }
                column(RiskLikelihoodCode_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Likelihood Code")
                {
                }
                column(RiskImpactCode_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Impact Code")
                {
                }
                column(RiskImpactType_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Impact Type")
                {
                }
                column(EstimateFinImpactLCY_RiskManagementPlanLine; "Risk Management Plan Line"."Estimate Fin. Impact (LCY)")
                {
                }
                column(EstimateDelayImpactDays_RiskManagementPlanLine; "Risk Management Plan Line"."Estimate Delay Impact (Days)")
                {
                }
                column(GenRiskResponseStrategy_RiskManagementPlanLine; "Risk Management Plan Line"."Gen. Risk Response Strategy")
                {
                }
                column(DateRaised_RiskManagementPlanLine; "Risk Management Plan Line"."Date Raised")
                {
                }
                column(RiskStatus_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Status")
                {
                }
                column(DateClosed_RiskManagementPlanLine; "Risk Management Plan Line"."Date Closed")
                {
                }
                column(RiskLikelihoodRateScaleID_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Likelihood Rate Scale ID")
                {
                }
                column(StrategicPillarDescription_RiskManagementPlanLine; "Risk Management Plan Line"."Strategic Pillar Description")
                {
                }
                column(RiskImpactRatingScaleID_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Impact Rating Scale ID")
                {
                }
                column(OverallRiskRatingScaleID_RiskManagementPlanLine; "Risk Management Plan Line"."Overall Risk Rating Scale ID")
                {
                }
                column(RiskAppetiteRatingScaleID_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Appetite Rating Scale ID")
                {
                }
                column(RiskLikelihoodRating_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Likelihood Rating")
                {
                }
                column(RiskImpactRating_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Impact Rating")
                {
                }
                column(OveralRiskRating_RiskManagementPlanLine; "Risk Management Plan Line"."Overal Risk Rating")
                {
                }
                column(OverallRiskLevelCode_RiskManagementPlanLine; "Risk Management Plan Line"."Overall Risk Level Code")
                {
                }
                column(RiskHeatZone_RiskManagementPlanLine; "Risk Management Plan Line"."Risk Heat Zone")
                {
                }
                column(NoofPlanedRiskRespActns_RiskManagementPlanLine; "Risk Management Plan Line"."No. of Planed Risk Resp. Actns")
                {
                }
                column(NoofActualRiskRespActns_RiskManagementPlanLine; "Risk Management Plan Line"."No. of Actual Risk Resp. Actns")
                {
                }
                column(NoofImpactedProjectTasks_RiskManagementPlanLine; "Risk Management Plan Line"."No. of Impacted Project Tasks")
                {
                }
                column(NoofPosRiskIncidences_RiskManagementPlanLine; "Risk Management Plan Line"."No. of Pos. Risk Incidences")
                {
                }
                column(NoofNegRiskIncidences_RiskManagementPlanLine; "Risk Management Plan Line"."No. of Neg. Risk Incidences")
                {
                }
                column(ActualFinancialImpactLCY_RiskManagementPlanLine; "Risk Management Plan Line"."Actual Financial Impact (LCY)")
                {
                }
                column(ActualDelayImpactDays_RiskManagementPlanLine; "Risk Management Plan Line"."Actual Delay Impact (Days)")
                {
                }
                column(NewRiskVoucherID_RiskManagementPlanLine; "Risk Management Plan Line"."New Risk Voucher ID")
                {
                }
                dataitem("RMP Line Response Action"; "RMP Line Response Action")
                {
                    DataItemLink = "Risk ID" = field("Risk ID"), "Document Type" = field("Document Type"), "Document No" = field("Document No");
                    column(ActivityDescription_RMPLineResponseAction; "RMP Line Response Action"."Activity Description")
                    {
                    }
                    column(DocumentType_RMPLineResponseAction; "RMP Line Response Action"."Document Type")
                    {
                    }
                    column(DocumentNo_RMPLineResponseAction; "RMP Line Response Action"."Document No")
                    {
                    }
                    column(ResponsibleOfficerNo_RMPLineResponseAction; "RMP Line Response Action"."Responsible Officer No.")
                    {
                    }
                    column(ActionStatus_RMPLineResponseAction; "RMP Line Response Action"."Action Status")
                    {
                    }
                    column(PlannedDueDate_RMPLineResponseAction; "RMP Line Response Action"."Planned Due Date")
                    {
                    }
                    column(DescriptiveStatus_RMPLineResponseAction; "RMP Line Response Action"."Descriptive Status")
                    {
                    }
                    column(ResponsibleOfficerName_RMPLineResponseAction; "RMP Line Response Action"."Responsible Officer Name")
                    {
                    }
                    column(Timeline_RMPLineResponseAction; "RMP Line Response Action".Timeline)
                    {
                    }
                    column(RiskResponseActionTaken_RMPLineResponseAction; "RMP Line Response Action"."Risk Response Action Taken")
                    {
                    }
                }
                dataitem("Residual Risk Rating"; "Residual Risk Rating")
                {
                    column(RiskID_ResidualRiskRating; "Residual Risk Rating"."Risk ID")
                    {
                    }
                    column(RiskTitle_ResidualRiskRating; "Residual Risk Rating"."Risk Title")
                    {
                    }
                    column(RiskLikelihoodRating_ResidualRiskRating; "Residual Risk Rating"."Risk Likelihood Rating")
                    {
                    }
                    column(RiskImpactRating_ResidualRiskRating; "Residual Risk Rating"."Risk Impact Rating")
                    {
                    }
                    column(OveralRiskRating_ResidualRiskRating; "Residual Risk Rating"."Overal Risk Rating")
                    {
                    }
                    column(OverallRiskLevelCode_ResidualRiskRating; "Residual Risk Rating"."Overall Risk Level Code")
                    {
                    }
                    column(RiskHeatZone_ResidualRiskRating; "Residual Risk Rating"."Risk Heat Zone")
                    {
                    }
                    column(ResidualRisk_ResidualRiskRating; "Residual Risk Rating"."Residual Risk")
                    {
                    }
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

