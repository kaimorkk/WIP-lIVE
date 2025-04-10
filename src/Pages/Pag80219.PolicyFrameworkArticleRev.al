

page 80219 "Policy Framework Article Rev"
{
    PageType = List;
    SourceTable = "Policy Framework Article Rev";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Framework Code"; Rec."Framework Code")
                {
                    ApplicationArea = Basic;
                }
                field("Implication ID"; Rec."Implication ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Revision No."; Rec."Revision No.")
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

