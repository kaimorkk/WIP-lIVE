page 52193585 "PR Employee Posting Group"
{
    PageType = List;
    SourceTable = "PR Employee Posting Groups";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Category Type"; Rec."Employee Category Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Category Type field.';
                }
                field("Retirement Age"; Rec."Retirement Age")
                {
                    ApplicationArea = Basic;
                }
                field("PWD Retirement Age"; "PWD Retirement Age")
                {
                    ApplicationArea = Basic;
                }
                field(SalaryAccount; "Salary Account")
                {
                    ApplicationArea = Basic;
                }
                field(IncomeTaxAccount; "Income Tax Account")
                {
                    ApplicationArea = Basic;
                }
                field(SSFEmployerExpenseAccount; "SSF Employer Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'SSF Employer Expense Account';
                }
                field(SSFTotalPayableAccount; "SSF Employee Account")
                {
                    ApplicationArea = Basic;
                    Caption = 'SSF Total Payable Account';
                }
                field(NetSalaryPayable; "Net Salary Payable")
                {
                    ApplicationArea = Basic;
                }
                field(PFEmployerExpenseAccount; "Pension Employer Acc")
                {
                    ApplicationArea = Basic;
                    Caption = 'PF Employer Expense Account';
                }
                field(PFTotalPayableAccount; "Pension Employee Acc")
                {
                    ApplicationArea = Basic;
                    Caption = 'PF Total Payable Account';
                }
                field(NHIFEmployeeAccount; "NHIF Employee Account")
                {
                    ApplicationArea = Basic;
                }
                field("Housing Levy Employee Account"; "Housing Levy Employee Account")
                {
                    ApplicationArea = Basic;
                }
                field("Housing Levy Employer Account"; "Housing Levy Employer Account")
                {
                    ApplicationArea = Basic;
                }
                field("Pays NHIF"; "Pays NHIF")
                {
                    ApplicationArea = all;
                }
                field("Pays NITA"; "Pays NITA")
                {
                    ApplicationArea = all;
                }
                field("Pays NSSF"; "Pays NSSF")
                {
                    ApplicationArea = all;
                }
                field("Pays PAYE"; "Pays PAYE")
                {
                    ApplicationArea = all;
                }
                field("Has Insurance Relief"; "Has Insurance Relief")
                {
                    ApplicationArea = all;
                }
                field("De-Activate Personal Relief?"; "De-Activate Personal Relief?")
                {
                    ApplicationArea = all;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SelectAll)
            {
                ApplicationArea = All;
                Caption = 'Update Employee Records';
                ToolTip = 'Select all records';
                Scope = Repeater;
                Image = UpdateDescription;
                trigger OnAction()
                begin
                    UserSetup.Get(UserId);
                    if not UserSetup."Can Edit HR" then
                        Error('You do not have permission to perform this action.');
                    Employee.Reset();
                    Employee.SetRange("Posting Group", Rec.Code);
                    Employee.SetRange("Status", Employee.Status::Active);
                    if Employee.FindSet() then
                        repeat
                            SalaryCard.Get(Employee."No.");
                            SalaryCard."Pays NHIF" := Rec."Pays NHIF";
                            SalaryCard."Pays NSSF" := Rec."Pays NSSF";
                            SalaryCard."Pays PAYE" := Rec."Pays PAYE";
                            SalaryCard."Has Insurance Relief" := Rec."Has Insurance Relief";
                            SalaryCard."De-Activate Personal Relief?" := Rec."De-Activate Personal Relief?";
                            SalaryCard."Pays NITA" := Rec."Pays NITA";
                            SalaryCard.Modify();
                        until Employee.Next = 0;
                end;
            }

        }
    }
    var
        UserSetup: Record "User Setup";
        Employee: Record "Employee";
        SalaryCard: Record "PR Salary Card";
}

