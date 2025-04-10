

page 80095 "Performance Plan Guideline"
{
    PageType = Card;
    SourceTable = "Performance Plan Guideline";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Policy/Guideline ID"; Rec."Policy/Guideline ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

