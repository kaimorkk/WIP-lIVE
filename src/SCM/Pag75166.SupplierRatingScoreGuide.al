

page 75166 "Supplier Rating Score Guide"
{
    PageType = List;
    SourceTable = "Supplier Rating Score Guide";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Appraisal Template ID"; Rec."Appraisal Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Template Type"; Rec."Template Type")
                {
                    ApplicationArea = Basic;
                }
                field("Criteria Group"; Rec."Criteria Group")
                {
                    ApplicationArea = Basic;
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                }
                field("Min Bid Value"; Rec."Min Bid Value")
                {
                    ApplicationArea = Basic;
                }
                field("Max Bid Value"; Rec."Max Bid Value")
                {
                    ApplicationArea = Basic;
                }
                field("Min Date Value"; Rec."Min Date Value")
                {
                    ApplicationArea = Basic;
                }
                field("Max Date Value"; Rec."Max Date Value")
                {
                    ApplicationArea = Basic;
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

