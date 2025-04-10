

page 69101 "Benefits Attachments"
{
    PageType = List;
    SourceTable = "Benefits Attachments";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Category"; Rec."Benefit Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Category field.';
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Description field.';
                }
                field("Attachment Code"; Rec."Attachment Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Code field.';
                }
                field("Attachment Description"; Rec."Attachment Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Description field.';
                }
                field("Attachment Type"; Rec."Attachment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachment Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

