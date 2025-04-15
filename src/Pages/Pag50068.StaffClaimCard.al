namespace ALProjectLIWPA.ALProjectLIWPA;
using System.Security.User;
using System.Automation;



page 50068 "Staff Claim"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Payments;
    PromotedActionCategories = 'New,Process,Report,Request Approval,Approve';

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = DocReopen;
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Enabled = false;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic, SUite;
                    // Editable = DocReopen;
                }
                field("Bank Name"; "Bank Name")
                {
                    ApplicationArea = Basic, Suite;
                    // Editable = DocReopen;
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }

                group("Bank Details")
                {
                    Editable = false;
                    field("Payee Bank Name"; Rec."Payee Bank Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Payee Bank Name field.', Comment = '%';
                    }
                    field("Payee Bank Branch"; Rec."Payee Bank Branch")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Payee Bank Branch field.', Comment = '%';
                    }
                    field("Payee Branch Name"; Rec."Payee Branch Name")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the value of the Payee Branch Name field.', Comment = '%';
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
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = true;
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("Department Name"; "Department Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Shortcut Dimension 2 Code"; "Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = not OpenApprovalEntriesExist;
                }
                field("Project Name"; "Project Name")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
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

                field("Strategic Plan"; "Strategic Plan")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Reporting Year Code"; "Reporting Year Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Workplan Code"; "Workplan Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Visible = false;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                    Visible = false;
                }
                field("Expenditure Requisition Code"; "Expenditure Requisition Code")
                {
                    ApplicationArea = Basic, Suite;
                    Editable = false;
                }
                field("Archived Document"; Rec."Archive Document")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Archive Document field.';
                    Editable = false;
                    Visible = false;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }


            }
            group(Reopening)
            {
                //  Editable = not DocReopen;
                Editable = rec.Status = rec.Status::Released;
                field("Reasons to Reopen"; "Reasons to Reopen")
                {
                    ApplicationArea = all;
                    Editable = rec.Status = rec.Status::Released;
                    // Editable = DocReopen;
                }
            }
            part(Control1000000021; "Staff Claim Lines")
            {
                SubPageLink = No = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            // part("Attached Documents"; "Document Attachments")
            // {
            //     ApplicationArea = All;
            //     Caption = 'Attachments';
            //     SubPageLink = "Table ID" = const(57000),
            //                   "No." = field("No.");
            // }
            systempart(PyamentTermsLinks; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(PyamentTermsNotes; Notes)
            {
                ApplicationArea = Notes;
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
                    Promoted = true;
                    PromotedCategory = Process;
                }
                action("Resource Costs")
                {
                    ApplicationArea = Basic;
                    Image = ResourceCosts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;

                    trigger OnAction()
                    begin
                        // Resource.Reset;
                        // Resource.SetRange("No.", Rec."Account No.");
                        // if Resource.FindSet then begin
                        //     ResourceNo := Resource."Resource Group No.";
                        //     ResourceCost.SetCurrentkey(Code);
                        //     ResourceCost.SetRange(Code, ResourceNo);
                        //     ResourceCard.SetTableview(ResourceCost);
                        //     ResourceCard.Run;
                        // end
                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    ShortCutKey = 'Shift+Ctrl+D';
                    Promoted = true;
                    PromotedCategory = Process;
                    trigger OnAction()
                    begin
                        Rec.ShowEditDimension(CurrPage.Editable);
                        CurrPage.Update();
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
                    Visible = Rec.Status = Rec.Status::Open;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        Rec.TestField("Account No.");
                        Rec.TestField("Account Name");
                        Rec.TestField("Shortcut Dimension 1 Code");
                        /*TESTFIELD(Job);
                        TESTFIELD("Job Task No");*/

                        Rec.CalcFields("Total Amount LCY");
                        Rec.TestField("Total Amount LCY");
                        TotalImprestAmount := Rec."Total Amount LCY";
                        VarVariant := Rec;
                        if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                            ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = CanCancelApprovalRequest;

                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                    end;
                }

                action("Update Payee Bank Name")
                {
                    ApplicationArea = Basic;

                    Promoted = true;
                    PromotedCategory = Category4;

                    Visible = Rec.Status = Rec.Status::Open;

                    Caption = 'Update Payee Bank Acc Name';

                    trigger OnAction()
                    var
                        isSucess: Boolean;
                        payment: Record "Payments";
                        pvLines: Record "PV Lines";


                    begin
                        rec.TestField(Status, rec.Status::Open);
                        pvLines.Reset();
                        pvLines.setRange(No, Rec."No.");

                        if pvLines.FindSet() then
                            repeat
                                isSucess := Rec.UpdateBankName(pvLines."Payee Bank Acc Name", pvLines.rbankName);
                                if (isSucess) then begin
                                    pvLines."Payee Bank Acc Name" := pvLines.rbankName;
                                    pvLines.Modify();
                                    Message('Updated Successfuly');
                                end
                                else
                                    Message('No Matching Records Founds');


                            until pvLines.next = 0;
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
                        Rec.Modify();


                        pvLines.Reset();
                        pvLines.SetRange(No, Rec."No.");
                        if pvLines.FindSet() then
                            repeat
                                pvLines."Payee Bank Acc Name" := payeeBankAccName;
                                pvLines."Payee Bank Account No." := payeeBankAccount;
                                pvLines."Payee Bank Code" := payeeBankCode;
                                pvLines."Payee Bank Name" := payeeBankName;
                                pvLines."Payee Bank Branch Code" := payeeBankBranch;
                                pvLines."Payee Bank Branch Name" := payeebankBrName;
                                pvLines.Modify();
                                Message('Updated Successfully');
                            until pvLines.Next = 0;
                    end;

                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    var
                        ApprovalsMgt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                    end;
                }
                separator(Action1000000043)
                {
                }
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
                    trigger OnAction()
                    begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(50115, true, true, Rec);
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
                    visible = rec.status = rec.status::Released;
                    trigger OnAction()
                    var
                    // ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        rec.TestField("Reasons to Reopen");
                        rec.TestField(Posted, false);
                        rec.TestField(Status, rec.Status::Released);
                        if confirm('Do you want to reopen this document?') then begin
                            rec.Status := rec.Status::Open;
                            rec.Modify();
                        end;
                        // ReleasePurchDoc.PerformManualReopen(Rec);
                        // ReleasePurchDoc.ReopenPV(Rec);
                    end;
                }
                separator(Action1000000036)
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
                    Visible = (Rec.Status = Rec.Status::Released) and (not Rec.Posted);

                    trigger OnAction()
                    begin
                        // PaymentsPost.PostStaffClaims(Rec, false);
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
                    PromotedCategory = Category4;
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
                // action("Attach Documents")
                // {
                //     ApplicationArea = Basic;
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;

                //     trigger OnAction()
                //     begin
                //         DMSManagement.FnUploadStaffClaimDocs(Rec."No.", 'Imprest Naration', Rec.RecordId);
                //     end;
                // }

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
                        DocType := DocType::Claim;
                        DMSManagement.GetDocument(DocType, Rec."No.", Rec.RecordID, 'BMA', 57000, 'Staff Claim');
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

                        // DMSManagement.FnUploadPurchaseOrderDocs(Rec."No.", 'Purchase Order', Rec.RecordId);
                    end;
                }

            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlAppearance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Payment Type" := Rec."payment type"::"Staff Claim";
        Rec."Account Type" := Rec."account type"::Customer;
        Rec."Document Type" := Rec."document type"::"Staff Claims";
        Rec."Account Type" := Rec."account type"::Employee;
    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist, CanCancelApprovalRequest : Boolean;
        // PaymentsPost: Codeunit "Payments-Post";
        TotalImprestAmount: Decimal;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        UserSetup: Record "User Setup";
        // ResourceCost: Record "Resource Cost";
        // ResourceCard: Page "Resource Costs";
        // Resource: Record Resource;
        ResourceNo: Code[30];
        DocReopen: Boolean;
    // DMSManagement: Codeunit "DMS Management";

    local procedure SetControlAppearance()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        CanCancelApprovalRequest := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RecordId);

        if Rec.Status <> Rec.Status::Open then
            DocReopen := false
        else
            DocReopen := true;
        // CurrPage.Editable := DocReopen;
    end;
}


