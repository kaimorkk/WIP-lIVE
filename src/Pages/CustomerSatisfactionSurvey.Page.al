Page 52193932 "Customer Satisfaction Survey"
{
    PageType = Card;
    SourceTable = "Customer Satisfaction Survey1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(SurveyID;"Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field(Title;Title)
                {
                    ApplicationArea = Basic;
                }
                field(DateStarted;"Date Started")
                {
                    ApplicationArea = Basic;
                }
                field(DateEnded;"Date Ended")
                {
                    ApplicationArea = Basic;
                }
                field(SurveyStage;"Survey Stage")
                {
                    ApplicationArea = Basic;
                }
                field(SurveyStageDescription;"Survey Stage Description")
                {
                    ApplicationArea = Basic;
                }
                field(ImplementingAgencyNo;"Implementing Agency No")
                {
                    ApplicationArea = Basic;
                }
                field(ImplementingAgencyName;"Implementing Agency Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control1000000013;"Survey Stages")
            {
                SubPageLink = "Survey ID"=field("Survey ID");
            }
        }
    }

    actions
    {
    }
}

