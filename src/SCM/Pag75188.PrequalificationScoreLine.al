

page 75188 "Prequalification Score Line"
{
    PageType = ListPart;
    SourceTable = "Prequalification Score Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Evaluation Requirement"; Rec."Evaluation Requirement")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Bid Response Actual Qty"; Rec."Bid Response Actual Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Target Value"; Rec."Target Value")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Weighted Line Score"; Rec."Weighted Line Score")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Evaluation Results"; Rec."Evaluation Results")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                Caption = 'Line';
                action("Bid Evaluation Score Guide")
                {
                    ApplicationArea = Basic;
                    Image = AllLines;
                    RunObject = Page "Bid Evaluation Score Guide";
                    RunPageLink = "Template ID" = field("Rating Template ID"),
                                  "Criteria Group ID" = field("Criteria Group"),
                                  "Requirement ID" = field("Checklist ID");
                }
            }
        }
    }
}

#pragma implicitwith restore

