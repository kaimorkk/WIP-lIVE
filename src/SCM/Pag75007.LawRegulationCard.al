

page 75007 "Law & Regulation Card"
{
    PageType = Card;
    SourceTable = "Procurement Law & Regulation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Versions"; Rec."No. of Versions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Versions field.';
                }
                field("Current Version No"; Rec."Current Version No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Version No field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
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
                ToolTip = 'Executes the Versions action.';
            }
            action("Procurement Disputes")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Procurement Disputes action.';
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

