

page 95177 "Audit Project Schedules"
{
    CardPageID = "Audit Project Schedule";
    PageType = List;
    SourceTable = "Audit Project Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Audit Phase"; Rec."Audit Phase")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Phase field.';
                }
                field("Task No."; Rec."Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Task No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Audit Duration (Days)"; Rec."Audit Duration (Days)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Duration (Days) field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Completion %"; Rec."Completion %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion % field.';
                }
                field("Lead Auditor ID"; Rec."Lead Auditor ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditor ID field.';
                }
                field("Lead Auditee Representative ID"; Rec."Lead Auditee Representative ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead Auditee Representative ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

