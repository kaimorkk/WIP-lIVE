report 95007 "Risk Status Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Risk Status Report.rdlc';
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
            dataitem("Risk Status Report Line"; "Risk Status Report Line")
            {
                DataItemLink = "Document No" = field("Document No");
                column(DocumentType_RiskStatusReportLine; "Risk Status Report Line"."Document Type")
                {
                }
                column(DocumentNo_RiskStatusReportLine; "Risk Status Report Line"."Document No")
                {
                }
                column(RiskManagementPlanID_RiskStatusReportLine; "Risk Status Report Line"."Risk Management Plan ID")
                {
                }
                column(RiskID_RiskStatusReportLine; "Risk Status Report Line"."Risk ID")
                {
                }
                column(RiskTitle_RiskStatusReportLine; "Risk Status Report Line"."Risk Title")
                {
                }
                column(RiskLikelihoodCode_RiskStatusReportLine; "Risk Status Report Line"."Risk Likelihood Code")
                {
                }
                column(RiskImpactCode_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Code")
                {
                }
                column(RiskImpactType_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Type")
                {
                }
                column(EstimateFinImpactLCY_RiskStatusReportLine; "Risk Status Report Line"."Estimate Fin. Impact (LCY)")
                {
                }
                column(EstimateDelayImpactDays_RiskStatusReportLine; "Risk Status Report Line"."Estimate Delay Impact (Days)")
                {
                }
                column(GenRiskResponseStrategy_RiskStatusReportLine; "Risk Status Report Line"."Gen. Risk Response Strategy")
                {
                }
                column(RiskStatus_RiskStatusReportLine; "Risk Status Report Line"."Risk Status")
                {
                }
                column(DateClosed_RiskStatusReportLine; "Risk Status Report Line"."Date Closed")
                {
                }
                column(RiskLikelihoodRateScaleID_RiskStatusReportLine; "Risk Status Report Line"."Risk Likelihood Rate Scale ID")
                {
                }
                column(RiskImpactRatingScaleID_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Rating Scale ID")
                {
                }
                column(OverallRiskRatingScaleID_RiskStatusReportLine; "Risk Status Report Line"."Overall Risk Rating Scale ID")
                {
                }
                column(RiskAppetiteRatingScaleID_RiskStatusReportLine; "Risk Status Report Line"."Risk Appetite Rating Scale ID")
                {
                }
                column(RiskLikelihoodRating_RiskStatusReportLine; "Risk Status Report Line"."Risk Likelihood Rating")
                {
                }
                column(RiskImpactRating_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Rating")
                {
                }
                column(OveralRiskRating_RiskStatusReportLine; "Risk Status Report Line"."Overal Risk Rating")
                {
                }
                column(OverallRiskLevelCode_RiskStatusReportLine; "Risk Status Report Line"."Overall Risk Level Code")
                {
                }
                column(RiskHeatZone_RiskStatusReportLine; "Risk Status Report Line"."Risk Heat Zone")
                {
                }
                column(NoofActualRiskRespActns_RiskStatusReportLine; "Risk Status Report Line"."No. of Actual Risk Resp. Actns")
                {
                }
                column(RiskLikelihoodActualRating_RiskStatusReportLine; "Risk Status Report Line"."Risk Likelihood Actual Rating")
                {
                }
                column(RiskImpactActualRating_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Actual Rating")
                {
                }
                column(RiskImpactCodes_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Codes")
                {
                }
                column(RiskImpactDescription_RiskStatusReportLine; "Risk Status Report Line"."Risk Impact Description")
                {
                }
                column(StrategicPillarDescription_RiskStatusReportLine; "Risk Status Report Line"."Strategic Pillar Description")
                {
                }
                column(RiskSourceID_RiskStatusReportLine; "Risk Status Report Line"."Risk Source ID")
                {
                }
                dataitem("RMP Line Risk Ownership"; "RMP Line Risk Ownership")
                {
                    DataItemLink = "Document No" = field("Document No"), "Risk ID" = field("Risk ID");
                    column(ResponsibleOfficerNo_RMPLineRiskOwnership; "RMP Line Risk Ownership"."Responsible Officer No.")
                    {
                    }
                    column(ResponsibleOfficerName_RMPLineRiskOwnership; "RMP Line Risk Ownership"."Responsible Officer Name")
                    {
                    }
                }
                dataitem("RMP Line Response Action"; "RMP Line Response Action")
                {
                    DataItemLink = "Document No" = field("Document No"), "Risk ID" = field("Risk ID");
                    column(ActivityDescription_RMPLineResponseAction; "RMP Line Response Action"."Activity Description")
                    {
                    }
                    column(ActionStatus_RMPLineResponseAction; "RMP Line Response Action"."Action Status")
                    {
                    }
                    column(PlannedDueDate_RMPLineResponseAction; "RMP Line Response Action"."Planned Due Date")
                    {
                    }
                    column(ResponsibleOfficerName_RMPLineResponseAction; "RMP Line Response Action"."Responsible Officer Name")
                    {
                    }
                    column(RiskResponseActionTaken_RMPLineResponseAction; "RMP Line Response Action"."Risk Response Action Taken")
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

