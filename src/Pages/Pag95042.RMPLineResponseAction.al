

page 95042 "RMP Line Response Action"
{
    PageType = Card;
    SourceTable = "RMP Line Response Action";

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
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                }
                field("Percentage Complete"; Rec."Percentage Complete")
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

