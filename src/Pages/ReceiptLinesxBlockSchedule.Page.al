Page 52193616 "Receipt Linesx Block Schedule"
{
    AutoSplitKey = true;
    Caption = 'Lines';
    DelayedInsert = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Receipts Lines Block Schedule";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(MemberNo; "Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member No.';
                }
                field(MemberName; "Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Name';
                }
                field(Type; Type)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if Type = Type::Repayment then begin
                            "Product Code" := '';
                            ProductCodeEnabled := false
                        end else
                            ProductCodeEnabled := true;



                        if Type = Type::Contribution then begin
                            "Loan No." := '';
                            "Loan Type" := '';
                            LoanNoEnabled := false
                        end else
                            LoanNoEnabled := true;
                    end;
                }
                field(TransactionsCode; "Transactions Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field(ProductCode; "Product Code")
                {
                    ApplicationArea = Basic;
                    Enabled = ProductCodeEnabled;
                }
                field(GLAccountName; "G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(LoanNo; "Loan No.")
                {
                    ApplicationArea = Basic;
                    Enabled = LoanNoEnabled;
                }
                field(LoanTypeName; "Loan Type Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                    Editable = AmountEditable;
                    Enabled = AmountEditable;
                }
                field(Principal; Principal)
                {
                    ApplicationArea = Basic;
                }
                field(Interest; Interest)
                {
                    ApplicationArea = Basic;
                }
                field(NetAmount; "Net Amount")
                {
                    ApplicationArea = Basic;
                }
                field(RepaymentMethod; "Repayment Method")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Repayment Method" = "repayment method"::Block then begin

                            /*RecLines.RESET;
                            RecLines.SETRANGE(No,No);
                            RecLines.SETRANGE("Line No.","Line No.");
                            RecLines.SETRANGE("Account No.","Account No.");
                            RecLines.SETRANGE(Type,RecLines.Type::Contribution);
                            IF RecLines.FIND('-') THEN BEGIN
                            AmountEditable:=FALSE
                            END ELSE
                            AmountEditable:=TRUE;
                            */


                        end;

                    end;
                }
                field(TransactionType; "Transaction Type")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(GlobalDimension2Code; "Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                // RunPageLink = "No." = field("Account No.");
            }
        }
    }

    trigger OnDeleteRecord(): Boolean
    var
        ReservePurchLine: Codeunit "Purch. Line-Reserve";
    begin
    end;

    trigger OnInit()
    begin
        ProductCodeEnabled := true;
        LoanNoEnabled := true;
        AmountEditable := true;
    end;

    var
        Text000: label 'Unable to execute this function while in view only mode.';
        Contribution: XmlPort "Monthly Contributions";
        RecType: Record "Receipts and Payments Types";

        ProductCodeEnabled: Boolean;
        LoanNoEnabled: Boolean;
        RecLines: Record "Receipts Lines";
        AmountEditable: Boolean;
}

