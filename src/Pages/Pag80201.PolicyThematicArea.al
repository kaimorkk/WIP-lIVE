

page 80201 "Policy Thematic Area"
{
    PageType = ListPart;
    SourceTable = "Policy Thematic Area";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
            action("Policy Sub Thematic Areas")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "Policy Sub Thematic Areas";
                RunPageLink = "Policy ID" = field("Policy ID"),
                              "Thematic Code" = field(Code);
            }
        }
    }
}

#pragma implicitwith restore

