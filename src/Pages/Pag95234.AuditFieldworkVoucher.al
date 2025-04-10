

page 95234 "Audit Fieldwork Voucher"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Audit Execution Header";

    layout
    {
        area(content)
        {
            group(General)
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
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Lead ID"; Rec."Audit Lead ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Lead ID field.';
                }
                field("No. Of Findings"; Rec."No. Of Findings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Findings field.';
                }
                field("No. of Audit Recommendations"; Rec."No. of Audit Recommendations")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Audit Recommendations field.';
                }
                field("No. of Filed Audit Wor  Papers"; Rec."No. of Filed Audit Wor  Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Filed Audit Wor  Papers field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created DateTime"; Rec."Created DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created DateTime field.';
                }
                field("Audit Plan ID"; Rec."Audit Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan ID field.';
                }
            }
            part("Audit Checklists/Criteria"; "Audit Execution Checklist Line")
            {
                Caption = 'Audit Checklists/Criteria';
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                ApplicationArea = Basic;
            }
            group("Audit Engagement Details")
            {
                Caption = 'Audit Engagement Details';
                field("Audit  Work Type"; Rec."Audit  Work Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit  Work Type field.';
                }
                field("Engagement Name"; Rec."Engagement Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Name field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Auditor Type"; Rec."Auditor Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditor Type field.';
                }
                field("Auditee Type"; Rec."Auditee Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Auditee ID"; Rec."Primary Auditee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Auditee ID field.';
                }
                field("Auditee Name"; Rec."Auditee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Auditee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Suggest Audit Checklist")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                ToolTip = 'Executes the Suggest Audit Checklist action.';
                trigger OnAction()
                begin
                    RiskManagement.FnSuggestFWVChecklist(AuditExecutionChecklist, Rec, AuditChecklistTestMethod);
                    Message('Checklist Suggested successfuly');
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Released);
                    Rec.TestField(Posted, false);
                    RiskManagement.FnPostFWVoucher(AuditProjectChecklist, Rec, AuditExecutionChecklist);
                    Rec.Posted := true;
                    Rec.Modify;
                    Message('Fieldwork Voucher %1 Posted Successfully', Rec."Document No.");
                end;
            }
            action("Audit Procedures")
            {
                ApplicationArea = Basic;
                Image = AdjustExchangeRates;
                RunObject = Page "Audit Project Procedures";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
                ToolTip = 'Executes the Audit Procedures action.';
            }
            action("Transaction Testing Approach")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                RunObject = Page "Audit Checklist Test Approache";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                RunPageMode = View;
                ToolTip = 'Executes the Transaction Testing Approach action.';
            }
            action("Audit Findings Summary")
            {
                ApplicationArea = Basic;
                Image = BankAccountRec;
                RunObject = Page "Audit Execution Findings";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Findings Summary action.';
            }
            action("Positives Findings")
            {
                ApplicationArea = Basic;
                RunObject = Page "Audit Execution Findings";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Positives Findings action.';
            }
            action("Audit Recommendations")
            {
                ApplicationArea = Basic;
                Image = BookingsLogo;
                RunObject = Page "Audit Finding Recommendations";
                RunPageLink = "Document Type" = field("Document Type"),
                              "Document No." = field("Document No."),
                              "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Audit Recommendations action.';
            }
            action("Filed Audit Working Papers")
            {
                ApplicationArea = Basic;
                Image = FileContract;
                RunObject = Page "Filed Audit Working Papers";
                RunPageLink = "Engagement ID" = field("Engagement ID");
                ToolTip = 'Executes the Filed Audit Working Papers action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Approval Request';
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Sent');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Cancelled');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Done');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;
                    Message('Document released successfully');
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;
                    Message('Document reopened successfully');
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                RunObject = Page "Dimension Set Entries";
                Visible = false;
                ToolTip = 'Executes the Dimensions action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(95018, true, true, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Suggest Audit Checklist_Promoted"; "Suggest Audit Checklist")
                {
                }
                actionref(Post_Promoted; Post)
                {
                }
                actionref("Send Approval Request_Promoted"; "Send Approval Request")
                {
                }
                actionref("Cancel Approval Request_Promoted"; "Cancel Approval Request")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
                actionref(Release_Promoted; Release)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Audit Procedures_Promoted"; "Audit Procedures")
                {
                }
                actionref("Transaction Testing Approach_Promoted"; "Transaction Testing Approach")
                {
                }
                actionref("Audit Findings Summary_Promoted"; "Audit Findings Summary")
                {
                }
                actionref("Filed Audit Working Papers_Promoted"; "Filed Audit Working Papers")
                {
                }
                actionref("Audit Recommendations_Promoted"; "Audit Recommendations")
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if ((Rec.Posted = true) or (Rec.Status = Rec.Status::Released)) then
            CurrPage.Editable := false;
    end;

    trigger OnAfterGetRecord()
    begin
        if ((Rec.Posted = true) or (Rec.Status = Rec.Status::Released)) then
            CurrPage.Editable := false;
    end;

    trigger OnOpenPage()
    begin
        if ((Rec.Posted = true) or (Rec.Status = Rec.Status::Released)) then
            CurrPage.Editable := false;
    end;

    var
        RiskManagement: Codeunit "Risk Management";
        AuditExecutionChecklist: Record "Audit Execution Checklist";
        AuditProjectChecklist: Record "Audit Project Checklist";
        AuditChecklistTestMethod: Record "Audit Checklist Test Method";
}

#pragma implicitwith restore

