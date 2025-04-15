 
   page 50078 "Imprest Requisition"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    caption = 'Safari Imprest Warranty';
    PageType = Card;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Open | "Pending Approval" | Released));
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                    Visible = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posting Date field.';
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
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Payee Bank Account"; Rec."Payee Bank Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Account field.', Comment = '%';
                }
                field("Payee Bank Code"; Rec."Payee Bank Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Code field.', Comment = '%';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee field.';
                }


                field(ValidatedBankName; Rec.ValidatedBankName)
                {
                    ApplicationArea = All;
                    Caption = 'Validated Bank Name';
                    ToolTip = 'Specifies the value of the ValidatedBankName field.', Comment = '%';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Cheque No field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
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
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    // Editable = true;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Strategic Plan"; Rec."Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Year Code"; Rec."Reporting Year Code")
                {
                    ApplicationArea = Basic, Suite;
                }

                field("Workplan Code"; Rec."Workplan Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Expenditure Requisition Code"; "Expenditure Requisition Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Imprest Memo No field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
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
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic, Suite;
                    Visible = false;
                }
            }
            part(Control1000000017; "Imprest Lines")
            {
                Editable = not OpenApprovalEntriesExist;
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
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(56000),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        // Rec.ShowEditDimension(CurrPage.Editable);
                        // CurrPage.Update();
                        Rec.ShowEditDimension(not Rec.Posted);
                        CurrPage.Update();
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
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
            }
        }
        area(processing)
        {
            action("Attach from Imprest Memo")
            {
                ApplicationArea = Basic;
                Enabled = ShowAttach;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Attach from Imprest Memo action.';
                trigger OnAction()
                begin
                    Rec.AttachLines(Rec);
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send for Examination';
                    Enabled = Rec.Status = Rec.Status::Open;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send for Examination action.';
                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                        VarVariant: Variant;
                         paymentPost: Codeunit "Payments-Post";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);//status must be open.
                        // Rec.TestField("Created By", UserId); //control so that only the initiator of the document can send for approval
                        //TESTFIELD("Imprest Memo No");
                        Rec.TestField("Payment Narration");
                        rec.TestField(rec."Pay Mode");
                        rec.TestField(rec."Posting Date");
                        if Rec."Imprest Amount" = 0 then
                            Error(Text001, Rec."No.");
                        if paymentPost.checkIFEmployee(Rec."Account No.") then
                            Rec."Account Type" := Rec."Account Type"::Employee;
                        Rec.CheckDimensions(Rec."Dimension Set ID");
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = CancancelApprovalRequest;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");
                        VarVariant := Rec;
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action("Update Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Update Payee Bank Acc Name';

                    Promoted = true;
                    PromotedCategory = Category4;
                    Enabled = Rec.Status = Rec.Status::Open;
                    trigger OnAction()
                    var
                        isSucess: Boolean;

                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        isSucess := Rec.UpdateBankName(Rec."Payee", Rec.ValidatedBankName);
                        if (isSucess) then begin
                            Rec."Payee" := Rec.ValidatedBankName;
                            Rec.Modify();
                            Message('Updated Successfuly');
                        end
                        else
                            Message('No Matching Records Founds')
                    end;
                }
                action("UpdatePayeeBankName")
                {
                    ApplicationArea = Basic;

                    Promoted = true;
                    PromotedCategory = Category4;

                    Visible = Rec.Status = Rec.Status::Open;

                    Caption = 'Update Employee Bank Details';

                    trigger OnAction()
                    var
                        isSucess: Boolean;
                        payment: Record "Payments";
                        pvLines: Record "PV Lines";
                        payeeBankAccName: Code[100];
                        payeeBankBranch: Code[100];
                        payeeBankName: Text[80];
                        payeeBankCode: Code[80];
                        payeeBankAccount: Code[30];
                        payeebankBrName: Text[80];
                        empBankDetails: JsonObject;
                        // OutwardPayment: Codeunit OutwardPayment;
                        jsonToken: JsonToken;

                    begin
                        rec.TestField(Status, rec.Status::Open);

                        empBankDetails := Rec.updateEmpBankDetails(rec."Account No.");
                        // payeeBankAccName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank acc name');
                        // payeeBankBranch := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank branch');
                        // payeeBankCode := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank code');
                        // payeeBankAccount := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank account');
                        // payeeBankName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank name');
                        // payeebankBrName := OutwardPayment.ExtractTextFromJson(empBankDetails, jsonToken, 'payee bank br name');
                        if ((payeeBankAccName = '') or (payeebankBrName = '') or (payeeBankBranch = '') or (payeeBankCode = '') or (payeeBankAccount = '') or (payeeBankName = '')) then
                            Error('Request Employee to Update Bank Details');
                        Rec."Payee Bank Account" := payeeBankAccount;
                        Rec."Payee Bank Code" := payeeBankCode;
                        Rec.Payee := payeeBankAccName;
                        Rec."Payee Bank Name" := payeeBankName;
                        Rec."Payee Bank Branch" := payeeBankBranch;
                        Rec."Payee Branch Name" := payeebankBrName;
                        if Rec.Modify() then Message('Bank Details Updated Successfully');



                    end;

                }
                action("Archive Document")
                {
                    ApplicationArea = Basic;

                    Promoted = true;
                    PromotedCategory = Category4;

                    Visible = Rec.Status = Rec.Status::Open;

                    Caption = 'Archive Document';

                    trigger OnAction()
                    begin
                        Rec.archiveDocument();

                    end;


                }


                separator(Action1000000037)
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
                        //DocPrint.PrintPurchHeader(Rec);

                        // IF Status<>Status::Released THEN
                        // ERROR(Txt0001);
                        // IF Status=Status::Released THEN BEGIN
                        Rec.SetRange("No.", Rec."No.");
                        // Report.Run(Report::"Imprest Warranty", true, true, Rec)
                    end;
                }
            }
            group(Release)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                Visible = false;
                action("Re&lease")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    Visible = false;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                        rec.Status := Rec.Status::Released;
                        rec.Validate(Status);
                        rec.modify;
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    visible = false;
                    trigger OnAction()
                    var
                    //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                        //ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000031)
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
                        UserSetup.Get(UserId);
                        if UserSetup."Post Requisition" = false then
                            Error(Text001);
                        PaymentPost."Post Imprest"(Rec);
                    end;
                }
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Reject the requested changes.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'Delegate the requested changes to the substitute approver.';
                    Visible = OpenApprovalEntriesExistForCurrUser;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RecordId);
                    end;
                }
                action(Comment)
                {
                    ApplicationArea = Suite;
                    Caption = 'Comments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedOnly = true;
                    ToolTip = 'View or add comments for the record.';
                    Visible = not OpenApprovalEntriesExist;

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.GetApprovalComment(Rec);
                    end;
                }


                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        DMSManagement: Codeunit "Sharepoint Integration";
                        DocType: Enum SharepointDocumentType;
                    begin
                        DocType := DocType::Imprest;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Imprest Requisition');

                    end;
                }
                action("View Attached Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;


                    trigger OnAction()
                    var
                        attachLink: Record Attachments;
                    begin

                        attachLink.setRange(attachLink.Document_No, Rec."No.");
                        if attachLink.FindSet then
                            Page.Run(Page::Attachments, attachLink)
                        else
                            Error('No attached links found');

                    end;
                }


                action("Correct Account Type")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    trigger OnAction()

                    var
                        paymentPost: Codeunit "Payments-Post";

                    begin
                        if paymentPost.checkIFEmployee(Rec."Account No.") then begin
                            Rec."Account Type" := Rec."Account Type"::Employee;
                            Rec.Modify();
                        end;
                    end;
                }
                action(MoveHistoricalDoc)
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;
                    Caption = 'Move Historical Docs';
                    trigger OnAction()
                    var
                        attachLink: Record Attachments;
                        attachLink2: Record Attachments;
                        exrHeader: Record "Expense Requisition";
                        entryNo: integer;
                    begin

                        exrHeader.reset();
                        exrHeader.setRange("No.", Rec."Expenditure Requisition Code");
                        if exrHeader.FindFirst() then begin
                            attachLink.reset();
                            attachLink.setRange(attachLink.Document_No, exrHeader."No.");
                            if attachLink.findSet() then
                                repeat
                                    attachLink2.reset();
                                    if attachLink2.FindLast() then
                                        entryNo := attachLink2.LineNo + 1
                                    else
                                        entryNo := 1;

                                    attachLink2.init;
                                    attachlink2.Copy(attachLink);
                                    attachLink2.LineNo := entryNo;
                                    attachLink2.Document_No := Rec."No.";
                                    attachlink2.insert();
                                until attachLink.next = 0;
                        end;




                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance
    end;

    trigger OnAfterGetRecord()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::Imprest;
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
        Rec."Document Type" := Rec."document type"::Imprest;
        Rec."Created By" := UserId;
    end;

    trigger OnOpenPage()
    begin
        ShowAttach := Rec.OpenEntries(Rec);
        SetControlAppearance;
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
    end;

    var
        PaymentPost: Codeunit "Payments-Post";
        ShowAttach: Boolean;
        Committment: Codeunit Committment;
        OpenApprovalEntriesExis, CanCancelApprovalRequest : Boolean;
        Txt0001: label 'You Can only Print Fully Approved Imprest Requisition';
        users: Record "User Setup";
        Text001: label 'Imprest Amount for document number %1 cannot be 0. Kindly check the lines. Attach memo.';
        UserSetup: Record "User Setup";
        Text0001: label 'You cannot Cancel document No. %1. Documents can only be cancelled by initiators ';
        OpenApprovalEntriesExistForCurrUser, OpenApprovalEntriesExist : Boolean;

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);
    end;
}

