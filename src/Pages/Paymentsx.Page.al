Page 52193619 Paymentsx
{
    Caption = 'Payment Voucher';
    PageType = Card;
    SourceTable = Payments1;
    SourceTableView = where(Posted = filter(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(EmployerCode; "Employer Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployerName; "Employer Name")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentTo; "Payment To")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccount; "Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(CurrencyCode; "Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(Cashier; Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(PaymentDate; "Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(PaymentMode; "Payment Mode")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Payment Mode" = 'CHEQUE' then begin
                            CheqNoEditable := true;
                            CheqDateEditable := true;
                        end else begin
                            CheqNoEditable := false;
                            CheqDateEditable := false;
                        end;
                    end;
                }
                field(ChequeNo; "Cheque No.")
                {
                    ApplicationArea = Basic;
                    Editable = CheqNoEditable;
                }
                field(ChequeDate; "Cheque Date")
                {
                    ApplicationArea = Basic;
                    Editable = CheqDateEditable;
                }
                field(Posted; Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ExtDocumentNo; "Ext. Document No.")
                {
                    ApplicationArea = Basic;
                }
            }
            part("Payment Lines"; "Payment Linesx")
            {
                SubPageLink = No = field(No);
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;

                trigger OnAction()
                begin
                    PaymentMgt.PostPayments(Rec);
                    CurrPage.Close;
                end;
            }
            separator(Action1000000023)
            {
            }
            action("Import Schedule")
            {
                ApplicationArea = Basic;
                Image = Import;

                trigger OnAction()
                begin

                    TestField(Status, Status::Open);
                    ImportPayments.GetRecHeader(Rec);
                    ImportPayments.Run;
                end;
            }
            separator(Action1000000025)
            {
            }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Image = SendApprovalRequest;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    //******************************End Then Send For Approval
                    //ApprovalMgt.SendMemberApprovalRequest(Rec)
                    //******************************End of Code
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;

                trigger OnAction()
                var
                    ApprovalMgt: Codeunit "Approvals Mgmt.";
                begin
                    ////if ApprovalMgt.CancelMemberApprovalRequest(Rec,TRUE,TRUE) THEN;
                end;
            }
            separator(Action1000000028)
            {
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Receipt;

                trigger OnAction()
                begin

                    /*IF Posted=FALSE THEN
                    ERROR('Post the receipt before printing.'); */
                    Reset;
                    SetFilter(No, No);
                    Report.Run(51507700, true, true, Rec);
                    Reset;

                end;
            }
            action("Check Duplicate Member No")
            {
                ApplicationArea = Basic;
            }
            action(Reverse)
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin

                    /*GLRegister.RESET;
                    GLRegister.SETRANGE(GLRegister."Journal Batch Name",No);
                    IF GLRegister.FIND('-') THEN
                    BEGIN
                    GLRegister.TESTFIELD(GLRegister."No.");
                    ReversalEntry.ReverseRegister(GLRegister."No.");
                    
                    END;     */

                end;
            }
            separator(Action1000000031)
            {
            }
            action("Clear Contribution List")
            {
                ApplicationArea = Basic;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
                actionref("Import Schedule_Promoted"; "Import Schedule")
                {
                }
                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Report)
            {
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if "Payment Mode" = 'CHEQUE' then begin
            CheqNoEditable := true;
            CheqDateEditable := true;
        end else begin
            CheqNoEditable := false;
            CheqDateEditable := false;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CheqNoEditable := true;
        CheqDateEditable := true;
    end;

    var
        "member name": Text[100];
        StaffNo: Code[20];
        Cust: Record Customer;
        Gnljnline: Record "Gen. Journal Line";
        GenBatches: Record "Gen. Journal Batch";
        RecLine: Record "Receipts Lines";
        "cashier receipt": Record Receipts;
        name: Text[30];
        "GL Account": Record "G/L Account";
        LoanApp: Record Charges;
        MonthlyInt: Decimal;
        ContributionMgt: Codeunit "Receipt Management";
        PaymentMgt: Codeunit "Payment Management";
        ImportPayments: XmlPort "Payment Imports";
        CheqNoEditable: Boolean;
        CheqDateEditable: Boolean;
}

