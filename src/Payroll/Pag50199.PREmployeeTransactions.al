page 52194341 "PR Employee Transactions"
{
    PageType = List;
    SourceTable = "PR Employee Transactions";
    // Editable = false;
    layout
    {
        area(content)
        {
            repeater(Control1102755000)
            {
                Editable = CanEdit;
                field(EmployeeCode; "Employee Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Code';
                    Editable = false;
                }
                field(TransactionCode; "Transaction Code")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        "Payroll Period" := SelectedPeriod;
                        "Period Month" := PeriodMonth;
                        "Period Year" := PeriodYear;

                        curTransAmount := 0;
                    end;
                }
                field(TransactionName; "Transaction Name")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                }

                field(PayrollPeriod; "Payroll Period")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Balance; Balance)
                {
                    ApplicationArea = Basic;
                }
                field(Installments; "Total Installments")
                {
                    ApplicationArea = all;
                }

                field("Loan Application Date"; "Loan Application Date")
                {
                    ApplicationArea = all;
                }
                field("Amount Borrowed"; "Amount Borrowed")
                {
                    ApplicationArea = all;
                }
                field("Absent Days"; "Absent Days")
                {
                    ApplicationArea = Basic;
                }

                field(ReferenceNo; "Reference No")
                {
                    ApplicationArea = Basic;
                }
                field(ReferenceNo2; "Reference No2")
                {
                    ApplicationArea = Basic;
                }

                field("Has Insurance Certificate"; "Has Insurance Certificate")
                {
                    ApplicationArea = Basic;
                }

                field(StartDate; "Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; "End Date")
                {
                    ApplicationArea = Basic;
                }

                field(StopforNextPeriod; "Stop for Next Period")
                {
                    ApplicationArea = Basic;
                }

                field("coop parameters"; "coop parameters")
                {
                    ApplicationArea = all;
                }
                field("Leave Application No"; "Leave Application No")
                {
                    ApplicationArea = all;
                }
                field("Taken Leave Days"; "Taken Leave Days")
                {
                    ApplicationArea = all;
                }
                field("Transaction Type"; Rec."Transaction Type")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("Transaction Type2"; Rec."Transaction Type2")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Type2 field.';
                }
            }
        }
    }


    actions
    {
        area(processing)
        {
            action("Suggest Acting Allowances")
            {
                ApplicationArea = Basic;
                Caption = 'Suggest Acting Allowances';
                Image = Suggest;

                trigger OnAction()
                var
                    Emp: Record Employee;
                begin
                    Emp.Reset();
                    Emp.SetRange("No.", Rec."Employee Code");
                    if Emp.FindFirst() then begin
                        // Emp.TestField("Acting Scale");
                        // Emp.TestField("Acting Present");
                        Rec.fnSuggestActingAllowances();
                    end;
                end;
            }

            action(AssignEarningDeductions)
            {
                ApplicationArea = Basic;
                Caption = 'Repayment Schedule List';
                Image = AssessFinanceCharges;
                RunObject = Page "Loan Repayment Schedule";
                RunPageLink = "Employee No." = field("Employee Code"), "Loan No." = field("Transaction Code");
                Visible = false;
            }

            action(LoanSheduleREport)
            {
                ApplicationArea = Basic;
                Caption = 'Preview Loan Shedule';
                Image = AssessFinanceCharges;
                Visible = false;
                trigger OnAction()
                var
                    LoanRepaymentShcedule: Record "Loan Repayment Schedule1";
                begin
                    LoanRepaymentShcedule.Reset();
                    LoanRepaymentShcedule.SetRange("Employee No.", "Employee Code");
                    LoanRepaymentShcedule.SetRange("Loan No.", "Transaction Code");
                    if LoanRepaymentShcedule.FindFirst() then begin
                        report.Run(report::"Loan Repayment Schedule", true, false);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref("Suggest Acting Allowances_Promoted"; "Suggest Acting Allowances")
                {
                }
                actionref(AssignEarningDeductions_Promoted; AssignEarningDeductions)
                {
                }
                actionref(LoanSheduleREport_Promoted; LoanSheduleREport)
                {
                }
            }
        }


    }

    trigger OnInit()
    begin
        PRPayrollPeriods.Reset;
        PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
        if PRPayrollPeriods.FindFirst() then begin
            SelectedPeriod := PRPayrollPeriods."Date Opened";
            PeriodName := PRPayrollPeriods."Period Name";
            PeriodMonth := PRPayrollPeriods."Period Month";
            PeriodYear := PRPayrollPeriods."Period Year";
            //objEmpTrans.RESET;
            //objEmpTrans.SETRANGE("Payroll Period",SelectedPeriod);
        end;

        //Filter per period  - Dennis
        SetFilter("Payroll Period", Format(PRPayrollPeriods."Date Opened"));
        //PRPayrollPeriods.SETFILTER(PRPayrollPeriods.Closed,'FALSE');
    end;

    trigger OnOpenPage()
    begin
        SetFilter("Payroll Period", Format(PRPayrollPeriods."Date Opened"));
        PayrollRights.Reset();
        PayrollRights.SetRange(PayrollRights."User ID", UserId);
        if PayrollRights.Find('-') then
            CanEdit := PayrollRights."Can Edit Transactions";
    end;

    var
        PRTransactionCodes: Record "PR Transaction Codes";
        SelectedPeriod: Date;
        PRPayrollPeriods: Record "PR Payroll Periods";
        PeriodName: Text[30];
        PeriodTrans: Record "PR Period Transactions";
        PeriodMonth: Integer;
        PeriodYear: Integer;
        curTransAmount: Decimal;
        empCode: Text[30];
        PREmployeeTrans: Record "PR Employee Transactions";
        i: Integer;
        HREmp: Record "Employee";
        currAmount: Decimal;
        PayrollRights: Record "PR Payroll Access Rights";
        CanEdit: Boolean;


}

