

page 95296 "Audit Implementation Log Line"
{
    PageType = Card;
    SourceTable = "Audit Implementation Log Line";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Auditee Implementation Status"; Rec."Auditee Implementation Status")
                {
                    ApplicationArea = Basic;
                    Caption = ' Implementation Status';
                    ToolTip = 'Specifies the value of the  Implementation Status field.';
                }
                field("Auditee % Complete"; Rec."Auditee % Complete")
                {
                    ApplicationArea = Basic;
                    Caption = '% Complete';
                    ToolTip = 'Specifies the value of the % Complete field.';
                }
                field("Auditee Comments"; Rec."Auditee Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Comments';
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Date Done field.';
                }
                field("Requested Revised Date"; Rec."Requested Revised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Revised Date field.';
                }
                field("Final Audit Report ID"; Rec."Final Audit Report ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Audit Report ID field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Checklist ID"; Rec."Checklist ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checklist ID field.';
                }
                field("Finding ID"; Rec."Finding ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finding ID field.';
                }
                field("Management Action ID"; Rec."Management Action ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Action ID field.';
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
                field("Auditor Followup Review Status"; Rec."Auditor Followup Review Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Followup Review Status field.';
                }
                field("Last Followup Audit Voucher ID"; Rec."Last Followup Audit Voucher ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Followup Audit Voucher ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

