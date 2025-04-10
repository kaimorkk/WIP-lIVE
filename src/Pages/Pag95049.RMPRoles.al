

page 95049 "RMP Roles"
{
    CardPageID = "RMP Role";
    PageType = List;
    SourceTable = "RMP Role";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Risk & Compliance Roles';
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Responsible Team")
            {
                ApplicationArea = Basic;
                Image = ResourcePlanning;
                RunObject = Page "RMP Enterprise Risk Mgt Teams";
            }
            action("Default Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Default;
                RunObject = Page "Risk Mgt. Responsibilities";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Responsible Team_Promoted"; "Responsible Team")
                {
                }
                actionref("Default Responsibilities_Promoted"; "Default Responsibilities")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

