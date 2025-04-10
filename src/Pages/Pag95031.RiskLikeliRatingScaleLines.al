

page 95031 "Risk Likeli Rating Scale Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Rating Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Min Probability Percentage"; Rec."Min Probability Percentage")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Max Probability Percentage"; Rec."Max Probability Percentage")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Criteria"; Rec."No. of Criteria")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Rating Score"; Rec."Rating Score")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Rating"; Rec."Actual Rating")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = '&Line';
                action("Probability Criteria")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    RunObject = Page "Risk Rating Criteria";
                    RunPageLink = "Risk Rating Scale Type" = filter("Likelihood Rating"),
                                  "Rating Scale ID" = field("Rating Scale ID"),
                                  Code = field(Code);
                }
            }
        }
    }
}

#pragma implicitwith restore

