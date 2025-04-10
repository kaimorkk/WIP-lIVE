page 50215 "Claim Refund Lines"
{
    ApplicationArea = All;
    Caption = 'Claim Refund Lines';
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
                }
                field(AccountType;"Account Type")
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity;Quantity)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(UnitofMeasure;"Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(UnitPrice;"Unit Price")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RequestedAmount;"Requested Amount")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Amount';
                }
                field(ActualSpent;"Actual Spent")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Refund Amount';

                }
                field(ExpenseType;"Expense Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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

