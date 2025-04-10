

page 80191 "Policy Revision Info Sources"
{
    PageType = List;
    SourceTable = "Policy Revision Info Sources";

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
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("URL Link"; Rec."URL Link")
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

