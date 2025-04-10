report 95003 "Risk Voucher Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Risk Voucher Report.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Risk M&E Header"; "Risk M&E Header")
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
            column(DocumentType_RiskMEHeader; "Risk M&E Header"."Document Type")
            {
            }
            column(DocumentNo_RiskMEHeader; "Risk M&E Header"."Document No")
            {
            }
            column(DocumentDate_RiskMEHeader; "Risk M&E Header"."Document Date")
            {
            }
            column(RiskRegisterType_RiskMEHeader; "Risk M&E Header"."Risk Register Type")
            {
            }
            column(RiskManagementPlanID_RiskMEHeader; "Risk M&E Header"."Risk Management Plan ID")
            {
            }
            column(Description_RiskMEHeader; "Risk M&E Header".Description)
            {
            }
            column(ProjectID_RiskMEHeader; "Risk M&E Header"."Project ID")
            {
            }
            column(DirectorateID_RiskMEHeader; "Risk M&E Header"."Directorate ID")
            {
            }
            column(DepartmentID_RiskMEHeader; "Risk M&E Header"."Department ID")
            {
            }
            column(ResponsibleOfficerNo_RiskMEHeader; "Risk M&E Header"."Responsible Officer No.")
            {
            }
            column(RiskLikelihoodRateScaleID_RiskMEHeader; "Risk M&E Header"."Risk Likelihood Rate Scale ID")
            {
            }
            column(RiskImpactRatingScaleID_RiskMEHeader; "Risk M&E Header"."Risk Impact Rating Scale ID")
            {
            }
            column(OverallRiskRatingScaleID_RiskMEHeader; "Risk M&E Header"."Overall Risk Rating Scale ID")
            {
            }
            column(RiskAppetiteRatingScaleID_RiskMEHeader; "Risk M&E Header"."Risk Appetite Rating Scale ID")
            {
            }
            column(ReportStartDate_RiskMEHeader; "Risk M&E Header"."Report Start Date")
            {
            }
            column(ReportEndDate_RiskMEHeader; "Risk M&E Header"."Report End Date")
            {
            }
            column(Posted_RiskMEHeader; "Risk M&E Header".Posted)
            {
            }
            dataitem("New Risk Voucher Line"; "New Risk Voucher Line")
            {
                DataItemLink = "Document No" = field("Document No"), "Document Type" = field("Document Type");
                column(DocumentType_NewRiskVoucherLine; "New Risk Voucher Line"."Document Type")
                {
                }
                column(DocumentNo_NewRiskVoucherLine; "New Risk Voucher Line"."Document No")
                {
                }
                column(RiskID_NewRiskVoucherLine; "New Risk Voucher Line"."Risk ID")
                {
                }
                column(RiskCategory_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Category")
                {
                }
                column(RiskTitle_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Title")
                {
                }
                column(RiskSourceID_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Source ID")
                {
                }
                column(RiskLikelihoodCode_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Likelihood Code")
                {
                }
                column(RiskImpactCode_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Impact Code")
                {
                }
                column(RiskImpactType_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Impact Type")
                {
                }
                column(EstimateFinImpactLCY_NewRiskVoucherLine; "New Risk Voucher Line"."Estimate Fin. Impact (LCY)")
                {
                }
                column(EstimateDelayImpactDays_NewRiskVoucherLine; "New Risk Voucher Line"."Estimate Delay Impact (Days)")
                {
                }
                column(GenRiskResponseStrategy_NewRiskVoucherLine; "New Risk Voucher Line"."Gen. Risk Response Strategy")
                {
                }
                column(DateRaised_NewRiskVoucherLine; "New Risk Voucher Line"."Date Raised")
                {
                }
                column(RiskStatus_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Status")
                {
                }
                column(RiskManagementPlanID_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Management Plan ID")
                {
                }
                column(RiskLikelihoodRateScaleID_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Likelihood Rate Scale ID")
                {
                }
                column(RiskImpactRatingScaleID_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Impact Rating Scale ID")
                {
                }
                column(OverallRiskRatingScaleID_NewRiskVoucherLine; "New Risk Voucher Line"."Overall Risk Rating Scale ID")
                {
                }
                column(RiskAppetiteRatingScaleID_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Appetite Rating Scale ID")
                {
                }
                column(RiskLikelihoodRating_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Likelihood Rating")
                {
                }
                column(RiskImpactRating_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Impact Rating")
                {
                }
                column(OveralRiskRating_NewRiskVoucherLine; "New Risk Voucher Line"."Overal Risk Rating")
                {
                }
                column(OverallRiskLevelCode_NewRiskVoucherLine; "New Risk Voucher Line"."Overall Risk Level Code")
                {
                }
                column(RiskHeatZone_NewRiskVoucherLine; "New Risk Voucher Line"."Risk Heat Zone")
                {
                }
                column(NoofPlanedRiskRespActns_NewRiskVoucherLine; "New Risk Voucher Line"."No. of Planed Risk Resp. Actns")
                {
                }
                column(NoofImpactedProjectTasks_NewRiskVoucherLine; "New Risk Voucher Line"."No. of Impacted Project Tasks")
                {
                }
                dataitem("New Risk Line Ownership"; "New Risk Line Ownership")
                {
                    DataItemLink = "Risk ID" = field("Risk ID");
                    column(DocumentType_NewRiskLineOwnership; "New Risk Line Ownership"."Document Type")
                    {
                    }
                    column(DocumentNo_NewRiskLineOwnership; "New Risk Line Ownership"."Document No")
                    {
                    }
                    column(RiskID_NewRiskLineOwnership; "New Risk Line Ownership"."Risk ID")
                    {
                    }
                    column(ResponsibilityCenterID_NewRiskLineOwnership; "New Risk Line Ownership"."Responsibility Center ID")
                    {
                    }
                    column(Desciption_NewRiskLineOwnership; "New Risk Line Ownership".Desciption)
                    {
                    }
                    column(ResponsibleOfficerNo_NewRiskLineOwnership; "New Risk Line Ownership"."Responsible Officer No.")
                    {
                    }
                    dataitem("New Risk Line Resp. Action"; "New Risk Line Resp. Action")
                    {
                        DataItemLink = "Risk ID" = field("Risk ID");
                        column(DocumentType_NewRiskLineRespAction; "New Risk Line Resp. Action"."Document Type")
                        {
                        }
                        column(DocumentNo_NewRiskLineRespAction; "New Risk Line Resp. Action"."Document No")
                        {
                        }
                        column(RiskID_NewRiskLineRespAction; "New Risk Line Resp. Action"."Risk ID")
                        {
                        }
                        column(ActionID_NewRiskLineRespAction; "New Risk Line Resp. Action"."Action ID")
                        {
                        }
                        column(ActivityDescription_NewRiskLineRespAction; "New Risk Line Resp. Action"."Activity Description")
                        {
                        }
                        column(ResponsibleOfficerNo_NewRiskLineRespAction; "New Risk Line Resp. Action"."Responsible Officer No.")
                        {
                        }
                        column(ActionStatus_NewRiskLineRespAction; "New Risk Line Resp. Action"."Action Status")
                        {
                        }
                        column(PercentageComplete_NewRiskLineRespAction; "New Risk Line Resp. Action"."Percentage Complete")
                        {
                        }
                        column(TaskPriority_NewRiskLineRespAction; "New Risk Line Resp. Action"."Task Priority")
                        {
                        }
                        column(PlannedStartDate_NewRiskLineRespAction; "New Risk Line Resp. Action"."Planned Start Date")
                        {
                        }
                        column(PlannedDueDate_NewRiskLineRespAction; "New Risk Line Resp. Action"."Planned Due Date")
                        {
                        }
                        column(ActualDateDone_NewRiskLineRespAction; "New Risk Line Resp. Action"."Actual Date Done")
                        {
                        }
                        column(ActionType_NewRiskLineRespAction; "New Risk Line Resp. Action"."Action Type")
                        {
                        }
                        column(RiskRegisterType_NewRiskLineRespAction; "New Risk Line Resp. Action"."Risk Register Type")
                        {
                        }
                        column(RiskManagementPlanID_NewRiskLineRespAction; "New Risk Line Resp. Action"."Risk Management Plan ID")
                        {
                        }
                        column(RiskActionTaken_NewRiskLineRespAction; "New Risk Line Resp. Action"."Risk Action Taken")
                        {
                        }
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

