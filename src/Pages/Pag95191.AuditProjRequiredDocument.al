

page 95191 "Audit Proj Required Document"
{
    PageType = Card;
    SourceTable = "Audit Proj Required Document";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Procedure ID"; Rec."Audit Procedure ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Procedure ID field.';
                }
                field("Preferred Format"; Rec."Preferred Format")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Preferred Format field.';
                }
                field("Submission Deadline"; Rec."Submission Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Deadline field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
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
                field("Date Requested"; Rec."Date Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Requested field.';
                }
                field("Date Submitted"; Rec."Date Submitted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Submitted field.';
                }
                field("Submission Status"; Rec."Submission Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Status field.';
                }
                field("No. of Filed Audit Papers"; Rec."No. of Filed Audit Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Filed Audit Papers field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

