

page 95014 "Risk Mgt Framework Detail"
{
    Editable = true;
    PageType = List;
    SourceTable = "Risk Mgt Framework Detail";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("RMF Section"; Rec."RMF Section")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Guiding Principle';
                }
                field("Guiding Principle Statement"; Rec."Guiding Principle Statement")
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
            group("&Line Functions")
            {
                action("Risk Sources")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    RunObject = Page "Risk Sources";
                    Visible = false;
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Risk Sources_Promoted"; "Risk Sources")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

