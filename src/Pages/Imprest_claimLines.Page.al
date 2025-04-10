Page 52193917 "Imprest_claim Lines"
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
                }
                field(UnitofMeasure;"Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field(UnitPrice;"Unit Price")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approved Amount';
                }
                field(RequestedAmount;"Requested Amount")
                {
                    ApplicationArea = Basic;
                }
                field(ActualSpent;"Actual Spent")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(RemainingAmount;"Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(ExpenseType;"Expense Type")
                {
                    ApplicationArea = Basic;
                }
                field(GlobalDimension2Code;"Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(GlobalDimension1Code;"Global Dimension 1 Code")
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

