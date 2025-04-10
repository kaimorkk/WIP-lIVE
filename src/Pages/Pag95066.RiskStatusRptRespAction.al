

page 95066 "Risk Status Rpt Resp. Action"
{
    PageType = Card;
    SourceTable = "Risk Status Rpt Resp. Action";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Register Type"; Rec."Risk Register Type")
                {
                    ApplicationArea = Basic;
                }
                field("Risk Management Plan ID"; Rec."Risk Management Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                }
                field("Action ID"; Rec."Action ID")
                {
                    ApplicationArea = Basic;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
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

