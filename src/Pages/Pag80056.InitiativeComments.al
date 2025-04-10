

page 80056 "Initiative Comments"
{
    PageType = List;
    SourceTable = "Initiative Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workplan No."; Rec."Workplan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan No. field.';
                }
                field("Initiative No."; Rec."Initiative No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initiative No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Comment/Additional Notes"; Rec."Comment/Additional Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment/Additional Notes field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Last Update Date"; Rec."Last Update Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Update Date field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

