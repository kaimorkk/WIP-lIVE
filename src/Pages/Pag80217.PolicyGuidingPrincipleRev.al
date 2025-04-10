

page 80217 "Policy Guiding Principle Rev"
{
    PageType = List;
    SourceTable = "Policy Guiding Principle Rev";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Revision No."; Rec."Revision No.")
                {
                    ApplicationArea = Basic;
                }
                field("Policy ID"; Rec."Policy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Code"; Rec.Code)
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

