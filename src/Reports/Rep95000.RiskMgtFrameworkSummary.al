report 95000 "Risk Mgt Framework Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Risk Mgt Framework Summary.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Risk Management Framework"; "Risk Management Framework")
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
            column(PrimaryKey_RiskManagementFramework; "Risk Management Framework"."Primary Key")
            {
            }
            column(Description_RiskManagementFramework; "Risk Management Framework".Description)
            {
            }
            column(ExternalDocumentNo_RiskManagementFramework; "Risk Management Framework"."External Document No")
            {
            }
            column(OrganizationName_RiskManagementFramework; "Risk Management Framework"."Organization Name")
            {
            }
            column(PrimaryPurpose_RiskManagementFramework; "Risk Management Framework"."Primary Purpose")
            {
            }
            column(OverallResponsibility_RiskManagementFramework; "Risk Management Framework"."Overall Responsibility")
            {
            }
            column(LastRevisionDate_RiskManagementFramework; "Risk Management Framework"."Last Revision Date")
            {
            }
            column(DefaultRiskLRScaleID_RiskManagementFramework; "Risk Management Framework"."Default Risk LR Scale ID")
            {
            }
            column(DefaultRiskImpactRScale_RiskManagementFramework; "Risk Management Framework"."Default Risk Impact R. Scale")
            {
            }
            column(DefaultOverallRRScaleID_RiskManagementFramework; "Risk Management Framework"."Default Overall RR Scale ID")
            {
            }
            column(DefaultRiskARScaleID_RiskManagementFramework; "Risk Management Framework"."Default Risk AR Scale ID")
            {
            }
            column(NoOfRiskMgtPlans_RiskManagementFramework; "Risk Management Framework"."No. Of Risk Mgt Plans")
            {
            }
            column(CorporateRiskMgtPlanNos_RiskManagementFramework; "Risk Management Framework"."Corporate Risk Mgt Plan Nos.")
            {
            }
            column(FunctionalRiskMgtPlanNos_RiskManagementFramework; "Risk Management Framework"."Functional Risk Mgt Plan Nos.")
            {
            }
            column(ProjectRiskMgtPlanNos_RiskManagementFramework; "Risk Management Framework"."Project Risk Mgt Plan Nos.")
            {
            }
            column(DirectorateRiskMgtPlanNos_RiskManagementFramework; "Risk Management Framework"."Directorate Risk Mgt Plan Nos.")
            {
            }
            column(DepartmentaRiskMgtPlanNos_RiskManagementFramework; "Risk Management Framework"."Departmenta Risk Mgt Plan Nos.")
            {
            }
            column(RegionalRiskMgtPlanNos_RiskManagementFramework; "Risk Management Framework"."Regional Risk Mgt Plan Nos.")
            {
            }
            column(RiskIncidentNos_RiskManagementFramework; "Risk Management Framework"."Risk Incident Nos.")
            {
            }
            dataitem("Risk Mgt Framework Detail"; "Risk Mgt Framework Detail")
            {
                column(PrimaryKey_RiskMgtFrameworkDetail; "Risk Mgt Framework Detail"."Primary Key")
                {
                }
                column(RMFSection_RiskMgtFrameworkDetail; "Risk Mgt Framework Detail"."RMF Section")
                {
                }
                column(LineNo_RiskMgtFrameworkDetail; "Risk Mgt Framework Detail"."Line No")
                {
                }
                column(Description_RiskMgtFrameworkDetail; "Risk Mgt Framework Detail".Description)
                {
                }
                column(GuidingPrincipleStatement_RiskMgtFrameworkDetail; "Risk Mgt Framework Detail"."Guiding Principle Statement")
                {
                }
            }
            dataitem("Risk Source"; "Risk Source")
            {
                column(SourceID_RiskSource; "Risk Source"."Source ID")
                {
                }
                column(Description_RiskSource; "Risk Source".Description)
                {
                }
                column(NoOfRiskCategories_RiskSource; "Risk Source"."No. Of Risk Categories")
                {
                }
                column(NoOfRisks_RiskSource; "Risk Source"."No. Of Risks")
                {
                }
            }
            dataitem("Risk Category"; "Risk Category")
            {
                column(Code_RiskCategory; "Risk Category".Code)
                {
                }
                column(Description_RiskCategory; "Risk Category".Description)
                {
                }
                column(RiskSourceID_RiskCategory; "Risk Category"."Risk Source ID")
                {
                }
                column(AddditionaComments_RiskCategory; "Risk Category"."Addditiona Comments")
                {
                }
                column(NoofRiskTriggers_RiskCategory; "Risk Category"."No. of Risk Triggers")
                {
                }
                column(NoofStrategicRisks_RiskCategory; "Risk Category"."No of Strategic Risks")
                {
                }
                column(NoofOperationalRisks_RiskCategory; "Risk Category"."No of Operational Risks")
                {
                }
                column(NoofProjectRisks_RiskCategory; "Risk Category"."No of Project Risks")
                {
                }
                column(NoofIncidents_RiskCategory; "Risk Category"."No. of Incidents")
                {
                }
            }
            dataitem(Stakeholder; Stakeholder)
            {
                column(Code_Stakeholder; Stakeholder.Code)
                {
                }
                column(Description_Stakeholder; Stakeholder.Description)
                {
                }
                column(StakeholderType_Stakeholder; Stakeholder."Stakeholder Type")
                {
                }
            }
            dataitem("Risk Identification Method"; "Risk Identification Method")
            {
                column(Code_RiskIdentificationMethod; "Risk Identification Method".Code)
                {
                }
                column(Description_RiskIdentificationMethod; "Risk Identification Method".Description)
                {
                }
            }
            dataitem("Risk Rating Scale Line"; "Risk Rating Scale Line")
            {
                column(RiskRatingScaleType_RiskRatingScaleLine; "Risk Rating Scale Line"."Risk Rating Scale Type")
                {
                }
                column(RatingScaeID_RiskRatingScaleLine; "Risk Rating Scale Line"."Rating Scale ID")
                {
                }
                column(Code_RiskRatingScaleLine; "Risk Rating Scale Line".Code)
                {
                }
                column(Description_RiskRatingScaleLine; "Risk Rating Scale Line".Description)
                {
                }
                column(MinProbabilityPercentage_RiskRatingScaleLine; "Risk Rating Scale Line"."Min Probability Percentage")
                {
                }
                column(MaxProbabilityPercentage_RiskRatingScaleLine; "Risk Rating Scale Line"."Max Probability Percentage")
                {
                }
                column(NoofCriteria_RiskRatingScaleLine; "Risk Rating Scale Line"."No. of Criteria")
                {
                }
                column(RatingScore_RiskRatingScaleLine; "Risk Rating Scale Line"."Rating Score")
                {
                }
                column(MinOverallRating_RiskRatingScaleLine; "Risk Rating Scale Line"."Min Overall Rating")
                {
                }
                column(MaxOverallRating_RiskRatingScaleLine; "Risk Rating Scale Line"."Max Overall Rating")
                {
                }
                column(DefaultRiskResponseStrategy_RiskRatingScaleLine; "Risk Rating Scale Line"."Default Risk Response Strategy")
                {
                }
                column(RiskHeatZone_RiskRatingScaleLine; "Risk Rating Scale Line"."Risk Heat Zone")
                {
                }
                column(NoofRiskResponseActions_RiskRatingScaleLine; "Risk Rating Scale Line"."No. of Risk Response Actions")
                {
                }
                column(RiskTakingPhilosophy_RiskRatingScaleLine; "Risk Rating Scale Line"."Risk Taking Philosophy")
                {
                }
                column(Tolerance_RiskRatingScaleLine; "Risk Rating Scale Line".Tolerance)
                {
                }
                column(Choice_RiskRatingScaleLine; "Risk Rating Scale Line".Choice)
                {
                }
                column(TradeOff_RiskRatingScaleLine; "Risk Rating Scale Line"."Trade-Off")
                {
                }
                column(LineNo_RiskRatingScaleLine; "Risk Rating Scale Line"."Line No")
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

