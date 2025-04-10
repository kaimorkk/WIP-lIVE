

page 95299 "Audit Management Actions"
{
    PageType = List;
    SourceTable = "Audit Management Action";

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
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Finding Name"; Rec."Finding Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finding Name field.';
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Finding ID field.';
                }
                field("Management Action ID"; Rec."Management Action ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Management Action ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary RC ID"; Rec."Primary RC ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary RC ID field.';
                }
                field("Action Owner ID"; Rec."Action Owner ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Owner ID field.';
                }
                field("Action Owner Name"; Rec."Action Owner Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Owner Name field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Action Type"; Rec."Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Type field.';
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
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("Audit Objective ID"; Rec."Audit Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Objective ID field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Posted Mgt Action Entry No."; Rec."Posted Mgt Action Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Mgt Action Entry No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

