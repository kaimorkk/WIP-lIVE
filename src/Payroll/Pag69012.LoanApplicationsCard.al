

page 52193677 "Loan Applications Card"
{
    Editable = true;
    SourceTable = "Loan Application";
    SourceTableView = where("Loan Category" = filter("Morgage"));

    layout
    {
        area(content)
        {
            group(Employee)
            {
                Editable = EmployeeEditable;
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description. field.';
                }
                field("Loan No"; Rec."Loan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Loan No field.';
                }

                field("Loan Category"; Rec."Loan Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description. field.';
                }
                field("Description."; Rec."Description.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description. field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Amount Requested"; Rec."Amount Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Requested field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
                    MultiLine = true;
                }
                field("Approval Committee"; Rec."Approval Committee")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Committee field.';
                }
                field("Loan Status"; Rec."Loan Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Loan Status field.';
                }
            }
            group("Welfare Committee")
            {
                Caption = 'Loan Review';
                Editable = WelfareEditable;
                // Visible = false;
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Amount field.';
                }
                field(Instalment; Rec.Instalment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Instalment field.';
                }
                field(Repayment; Rec.Repayment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Repayment field.';
                }
                field("Flat Rate Principal"; Rec."Flat Rate Principal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Rate Principal field.';
                }
                field("Flat Rate Interest"; Rec."Flat Rate Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Rate Interest field.';
                }
                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Rate field.';
                }
                field("Interest Calculation Method"; Rec."Interest Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Calculation Method field.';
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Group field.';
                }
                field("Opening Loan"; Rec."Opening Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Loan field.';
                }
                field("Total Repayment"; Rec."Total Repayment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Repayment field.';
                }
                field("Period Repayment"; Rec."Period Repayment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period Repayment field.';
                }
                field("Interest Amount"; Rec."Interest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Amount field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field(Receipts; Rec.Receipts)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipts field.';
                }
                field("HELB No."; Rec."HELB No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HELB No. field.';
                }
                field("University Name"; Rec."University Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the University Name field.';
                }
                field("Stop Loan"; Rec."Stop Loan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stop Loan field.';
                }
                field("Refinanced From Loan:"; Rec."Refinanced From Loan:")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Refinanced From Loan: field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Create Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Create Schedule';
                Image = CreateDocument;
                ToolTip = 'Executes the Create Schedule action.';
                trigger OnAction()
                begin
                    LM.GenerateRepaymentSchedule(Rec);
                end;
            }
            action("Preview Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Preview Schedule';
                Image = Timesheet;
                RunObject = Page "Loan Repayment Schedule";
                RunPageLink = "Loan No." = field("Loan No"),
                              "Employee No." = field("Employee No");
                RunPageView = sorting("Loan No.", "Instalment No", "Employee No.")
                              order(ascending);
                ToolTip = 'Executes the Preview Schedule action.';

            }
            action("Issue Loan")
            {
                ApplicationArea = Basic;
                Caption = 'Issue Loan';
                Image = IssueFinanceCharge;
                Enabled = WelfareEditable;
                ToolTip = 'Executes the Issue Loan action.';
                trigger OnAction()
                begin
                    //   LM.GenerateRepaymentSchedule(Rec);
                    Rec.TestField("Loan Status", Rec."Loan Status"::Approved);

                    if Rec."Loan Status" = Rec."loan status"::Issued then
                        Error('Loan Already Issued');

                    if Rec."Issued Date" = 0D then
                        Error('You must specify the issue date before issuing the loan');

                    if Rec."Approved Amount" = 0 then
                        Error('You must specify the Approved amount before issuing the loan');



                    // Schedule.RESET;
                    // Schedule.SETRANGE("Loan No", Rec."Loan No");
                    // Schedule.SETRANGE(Schedule."Employee No", Rec."Employee No");
                    // if not Schedule.FIND('-') then
                    //     ERROR('No schedule created yet');

                    Rec.CalcFields("Total Repayment");
                    Emp.Get(Rec."Employee No");
                    AssMatrix.Init;
                    AssMatrix."Employee Code" := Rec."Employee No";
                    AssMatrix."Reference No" := Rec."Loan No";
                    if Rec."Deduction Code" = '' then
                        Error('Loan %1 must be associated with a deduction', Rec."Loan Product Type")
                    else
                        AssMatrix.Validate("Transaction Code", Rec."Deduction Code");
                    AssMatrix."Payroll Period" := Rec."Issued Date";
                    AssMatrix."Period Month" := Date2DMY(Rec."Issued Date", 2);
                    AssMatrix."Period Year" := Date2DMY(Rec."Issued Date", 3);
                    AssMatrix."Loan Application Date" := Rec."Application Date";
                    AssMatrix."Loan Number" := Rec."Loan No";
                    AssMatrix."Loan Interest Rate" := Rec."Interest Rate";
                    AssMatrix."#of Repayments" := Rec.Instalment;
                    AssMatrix."Amortized Loan Total Repay Amt" := Rec."Total Repayment";
                    AssMatrix.Amount := Rec.Repayment;
                    AssMatrix.Validate(AssMatrix.Amount);
                    AssMatrix.Insert;
                    Rec."Loan Status" := Rec."loan status"::Issued;
                    Rec.Modify;
                    Message('Loan Issued');


                end;
            }
            action("Delete Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Delete Schedule';
                Image = Delete;
                ToolTip = 'Executes the Delete Schedule action.';
                trigger OnAction()
                begin
                    if Rec."Loan Status" in [Rec."Loan Status"::Application, Rec."Loan Status"::"Being Processed"] then
                        LM.DeleteRepaymentSchedule(Rec)
                    else
                        Error('You cannot delete the loan repayment schedule at this stage');
                    // LM.GenerateRepaymentSchedule(Rec);

                end;
            }
            action("Submit Application")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Visible = Rec."Loan Status" = Rec."Loan Status"::Application;
                trigger OnAction()
                begin
                    Rec.TestField("Loan Status", Rec."Loan Status"::Application);
                    if Confirm('Do you want to submit your loan application to  the welfare committee for review?') then begin
                        Rec."Loan Status" := Rec."Loan Status"::"Being Processed";
                        Rec.Validate("Loan Status");
                        Rec.Modify();
                        Message('Your loan application has been submitted for approval');
                        CurrPage.Close();
                    end;
                end;


            }
            action("Approve Application")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Visible = Rec."Loan Status" = Rec."Loan Status"::"Being Processed";
                trigger OnAction()
                begin
                    Rec.TestField("Loan Status", Rec."Loan Status"::"Being Processed");
                    if LoanProduct.Get(Rec."Loan Product Type") then
                        if LoanProduct."Loan Category" = LoanProduct."Loan Category"::Advance then begin
                            if Confirm('Do you want to send loan application for approval?') then begin
                                VarVariant := Rec;
                                if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                                    CustomApprovals.OnSendDocForApproval(VarVariant);

                            end
                        end else begin
                            if Confirm('Do you want to send loan application to bank for approval?') then begin
                                Rec."Loan Status" := Rec."Loan Status"::"Pending Approval";
                                Rec.Validate("Loan Status");
                                Rec.Modify();
                                Message('The loan application has been submitted to bank');
                                CurrPage.Close();
                            end;
                        end;
                end;


            }
            action("Reject Application")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Visible = WelfareEditable;
                trigger OnAction()
                begin
                    Rec.TestField("Loan Status", Rec."Loan Status"::"Being Processed");
                    if Confirm('Do you want to reject the loan application?') then begin
                        Rec."Loan Status" := Rec."Loan Status"::Rejected;
                        Rec.Validate("Loan Status");
                        Rec.Modify();
                        Message('The loan application has been submitted to bank');
                        CurrPage.Close();
                    end;
                end;


            }

        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Create Schedule_Promoted"; "Create Schedule")
                {
                }
                actionref("Preview Schedule_Promoted"; "Preview Schedule")
                {
                }
                actionref("Issue Loan_Promoted"; "Issue Loan")
                {
                }
                actionref("Delete Schedule_Promoted"; "Delete Schedule")
                {
                }
                actionref("Submit Application_Promoted"; "Submit Application")
                {
                }
                actionref("Approve Application_Promoted"; "Approve Application")
                {
                }
                actionref("Reject Application_Promoted"; "Reject Application")
                {
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        innitValues();

    end;

    trigger OnAfterGetCurrRecord()
    begin
        innitValues();
    end;

    trigger OnInit()
    begin
        innitValues();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Loan Status" := Rec."Loan Status"::Application;
        if UserSetup.Get(UserId) then
            Rec.Validate("Employee No", UserSetup."Employee No.");
        // Rec."Loan Product Type" := 'CAR LOAN';
        Rec."Loan Category" := Rec."Loan Category"::"Car Loan";
    end;

    var
        LoanProduct: Record "Loan Product Type";
        UserSetup: Record "User Setup";
        EmpRec: Record Employee;

        RunningDate: Date;
        AssMatrix: Record "PR Employee Transactions";

        Emp: Record Employee;
        LM: Codeunit LoansManagement;
        GroupCode: Code[20];
        CUser: Code[20];
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        EmpRec2: Record Employee;
        WelfareEditable, EmployeeEditable : Boolean;
        VarVariant: Variant;
        CustomApprovals: Codeunit "Custom Approvals Codeunit";

    procedure innitValues()
    begin
        if rec."Loan Status" = rec."Loan Status"::Application then begin
            WelfareEditable := false;
            EmployeeEditable := true;
        end else begin
            WelfareEditable := true;
            EmployeeEditable := false;
        end;
        if Rec."Loan Status" in [Rec."Loan Status"::Approved, Rec."Loan Status"::Issued, Rec."Loan Status"::Rejected, Rec."Loan Status"::Repaid] then begin
            WelfareEditable := false;
            EmployeeEditable := false;

        end;
    end;

}

#pragma implicitwith restore

