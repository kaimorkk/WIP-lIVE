

page 80215 "Policy Thematic Area Revision"
{
    PageType = ListPart;
    SourceTable = "Policy Thematic Area Revision";

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
                field("Implementation Percentage"; Rec."Implementation Percentage")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Lines)
            {
                Caption = 'Line';
                Image = Calculator;
                action("Policy Sub Thematic Areas")
                {
                    ApplicationArea = Basic;
                    Image = "Action";
                    RunObject = Page "Policy Sub Thematic Areas rev";
                }
            }
        }
    }
}

#pragma implicitwith restore

