

page 56152 "ICT Inventory Brands"
{
    PageType = List;
    SourceTable = "ICT Brands";
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
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Brand Name"; Rec."Brand Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Brand Name field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

