report 95005 "Ovrl Risk Rating Scale Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Ovrl Risk Rating Scale Report.rdlc';

    dataset
    {
        dataitem("Risk Rating Scale"; "Risk Rating Scale")
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
            column(RiskRatingScaleType_RiskRatingScale; "Risk Rating Scale"."Risk Rating Scale Type")
            {
            }
            column(RatingScaleID_RiskRatingScale; "Risk Rating Scale"."Rating Scale ID")
            {
            }
            column(Description_RiskRatingScale; "Risk Rating Scale".Description)
            {
            }
            column(AdditionalComments_RiskRatingScale; "Risk Rating Scale"."Additional Comments")
            {
            }
            column(EffectiveDate_RiskRatingScale; "Risk Rating Scale"."Effective Date")
            {
            }
            dataitem("Risk Rating Scale Line"; "Risk Rating Scale Line")
            {
                DataItemLink = "Rating Scale ID" = field("Rating Scale ID"), "Risk Rating Scale Type" = field("Risk Rating Scale Type");
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
                dataitem("Risk Rating Criteria"; "Risk Rating Criteria")
                {
                    DataItemLink = "Risk Rating Scale Type" = field("Risk Rating Scale Type"), "Rating Scale ID" = field("Rating Scale ID"), Code = field(Code);
                    column(RiskRatingScaleType_RiskRatingCriteria; "Risk Rating Criteria"."Risk Rating Scale Type")
                    {
                    }
                    column(RatingScaleID_RiskRatingCriteria; "Risk Rating Criteria"."Rating Scale ID")
                    {
                    }
                    column(Code_RiskRatingCriteria; "Risk Rating Criteria".Code)
                    {
                    }
                    column(CriterionID_RiskRatingCriteria; "Risk Rating Criteria"."Criterion ID")
                    {
                    }
                    column(Description_RiskRatingCriteria; "Risk Rating Criteria".Description)
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

