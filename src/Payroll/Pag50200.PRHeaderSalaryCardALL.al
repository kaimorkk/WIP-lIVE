page 52193586 "PR Header Salary Card - ALL"
{
    DeleteAllowed = false;
    InsertAllowed = true;
    PageType = Card;
    SourceTable = "Employee";

    layout
    {
        area(content)
        {
            group(EmployeeDetails)
            {
                Caption = 'Employee Details';
                field("No."; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Full Name"; "FullName")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }

                field(IDNumber; "ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NSSFNo; "Social Security No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NHIFNo; "N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PIN No."; "P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ContractType; "Contract Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ResponsibilityCenter; "Responsibility Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("PayrollPostingGroup"; "Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeType; "Employee Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Acting Scale"; Rec."Acting Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Acting Present"; Rec."Acting Present")
                {
                    ApplicationArea = Basic;
                }
                // field("On Probation"; "On Probation")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
            }
            group("Primary Bank Details")
            {
                Caption = 'Primary Bank Details';
                Editable = false;

                field("Bank Account Number"; Rec."Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account Number field.';
                }
                field("Employee's Bank"; Rec."Employee's Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee''s Bank field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Branch"; Rec."Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch field.';
                }
                field("Bank Branch Name"; Rec."Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch Name field.';
                }
            }
            part(PaymentInfo; "PR Salary Information")
            {
                Caption = 'Payment Information';
                ShowFilter = true;
                ApplicationArea = All;
                SubPageLink = "Employee Code" = field("No.");
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Transactions)
            {
                Caption = 'Employee Transactions';
                action(AssignEarningDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Earning';
                    Image = List;
                    Visible = Inaonekana;
                    RunObject = Page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = field("No."), "Transaction Type" = filter(Income | Benefit);
                }
                action(AssignDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Deductions';
                    Image = List;
                    Visible = Inaonekana;
                    RunObject = Page "PR Employee Transactions";
                    RunPageLink = "Employee Code" = field("No."), "Transaction Type" = filter(Deduction);
                }
                action(TransHistory)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transactions History';
                    Image = List;
                    Visible = Inaonekana;
                    RunObject = Page "PR Employee Transactions Hist.";
                    RunPageLink = "Employee Code" = field("No.");
                }

            }
        }
        area(processing)
        {

            action(ViewPayslip)
            {
                ApplicationArea = Basic;
                Caption = 'View Payslip';
                Image = View;

                trigger OnAction()
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    PRSalARYCard.SetRange("Employee Code", "No.");
                    PRSalARYCard.SetRange(PRSalARYCard."Period Filter", SelectedPeriod);
                    Report.Run(Report::"PR Individual Payslip", true, false, PRSalARYCard);
                end;
            }
            action(PREmployeePayslip)
            {
                Caption = 'PR Employee Payslip';
                Image = Accounts;
                ApplicationArea = Basic, Suite;
                trigger OnAction()
                var
                    PRPeriodTrans: Record "PR Period Transactions";
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    PRPeriodTrans.Reset();
                    PRPeriodTrans.SetRange("Employee Code", "No.");
                    PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                    //Report.Run(Report::"PR Employee Payslip", true, false, PRPeriodTrans);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(ViewPayslip_Promoted; ViewPayslip)
                {
                }
                actionref(AssignEarningDeductions_Promoted; AssignEarningDeductions)
                {
                }
                actionref(AssignDeductions_Promoted; AssignDeductions)
                {
                }
                actionref(TransHistory_Promoted; TransHistory)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approval', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
            group(Category_Category5)
            {
                Caption = 'Budgetary Control', Comment = 'Generated from the PromotedActionCategories property index 4.';
            }
            group(Category_Category6)
            {
                Caption = 'Cancellation', Comment = 'Generated from the PromotedActionCategories property index 5.';
            }
            group(Category_Category7)
            {
                Caption = 'Category7_caption', Comment = 'Generated from the PromotedActionCategories property index 6.';
            }
            group(Category_Category8)
            {
                Caption = 'Category8_caption', Comment = 'Generated from the PromotedActionCategories property index 7.';
            }
            group(Category_Category9)
            {
                Caption = 'Category9_caption', Comment = 'Generated from the PromotedActionCategories property index 8.';
            }
            group(Category_Category10)
            {
                Caption = 'Category10_caption', Comment = 'Generated from the PromotedActionCategories property index 9.';
            }
        }
    }
    trigger OnOpenPage()
    begin
        changeLog.Init();
        changeLog."User ID" := UserId;
        changeLog."Date and Time" := CurrentDateTime;
        //changeLog."Type of Change" := changeLog."Type of Change"::
        changeLog."New Value" := 'View of page';
        changeLog.Insert();
        if Status = Status::Active then
            Inaonekana := true
        else
            Inaonekana := false;

    end;

    trigger OnInit()
    begin

        ObjPeriod.Reset;
        ObjPeriod.SetRange(ObjPeriod.Closed, false);
        if ObjPeriod.FindFirst() then begin
            SelectedPeriod := ObjPeriod."Date Opened";
            PeriodName := ObjPeriod."Period Name";
            PeriodMonth := ObjPeriod."Period Month";
            PeriodYear := ObjPeriod."Period Year";
        end;
    end;



    var
        // objEmp: Record UnknownRecord70134812;
        SalCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        HrEmployee: Record "Employee";
        ProgressWindow: Dialog;
        HREmpPR: Record "Employee";
        ObjPeriod: Record "PR Payroll Periods";
        PRSalARYCard: Record "PR Salary Card";
        changeLog: Record "Change Log Entry";
        Inaonekana: Boolean;
}

