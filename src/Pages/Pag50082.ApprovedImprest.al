namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Automation;
using System.Security.User;


page 50082 "Approved Imprest Requisition"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';
    Caption = 'Approved Safari Imprest Warranty';

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DocOpen;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Bank Account Number"; Rec."Imprest Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Bank Account Number field.';
                }
                field("Imprest Bank Name"; Rec."Imprest Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Bank Name field.';
                }
                field("Imprest Bank Branch Name"; Rec."Imprest Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Bank Branch Name field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    visible = false;
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                    ToolTip = 'Specifies the value of the Transaction No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    visible = false;
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Committed Amount"; Rec."Committed Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Committed Amount field.', Comment = '%';
                }
                field("AIE Receipt"; Rec."AIE Receipt")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the AIE Receipt field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
            }
            group(Reopening)
            {
                Editable = not DocOpen;
                Visible = rec.Status = rec.Status::Released;
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason to Reopen.';
                    ToolTip = 'Specifies the value of the Reason to Reopen. field.';
                }
            }
            part(Control1000000017; "Imprest Lines")
            {
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Payment Voucher")
            {
                Caption = 'Payment Voucher';
                Image = "Order";
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    // RunObject = Page "Comment Sheet";
                    // RunPageLink = "Table Name" = const(56000),
                    //               "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                    promoted = true;
                    PromotedCategory = Process;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        Rec.ShowEditDimension(CurrPage.Editable);
                        CurrPage.Update();
                        // Rec.ShowEditDimension(not Rec.Posted);
                        // Commit;
                        // CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';

                    trigger OnAction()
                    var
                        ApprovalMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = false;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        //if //ApprovalsMgmt.CheckPaymentsApprovalsWorkflowEnabled(Rec) then
                        //ApprovalsMgmt.OnSendPaymentsForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        //ApprovalsMgmt.OnCancelPaymentsApprovalRequest(Rec);
                    end;
                }
                separator(Action1000000033)
                {
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Report;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(Report::"Imprest Warranty", true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    visible = false;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    visible = rec.Status = rec.Status::Released;
                    trigger OnAction()
                    var
                    begin
                        Usersets.Get(UserId);
                        Usersets.TestField(Usersets."Reopen Document", Usersets."Reopen Document" = true);
                        Rec.TestField("Reasons to Reopen");
                        ReOpenPayment.PerformManualReopen(Rec);
                    end;
                }
                separator(Action1000000020)
                {
                }
            }
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action(Post)
                {
                    ApplicationArea = Basic;
                    Caption = 'P&ost';
                    Image = PostOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ShortCutKey = 'F9';
                    ToolTip = 'Executes the P&ost action.';
                    visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);
                    trigger OnAction()
                    begin
                        //Control the posting of the imprest requisitions David
                        usersetup.Get(UserId);
                        if usersetup."Post Requisition" = false then
                            Error(Text001);
                        Rec.CheckDimensions(Rec."Dimension Set ID");
                        Rec.UpdateLineDimensions(Rec."Dimension Set ID");
                        if Rec.Posted = false then begin
                            if Confirm('Are you sure you want to post Document %1 Imprest', false, rec."No.") = true then begin
                                if (Rec."Account Type" = Rec."Account Type"::Resource) then begin
                                    if Rec.createCustomerFromResource(Rec."Account No.") then
                                        PaymentPost."Post Imprest"(Rec)
                                    else
                                        Error('Could Not Create Customer For The Resource');
                                end
                                else
                                    PaymentPost."Post Imprest"(Rec);
                            end;
                        end;

                    end;
                }
                action("Banked Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Banked Imprest Requisition action.';
                    trigger OnAction()
                    begin
                        Rec.Select := true;
                        Rec.banked := true;
                        Rec.Modify(true);
                        ApprovedImprestRequisitions.SendEmail(Rec);
                        Message('Banked Successfully');
                    end;
                }
            }
            action("Attach from Imprest Memo")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach from Imprest Memo action.';
                trigger OnAction()
                begin
                    Rec.AttachLines(Rec);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := DocOpen;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        ShowAttach: Boolean;
        DocOpen: boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        usersetup: Record "User Setup";
        Text001: label 'You do not have sufficient rights to Post An Imprest Requisition! Please! contact System Administrator for Assistance.';
        ReOpenPayment: Codeunit Payments;
        Usersets: Record "User Setup";
        Text002: label 'You have not granted permisions to reopen documents, Seek assistance from Accounts';
        ApprovedImprestRequisitions: Page "Approved Imprest Requisitions";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}
