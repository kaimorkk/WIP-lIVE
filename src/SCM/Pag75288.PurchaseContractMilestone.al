

page 75288 "Purchase Contract Milestone"
{
    PageType = List;
    SourceTable = "Purchase Contract Milestone";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Milestone Code"; Rec."Milestone Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Instalment Code"; Rec."Payment Instalment Code")
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

