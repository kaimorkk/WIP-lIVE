

page 52193679 "Loan Applications"
{
    CardPageID = "Loan Applications Card";
    Editable = false;
    PageType = List;
    SourceTable = "Loan Application";


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Loan No"; Rec."Loan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan No field.';
                }
                field(Employee2; rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee2 field.';
                }
                field("Employee Name."; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name. field.';
                }
                field("Description."; Rec."Description.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description. field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Loan Product Type"; Rec."Loan Product Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Loan Product Type field.';
                }
                field("Amount Requested"; Rec."Amount Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Requested field.';
                }
                field("Approved Amount"; Rec."Approved Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Amount field.';
                }
                field("Issued Date"; Rec."Issued Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued Date field.';
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
            }
        }
        area(factboxes)
        {
            systempart(Control1000000043; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000044; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000045; MyNotes)
            {
                ApplicationArea = Basic;
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
                Visible = false;
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
                Visible = false;
                RunObject = Page "Loan Repayment Schedule";
                RunPageLink = "Loan No." = field("Loan No"),
                              "Employee No." = field("Employee No");
                RunPageView = sorting("Loan No.", "Instalment No", "Employee No.")
                              order(ascending);
                ToolTip = 'Executes the Preview Schedule action.';
                trigger OnAction()
                begin
                    //   LM.GenerateRepaymentSchedule(Rec);
                end;
            }
            action("Issue Loan")
            {
                ApplicationArea = Basic;
                Caption = 'Issue Loan';
                Image = IssueFinanceCharge;
                Visible = false;
                ToolTip = 'Executes the Issue Loan action.';
                trigger OnAction()
                begin
                    //   LM.GenerateRepaymentSchedule(Rec);


                    if Rec."Loan Status" = Rec."loan status"::Issued then
                        Error('Loan Already Issued');

                    if Rec."Issued Date" = 0D then
                        Error('You must specify the issue date before issuing the loan');

                    if Rec."Approved Amount" = 0 then
                        Error('You must specify the Approved amount before issuing the loan');





                end;
            }
            action("Delete Schedule")
            {
                ApplicationArea = Basic;
                Caption = 'Delete Schedule';
                Image = Delete;
                Visible = false;
                ToolTip = 'Executes the Delete Schedule action.';
                trigger OnAction()
                begin
                    // LM.GenerateRepaymentSchedule(Rec);
                    LM.DeleteRepaymentSchedule(Rec);
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
            }
        }
    }
    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then
            if not UserSetup."Can View HR" then
                Rec.SetRange("Employee No", UserSetup."Employee No.");

    end;

    var
        LoanProduct: Record "Loan Product Type";
        EmpRec: Record Employee;
        RunningDate: Date;

        Emp: Record Employee;
        LM: Codeunit LoansManagement;
        GroupCode: Code[20];
        CUser: Code[20];
        PayPeriod: Record "Payroll PeriodX";
        PayPeriodtext: Text[30];
        BeginDate: Date;
        EmpRec2: Record Employee;
        UserSetup: Record "User Setup";



    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then begin
            PayPeriodtext := PayPeriod.Name;
            BeginDate := PayPeriod."Starting Date";
        end;
    end;
}

#pragma implicitwith restore

