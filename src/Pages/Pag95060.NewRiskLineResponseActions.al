

page 95060 "New Risk Line Response Actions"
{
    CardPageID = "New Risk Line Response Action";
    PageType = List;
    SourceTable = "New Risk Line Resp. Action";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk ID field.';
                }
                field("Action ID"; Rec."Action ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action ID field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Risk Action Taken"; Rec."Risk Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Status1';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Status1 field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer Name field.';
                }
                field("Risk Response Action Taken"; Rec."Risk Response Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Status';
                    ToolTip = 'Specifies the value of the Risk Status field.';
                }
                field(Timeline; Rec.Timeline)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Timeline field.';
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Status field.';
                }
                field("Percentage Complete"; Rec."Percentage Complete")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Percentage Complete field.';
                }
                field("Task Priority"; Rec."Task Priority")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Task Priority field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                    Caption = 'Actual Start Date';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Actual Start Date field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Planned Due Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

