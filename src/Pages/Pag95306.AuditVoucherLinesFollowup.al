

page 95306 "Audit Voucher Lines Followup"
{
    PageType = ListPart;
    SourceTable = "Followup Audit Voucher Line";

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
                field("Auditor Followup Review Status"; Rec."Auditor Followup Review Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Followup Review Status';
                    ToolTip = 'Specifies the value of the Followup Review Status field.';
                }
                field("Auditor Followup Comments"; Rec."Auditor Followup Comments")
                {
                    ApplicationArea = Basic;
                    Caption = ' Followup Comments';
                    ToolTip = 'Specifies the value of the  Followup Comments field.';
                }
                field("Auditee Implementation Status"; Rec."Auditee Implementation Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'Implementation Status';
                    ToolTip = 'Specifies the value of the Implementation Status field.';
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
                field("Last Posted Impl. Status Repor"; Rec."Last Posted Impl. Status Repor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Posted Impl. Status Repor field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

