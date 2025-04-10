

page 95293 "Audit Management Action Legers"
{
    PageType = List;
    SourceTable = "Audit Management Action Ledger";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
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
                field("Auditee Implementation Status"; Rec."Auditee Implementation Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Implementation Status field.';
                }
                field("Auditee % Complete"; Rec."Auditee % Complete")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee % Complete field.';
                }
                field("Actual Date Done"; Rec."Actual Date Done")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Date Done field.';
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
                field("Auditor Followup Comments"; Rec."Auditor Followup Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Followup Comments field.';
                }
                field("Last Posted Impl. Status Repot"; Rec."Last Posted Impl. Status Repot")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Posted Impl. Status Repot field.';
                }
                field("Last Posted Fol. Audit Voucher"; Rec."Last Posted Fol. Audit Voucher")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Posted Fol. Audit Voucher field.';
                }
                field("Last Auditor Review Date"; Rec."Last Auditor Review Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Auditor Review Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

