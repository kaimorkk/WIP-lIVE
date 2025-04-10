Page 50111 "Claim Accounting Lines"
{
    AutoSplitKey = true;
    PageType = ListPart;
    SourceTable = "Request Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(TransactionType;"Transaction Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(ExpenseType;"Expense Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(UnitofMeasure;"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UnitPrice;"Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Amount';
                    Editable = false;
                }
                field(RequestedAmount;"Requested Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ActualSpent;"Actual Spent")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(RemainingAmount;"Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Visible = true;
                }
                field(Surrender;Surrender)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnDeleteRecord(): Boolean
    begin
                     /*
                     RequestHeader.SETRANGE(RequestHeader."No.","Document No");
                      IF RequestHeader.Status<>RequestHeader.Status::Open THEN
                      ERROR('You cannot modify this document at this stage');
                     */

    end;

    trigger OnModifyRecord(): Boolean
    begin
                    /*
                      RequestHeader.SETRANGE(RequestHeader."No.","Document No");
                      IF RequestHeader.Status<>RequestHeader.Status::Open THEN
                      ERROR('You cannot modify this document at this stage');
                      */

    end;

    var
        RequestHeader: Record "Request Header1";
}

