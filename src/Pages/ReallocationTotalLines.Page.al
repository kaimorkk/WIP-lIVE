Page 52193617 "Reallocation Total Lines"
{
    AutoSplitKey = true;
    Caption = 'Reallocation Total Lines';
    DelayedInsert = true;
    Editable = true;
    LinksAllowed = false;
    MultipleNewLines = true;
    PageType = ListPart;
    SourceTable = "Reallocation Lines";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(No; No)
                {
                    ApplicationArea = Basic;
                }
                field(AccountType; "Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                }
                field(AccountNo; "Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(AccountName; "Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(ExpectedAmount; "Expected Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ActualAmount; "Actual Amount")
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; "Total Amount")
                {
                    ApplicationArea = Basic;
                    Editable = AmountEditable;
                    Enabled = AmountEditable;
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

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        "Account Type" := "account type"::Customer
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

