Page 52193608 "Employee Posting Group111"
{
    PageType = List;
    SourceTable = "Employee Posting Groups";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(SalaryAccount;"Salary Account")
                {
                    ApplicationArea = Basic;
                }
                field(IncomeTaxAccount;"Income Tax Account")
                {
                    ApplicationArea = Basic;
                }
                field(SSFEmployerAccount;"SSF Employer Account")
                {
                    ApplicationArea = Basic;
                }
                field(SSFEmployeeAccount;"SSF Employee Account")
                {
                    ApplicationArea = Basic;
                }
                field(NetSalaryPayable;"Net Salary Payable")
                {
                    ApplicationArea = Basic;
                }
                field(StaffBenevolent;"Staff Benevolent")
                {
                    ApplicationArea = Basic;
                }
                field(PensionEmployerAcc;"Pension Employer Acc")
                {
                    ApplicationArea = Basic;
                }
                field(PensionEmployeeAcc;"Pension Employee Acc")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryExpenseAC;SalaryExpenseAC)
                {
                    ApplicationArea = Basic;
                }
                field(DirectorsFeeGL;DirectorsFeeGL)
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

