

page 80216 "Policy Statement Revision"
{
    PageType = List;
    SourceTable = "Policy Statement Revision";

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
                field("Area"; Rec."Area")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Statement"; Rec."Policy Statement")
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

