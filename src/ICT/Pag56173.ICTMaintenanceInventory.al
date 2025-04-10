

page 56173 "ICT Maintenance Inventory"
{
    PageType = List;
    SourceTable = "ICT Maintenance Inventory";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("ICT Inventory"; Rec."ICT Inventory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("ICT Category"; Rec."ICT Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Category field.';
                }
                field("ICT Sub Category"; Rec."ICT Sub Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Sub Category field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
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

