Page 52193965 "Salary history"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Employee Ledger EntryX1";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Employee;Employee)
                {
                    ApplicationArea = Basic;
                }
                field(PayrollPeriod;"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(BasicPay;"Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field(IncomeTax;"Income Tax")
                {
                    ApplicationArea = Basic;
                }
                field(BfMpr;BfMpr)
                {
                    ApplicationArea = Basic;
                }
                field(NetPay;"Net Pay")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

