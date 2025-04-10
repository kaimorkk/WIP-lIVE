Page 50053 "Savings Scheme Transactions"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Savings Scheme Transactions";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(PayrollPeriod;"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(PayPeriod;"Pay Period")
                {
                    ApplicationArea = Basic;
                }
                field(Amount;Amount)
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

