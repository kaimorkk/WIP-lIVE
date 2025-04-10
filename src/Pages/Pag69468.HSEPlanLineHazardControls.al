

page 69468 "HSE Plan Line Hazard Controls"
{
    CardPageID = "HSE Plan Line Hazard Control";
    PageType = List;
    SourceTable = "HSE Plan Line Hazard Control";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Plan ID"; Rec."Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Plan ID field.';
                }
                field("Hazard ID"; Rec."Hazard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard ID field.';
                }
                field("Hazard Type"; Rec."Hazard Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Type field.';
                }
                field("Control ID"; Rec."Control ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Control ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Action Status"; Rec."Action Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Status field.';
                }
                field("% Complete"; Rec."% Complete")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the % Complete field.';
                }
                field("Task Priority"; Rec."Task Priority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task Priority field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned Due Date"; Rec."Planned Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Due Date field.';
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Date Done field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

