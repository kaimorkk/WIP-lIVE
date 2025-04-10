

page 75006 "Procurement Law & Regulation"
{
    CardPageID = "Law & Regulation Card";
    PageType = List;
    SourceTable = "Procurement Law & Regulation";
    UsageCategory = Administration;
    ApplicationArea = All;

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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Versions"; Rec."No. of Versions")
                {
                    ApplicationArea = Basic;
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Versions)
            {
                ApplicationArea = Basic;
                Image = Versions;
                RunObject = Page "Proc Regulation Version";
                RunPageLink = "Primary Document No" = field(Code);
            }
            action("Procurement Disputes")
            {
                ApplicationArea = Basic;
                Caption = 'Procurement Disputes';
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Versions_Promoted; Versions)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

