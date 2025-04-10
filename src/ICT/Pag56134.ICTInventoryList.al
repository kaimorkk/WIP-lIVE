

page 56134 "ICT Inventory List"
{
    CardPageID = "ICT Inventory";
    Editable = false;
    PageType = List;
    SourceTable = "ICT Inventory";


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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Sub-Type"; Rec."Sub-Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub-Type field.';
                }
                field("Sub Type No."; Rec."Sub Type No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sub Type No. field.';
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location Code field.';
                }
                field("ICT Asset Category"; Rec."ICT Asset Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Asset Category field.';
                }
                field("ICT Asset subcategory"; Rec."ICT Asset subcategory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Asset subcategory field.';
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Assigned Employee field.';
                }
                field("Current Assigned Division/Unit"; Rec."Current Assigned Division/Unit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Assigned Division/Unit field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
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

