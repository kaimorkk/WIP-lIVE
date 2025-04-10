Page 52193960 "Employee Posting Group"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Employee Posting GroupX1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(BasicSalaryAccount;"Salary Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'Basic Salary Account';
                }
                field(IncomeTaxAccount;"Income Tax Account")
                {
                    ApplicationArea = Basic;
                }
                field(NSSFEmployerAccount;"SSF Employer Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF Employer Account';
                }
                field(NSSFTotalAccount;"SSF Employee Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF Total Account';
                }
                field(PensionEmployerAcc;"Pension Employer Acc")
                {
                    ApplicationArea = Basic;
                }
                field(PensionEmployeeAcc;"Pension Employee Acc")
                {
                    ApplicationArea = Basic;
                }
                field(NetSalaryPayable;"Net Salary Payable")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeProvidentFundAcc;"Employee Provident Fund Acc.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(PostingGroup)
            {
                Caption = 'Posting Group';
                action(AccountsMapping)
                {
                    ApplicationArea = Basic;
                    Caption = 'Accounts Mapping';
                    RunObject = Page "Employee PG Setup";
                    RunPageLink = "Posting Group"=field(Code);
                }
            }
        }
    }
}

