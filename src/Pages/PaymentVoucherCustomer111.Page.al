Page 52193626 "Payment Voucher Customer111"
{
    PageType = Card;
    SourceTable = "Payment Voucher";
    SourceTableView = order(ascending)
                      where(Posted=const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Payee;Payee)
                {
                    ApplicationArea = Basic;
                }
                field(PayMode;"Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankAccount;"Paying Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(UserRemarks;"User Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(FinanceRemarks;"Finance Remarks")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo;"Cheque No")
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate;"Cheque Date")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount;"Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName;"Account Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part("Customer PV breakdown";"Customer PV breakdown")
            {
                SubPageLink = No=field(No);
            }
        }
    }

    actions
    {
    }

    var
        vendorledEntry: Record "Vendor Ledger Entry";
        Amt: Decimal;
        vendorledEntry1: Record "Vendor Ledger Entry";
        Ramt: Decimal;
        "cashier receipt": Record "Payment Voucher";
        RecLine: Record "Customer Pv Break Down";
        totalamt: Decimal;
        PV: Record "Payment Voucher";
        Gnljnline: Record "Gen. Journal Line";
        LineNo: Integer;
        Tarrifcodes: Record "Tarriff Codes";
        Vatamt: Decimal;
        WithAmt: Decimal;
        InvAmt: Decimal;
        NextLocation: Text[50];
        EntryNo: Integer;
        MovementTracker: Record "Movement Tracker";
        NextStage: Integer;
        ApprovalsSetup: Record "Approvals Set Up";
        ApprovalUsers: Record "Approvals Users Set Up";
        vendorLedgerEntry: Record "Vendor Ledger Entry";
}

