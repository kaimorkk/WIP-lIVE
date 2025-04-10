

page 80168 "Policy Stakeholder"
{
    PageType = List;
    SourceTable = "Policy Stakeholder";

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
                field("Stakeholder Group ID"; Rec."Stakeholder Group ID")
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
        area(processing)
        {
            action("Policy Stakeholder Roles")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                RunObject = Page "Policy Stakeholder Roles";
                RunPageLink = "Policy ID" = field("Policy ID"),
                              Code = field(Code);
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Policy Stakeholder Roles_Promoted"; "Policy Stakeholder Roles")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

