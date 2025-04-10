page 52193641 "PR Salary List Inactive"
{
    ApplicationArea = All;
    Caption = 'PR Salary List Inactive';
    PageType = List;
    SourceTable = Employee;
    UsageCategory = Lists;
    CardPageID = "PR Header Salary Card - ALL";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    SourceTableView = where(Status = filter(<> Active));
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }

                field("Old Staff No."; Rec."No.")
                {
                    ApplicationArea = ALL;

                }
                field(FullName; Rec.FullName())
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }

                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = All;

                }

                // field("Date of First Appointment"; "Date of First Appointment")
                // {
                //     ApplicationArea = ALL;
                // }
                field("Salary Incremental Month"; Rec."Incremental Month")
                {
                    ApplicationArea = all;
                }
                // field("From IPPD"; "From IPPD")
                // {
                //     ApplicationArea = all;
                // }


                // field("User ID"; Rec."User ID")
                // {
                //     ApplicationArea = all;
                // }
                field(PostingGroup; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    StyleExpr = StyleTextExp;
                }
            }
        }

    }

    actions
    {
        area(navigation)
        {

        }
        area(processing)
        {
            action(ViewPayslip)
            {
                ApplicationArea = Basic;
                Caption = 'View Payslip';
                Image = Report;

                trigger OnAction()
                var
                    PRPeriodTrans: Record "PR Period Transactions";
                    PRSalaryCard: Record "PR Salary Card";
                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Display payslip report
                    PRSalaryCard.SetRange("Employee Code", Rec."No.");
                    PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                    Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);

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
                    PRPeriodTrans.SetRange("Employee Code", Rec."No.");
                    PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                    // Report.Run(Report::"PR Employee Payslip", true, false, PRPeriodTrans);
                end;
            }

            action(SendPayslip)
            {
                ApplicationArea = Basic;
                Caption = 'Send Payslip Via Email';
                Image = Period;

                trigger OnAction()
                var
                    SMTPMail: Codeunit "Email Message";
                    SendEmail: codeunit email;
                    MailManagement: Codeunit "Mail Management";
                    SendToList: List of [Text];
                    SenderEmail: Text;
                    ret: Boolean;
                    // EmailSender: Record "Email Sender";
                    HRSetup: Record "Human Resources Setup";
                    subject: Text;
                    message: Text;
                    ReportFileName: Text[250];
                    FILESPATH: Text;
                    BlobInStream: InStream;
                    Base64Convert: Codeunit "Base64 Convert";
                    TempBlob: Codeunit "Temp Blob";
                    FileContentsB64: Text;
                    BlobOutStream: OutStream;
                    RecRef: RecordRef;
                    filename: text;

                begin
                    HRSetup.Get();
                    HRSetup.TestField("Reports File Path");
                    FILESPATH := HRSetup."Reports File Path";
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;
                    "Employee".reset;
                    "Employee".SetRange("Employee".Status, "Employee".Status::Active);
                    //"Employee".SetRange("Employee"."No.", "No.");
                    if "Employee".Find('-') then begin
                        begin
                            repeat
                                PRSalaryCard.Reset();
                                PRSalaryCard.SetRange("Employee Code", "Employee"."No.");
                                PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                                if PRSalaryCard.Find('-') then begin
                                    RecRef.GetTable(PRSalaryCard);
                                    // Report.SaveAs(Report::"PR Individual Payslip", FILESPATH + "Employee"."No." + '.pdf', PRSalaryCard);
                                    Report.SaveAs(Report::"PR Individual Payslip", FILESPATH + "Employee"."No." + '.pdf', ReportFormat::Pdf, BlobOutStream, RecRef);
                                    ReportFileName := FILESPATH + Rec."No." + '.pdf';
                                    SendToList.Add("Employee"."E-Mail");
                                    subject := 'PAYSLIP FOR' + Format(SelectedPeriod);
                                    message := 'Kindly find attached your payslip.';
                                    SMTPMail.Create(SendToList, subject, message, true);
                                    SMTPMail.AddAttachment(FILESPATH, FILESPATH + Rec."No." + '.pdf', ReportFileName);
                                    SendEmail.Send(SMTPMail, Enum::"Email Scenario"::Default);
                                end;
                            until "Employee".next = 0;
                        end;

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(SendPayslip_Promoted; SendPayslip)
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(ViewPayslip_Promoted; ViewPayslip)
                {
                }
            }
        }
    }




    var
        Text000: label 'ROUND(%1, %2, %3) returns %4';
        PRSalaryCard: Record "PR Salary Card";
        EmpType: Enum "Employee Type";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        "Employee": Record "Employee";
        ProgressWindow: Dialog;
        PREmployeeTrans: Record "PR Employee Transactions";
        HREmp: Record "Employee";
        i: Integer;
        PRPeriodT: Record "PR Period Transactions";
        PRTransCodes: Record "PR Transaction Codes";
        PrevPayrollPeriod: Date;
        LoanStatus: Option " ","Fully Paid","Partly Paid";
        LoanTransCode: Code[10];
        InterestTransCode: Code[10];
        PREmployeeTrans_2: Record "PR Employee Transactions";
        PREmployeeTrans_3: Record "PR Employee Transactions";
        PREmployeeTrans_4: Record "PR Employee Transactions";
        PRTransCodes_2: Record "PR Transaction Codes";
        LoanTransCode_2: Code[10];
        InterestTransCode_2: Code[10];
        ApprovalEntry: Record "Approval Entry";
        //HRCodeunit: Codeunit "HR Codeunit";
        Direction: Text;
        Precision: Decimal;
        Result: Decimal;
        DecimalToRound: Decimal;
        StyleTextExp: Text;
        //HRChangeLog: Record "HR Change Entries";
        HRBankSumm: Record "HR Bank Summary";
        HREmpBA: Record "HR Employee Bank Accounts";
        curr_MonthDateOfLeaving: Integer;
        curr_YearDateOfLeaving: Integer;






    trigger OnOpenPage()
    var
        PRPayrollRights: Record "PR Payroll Access Rights";
    begin
        PRPayrollRights.Reset();
        PRPayrollRights.SetRange("User ID", UserId());
        if PRPayrollRights.IsEmpty() then begin
            Error('You are not authorized to access this page. Please contact HR department');
        end;
    end;
}

#pragma implicitwith restore


