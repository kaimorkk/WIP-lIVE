

page 69559 "Succession Template Card"
{
    PageType = Document;
    SourceTable = "Succession Template";

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General Details';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control14; "Succession Template Lines")
            {
                SubPageLink = "Document No" = field(Code),
                              "Position ID" = field("Position ID");
                ApplicationArea = Basic;
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
        area(processing)
        {
            action("Initiative Categories")
            {
                ApplicationArea = Basic;
                Image = ApplyEntries;
                RunObject = Page "Succession Template Category";
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                actionref("Initiative Categories_Promoted"; "Initiative Categories")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

