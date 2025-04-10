

page 69714 "Application Attached Documents"
{
    PageType = List;
    SourceTable = "Application Filled Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("HR Document Type"; Rec."HR Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HR Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("File Name"; Rec."File Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Name field.';
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Extension field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
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

