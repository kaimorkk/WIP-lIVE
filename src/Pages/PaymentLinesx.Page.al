Page 52193618 "Payment Linesx"
{
    AutoSplitKey = true;
    Caption = 'Payment Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Payment Lines";

    layout
    {
        area(content)
        {
            repeater(PayLines)
            {
                Caption = 'Payment Lines';
                Enabled = PayLinesEnabled;
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo; "Account No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Name)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                    Enabled = PayLinesEnabled;
                }
                field(TransactionsCode; "Transactions Code")
                {
                    ApplicationArea = Basic;
                    Enabled = PayLinesEnabled;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Enabled = PayLinesEnabled;
                }
                field(LoanNo; "Loan No.")
                {
                    ApplicationArea = Basic;
                }
                field(InterestPaid; "Interest Paid")
                {
                    ApplicationArea = Basic;
                }
                field(LoanProductTypeCode; "Loan Product Type Code")
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount; "Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                }
                field(PostingGroup; "Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                    Visible = true;

                    trigger OnValidate()
                    begin
                        if "Transaction Type" = "transaction type"::"Processing Fee" then
                            PayLinesEnabled := false
                        else
                            PayLinesEnabled := true;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(GetReceiptLines)
                {
                    ApplicationArea = Basic;
                    Caption = '&Get Receipt Lines';
                    Ellipsis = true;
                    Enabled = false;
                    Image = Receipt;
                    Visible = false;

                    trigger OnAction()
                    begin
                        //GetReceipt;
                    end;
                }
            }
            action("Member Card")
            {
                ApplicationArea = Basic;
                Image = Customer;
                // RunObject = Page "Member Card";
                // RunPageLink = "No."=field("Account No");
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if "Transaction Type" = "transaction type"::"Processing Fee" then
            PayLinesEnabled := false
        else
            PayLinesEnabled := true;
    end;

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
    end;

    trigger OnInit()
    begin
        //PayLinesEnabled:=TRUE;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        PayLinesEnabled := true;
    end;

    var
        Text000: label 'Unable to execute this function while in view only mode.';
        PayLinesEnabled: Boolean;
        AccTypeEnabled: Boolean;
        AccNoEnabled: Boolean;
        NameEnabled: Boolean;
        TypeEnabled: Boolean;
        TransCodeEnabled: Boolean;
        DescEnabled: Boolean;
        AmountEnabled: Boolean;
        LoanNoEnabled: Boolean;
        IntEnabled: Boolean;
        LoanTypeEnabled: Boolean;
        NetAmntEnabled: Boolean;
}

