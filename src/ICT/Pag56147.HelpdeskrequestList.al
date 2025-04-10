

page 56147 "Helpdesk request List"
{
    Editable = false;
    PageType = List;
    SourceTable = "ICT Helpdesk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field("HelpDesk Category"; Rec."HelpDesk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HelpDesk Category field.';
                }
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
                field("ICT Inventory"; Rec."ICT Inventory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory field.';
                }
                field("ICT Inventory Name"; Rec."ICT Inventory Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
                field("Assigned Time"; Rec."Assigned Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Time field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
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

