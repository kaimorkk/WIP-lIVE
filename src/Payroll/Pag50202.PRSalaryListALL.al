
page 52193589 "PR Salary List (ALL)"
{
    CardPageID = "PR Header Salary Card - ALL";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee";
    SourceTableView = where(Status = filter(Active), "Employee Category Type" = filter(<> Board));
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

                // field("Old Staff No."; Rec."No.")
                // {
                //     ApplicationArea = ALL;

                // }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                // field(FullName; Rec.FullName())
                // {
                //     ApplicationArea = Basic;
                //     StyleExpr = StyleTextExp;
                // }

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
            group(Transactions)
            {
                action(AssignEarningDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Earning/Deductions';
                    Image = AssessFinanceCharges;
                    RunObject = Page "PR Employee Transactions";
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


                    // //Display payslip report
                    // PRPeriodTrans.SetRange("Employee Code", "No.");
                    // PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", SelectedPeriod);
                    // Report.Run(Report::"PR Employee Payslip", true, false, PRPeriodTrans);
                end;
            }
            action(PREmployeePayslip)
            {
                Caption = 'PR Employee Payslip';
                Image = Accounts;
                ApplicationArea = Basic, Suite;
                Visible = false;
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
                    //Report.Run(Report::"PR Employee Payslip", true, false, PRPeriodTrans);
                end;
            }
            action(ProcessPayroll)
            {
                ApplicationArea = Basic;
                Caption = 'Run Payroll';
                Image = PayrollStatistics;

                trigger OnAction()
                var

                begin
                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;
                    HrEmp.reset();
                    HrEmp.setrange(HrEmp.Status, HrEmp.Status::Active);
                    HrEmp.setfilter(HrEmp."Date Of Leaving", '<>%1', 0D);
                    HREmp.SetFilter(HREmp."Employee Category Type", '<>%1', HREmp."Employee Category Type"::Board);
                    if HrEmp.Find('-') then begin
                        repeat
                            if (HrEmp."Date Of Leaving" < SelectedPeriod) and (Date2dmy(HrEmp."Date Of Leaving", 2) <> Date2dmy(SelectedPeriod, 2)) then begin
                                HrEmp.Status := HrEmp.Status::Inactive;
                                HrEmp.modify();
                            end;
                        until HrEmp.Next = 0;
                    end;



                    //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                    //fn_AutoDeactivateStaff;

                    //Ensure all the Transaction Codes marked as Mandatory have been assigned to All Employees
                    fn_EnsureMandatoryTransCodesAssignedToAllStaff(SelectedPeriod);
                    ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, '', EmpType::Normal);
                    if PRSalaryCard.Get(Rec."No.") then begin
                        Clear("Employee");
                        "Employee".reset;
                        "Employee".setrange(Status, Rec.Status::Active);
                        //Employee.SetRange("Employee Type",Employee."Employee Type"::Primary);
                        if "Employee".Find('-') then begin

                            ProgressWindow.Open('Processing Salary #1#################################################################');
                            repeat
                                ProgressWindow.Update(1, "Employee"."No." + ':' + "Employee"."FullName");
                                if Employee."Employee Type" = Employee."Employee Type"::Primary then begin/// Filter out seconded employees, judges etc
                                    Employee.Validate(Present);
                                    "Employee".TestField("Employee"."Posting Group");
                                end;


                                if PRSalaryCard.Get("Employee"."No.") then begin
                                    ProcessPayroll.fnProcesspayroll("Employee"."No.", "Employee"."Employment Date"
                                    , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    , SelectedPeriod, SelectedPeriod, '', '', "Employee"."Date Of Leaving", true,
                                    "Employee"."Global Dimension 2 Code", PRSalaryCard."Insurance Certificate?", false);



                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;
                            // end else begin

                            // end;
                            until "Employee".Next = 0;
                            ProgressWindow.Close;
                        end;



                        //CODEUNIT
                        Commit();
                        if Confirm('Processing complete. Run the Company Payslip Report for %1', true, PRPeriod."Period Name") = true then
                            //  Report.Run(Report::prPeriodTran, true, false);
                            Report.Run(Report::"PR Company Payslip Summary", true, false);
                    end;
                end;
            }

            action(ProcessCurrent)
            {
                ApplicationArea = Basic;
                Caption = 'Run Current';
                Image = Period;

                trigger OnAction()
                var
                    Text000: label '@1@@@@@@@@@@@@@@@@@@@@@';
                begin

                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                    //fn_AutoDeactivateStaff;
                    //Mark Employee as in InActive if Curr Period Opened is > than Date of Separtion

                    if PRSalaryCard.Get(Rec."No.") then begin
                        Clear("Employee");
                        ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, Rec."No.", EmpType::Normal);
                        "Employee".SetRange("Employee".Status, "Employee".Status::Active);
                        "Employee".SetRange("Employee"."No.", Rec."No.");
                        if "Employee".FindFirst() then begin
                            Employee.Validate(Present);
                            ProgressWindow.Open('Processing Salary #1############################################');
                            repeat
                                ProgressWindow.Update(1, "Employee"."No." + ':' + "Employee"."FullName");
                                if PRSalaryCard.Get("Employee"."No.") then begin
                                    ProcessPayroll.fnProcesspayroll("Employee"."No.", "Employee"."Employment Date"
                                    , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    , SelectedPeriod, SelectedPeriod, '', '', "Employee"."Date Of Leaving", true,
                                    "Employee"."Global Dimension 1 Code", PRSalaryCard."Insurance Certificate?", false);
                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;

                            until "Employee".Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit();
                        PRSalaryCard.SetRange("Employee Code", Rec."No.");
                        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                        Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);

                    end;
                end;
            }
            action(ProcessCurrent2)
            {
                ApplicationArea = Basic;
                Caption = 'Run Current Group';
                Image = Period;

                trigger OnAction()
                var
                    Text000: label '@1@@@@@@@@@@@@@@@@@@@@@';
                    EmpRec: Record "Employee";
                begin

                    PRPeriod.Reset;
                    PRPeriod.SetRange(PRPeriod.Closed, false);
                    if PRPeriod.FindFirst() then begin
                        SelectedPeriod := PRPeriod."Date Opened";
                    end else begin
                        Error('No Payroll period found');
                    end;

                    //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                    //fn_AutoDeactivateStaff;
                    //Mark Employee as in InActive if Curr Period Opened is > than Date of Separtion

                    if PRSalaryCard.Get(Rec."No.") then begin
                        Clear("Employee");
                        EmpRec.get(Rec."No.");

                        "Employee".SetRange("Employee".Status, "Employee".Status::Active);
                        "Employee".SetRange("Employee"."Posting Group", EmpRec."Posting Group");
                        if "Employee".FindFirst() then begin
                            ProgressWindow.Open('Processing ' + EmpRec."Posting Group" + ' Salary #1############################################');
                            repeat
                                ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, "Employee"."No.", EmpType::Normal);
                                ProgressWindow.Update(1, "Employee"."No." + ':' + "Employee"."FullName");
                                if PRSalaryCard.Get("Employee"."No.") then begin
                                    ProcessPayroll.fnProcesspayroll("Employee"."No.", "Employee"."Employment Date"
                                    , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    , SelectedPeriod, SelectedPeriod, '', '', "Employee"."Date Of Leaving", true,
                                    "Employee"."Global Dimension 1 Code", PRSalaryCard."Insurance Certificate?", false);
                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;

                            until "Employee".Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit();
                        PRSalaryCard.SetRange("Employee Code", Rec."No.");
                        PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
                        Report.Run(Report::"PR Individual Payslip", true, false, PRSalaryCard);

                    end;
                end;
            }
            // action(SendPayslip)
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Send Payslip Via Email';
            //     Image = Period;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     PromotedIsBig = true;

            //     trigger OnAction()
            //     var
            //         SMTPMail: Codeunit "Email Message";
            //         SendEmail: codeunit email;
            //         MailManagement: Codeunit "Mail Management";
            //         SendToList: List of [Text];
            //         SenderEmail: Text;
            //         ret: Boolean;
            //         // EmailSender: Record "Email Sender";
            //         HRSetup: Record "Human Resources Setup";
            //         subject: Text;
            //         message: Text;
            //         ReportFileName: Text[250];
            //         FILESPATH: Text;

            //     begin
            //         HRSetup.Get();
            //         HRSetup.TestField("Reports File Path");
            //         FILESPATH := HRSetup."Reports File Path";
            //         PRPeriod.Reset;
            //         PRPeriod.SetRange(PRPeriod.Closed, false);
            //         if PRPeriod.FindFirst() then begin
            //             SelectedPeriod := PRPeriod."Date Opened";
            //         end else begin
            //             Error('No Payroll period found');
            //         end;
            //         "Employee".reset;
            //         "Employee".SetRange("Employee".Status, "Employee".Status::Active);
            //         //"Employee".SetRange("Employee"."No.", "No.");
            //         if "Employee".Find('-') then begin
            //             begin
            //                 repeat
            //                     PRSalaryCard.Reset();
            //                     PRSalaryCard.SetRange("Employee Code", "Employee"."No.");
            //                     PRSalaryCard.SetRange(PRSalaryCard."Period Filter", SelectedPeriod);
            //                     if PRSalaryCard.Find('-') then
            //                         Report.SaveAsPdf(Report::"PR Individual Payslip", FILESPATH + "Employee"."No." + '.pdf', PRSalaryCard);
            //                     ReportFileName := FILESPATH + Rec."No." + '.pdf';
            //                     SendToList.Add("Employee"."Company E-Mail");
            //                     subject := 'PAYSLIP FOR' + Format(SelectedPeriod);
            //                     message := 'Kindly find attached your payslip.';
            //                     SMTPMail.Create(SendToList, subject, message, true);
            //                     SMTPMail.AddAttachment(FILESPATH, FILESPATH + Rec."No." + '.pdf', ReportFileName);
            //                     SendEmail.Send(SMTPMail, Enum::"Email Scenario"::Default);
            //                 until "Employee".next = 0;
            //             end;

            //         end;
            //     end;
            // }
            action(EmailPayslips)
            {
                Caption = 'Send Payslip Via Email';
                ApplicationArea = All;
                Image = Email;
                trigger OnAction()
                var
                    Employee, Employee2 : Record Employee;
                    Email: Codeunit Email;
                    EmailMessage: Codeunit "Email Message";
                    InStr, InStr2 : Instream;
                    TempBlob: Codeunit "Temp Blob";
                    Body: Text;
                    Subject: Text[100];
                    RecRef: RecordRef;
                    Recipients: List of [Text];
                    OutStr, OutStr2 : OutStream;
                    Filename: Text;
                    Parameters: Text;
                    PayPeriod: Record "PR Payroll Periods";
                    Payslip: Report "PR Individual Payslip";
                    PayrollLines: Record "Payroll Lines";
                    HrSetup: Record "Human Resources Setup";
                begin

                    Employee.Reset();
                    Employee.SetRange(Status, Employee.Status::Active);
                    Employee.SetRange(Employee."No.", Rec."No.");
                    if Employee.Find('-') then begin


                        Clear(Recipients);
                        Clear(RecRef);
                        Clear(InStr);
                        Clear(OutStr);
                        PRPeriod.Reset;
                        PRPeriod.SetRange(PRPeriod.Closed, true);
                        if PRPeriod.FindLast() then
                            PayPeriod.Get(PRPeriod."Date Opened");
                        if Employee."Company E-Mail" <> '' then begin
                            Recipients.Add(Employee."Company E-Mail");
                            Subject := PayPeriod."Period Name" + 'Payslip';
                            Body := 'Dear ' + Employee."First Name" + ', <br>Please find attached your payslip for the period ' + PayPeriod."Period Name";
                            EmailMessage.Create(Recipients, Subject, Body, true);
                            Filename := Employee."No." + '_' + PayPeriod."Period Name" + '.pdf';
                            Employee2.Reset();
                            Employee2.SetRange("No.", Employee."No.");
                            //Employee2.SetRange("Pay Period Filter", PayPeriod."Date Opened");
                            Employee2.FindFirst();
                            Employee2."Pay Period Filter" := PayPeriod."Date Opened";
                            Employee2.Modify();
                            if HrSetup.Get() then begin
                                HrSetup."Payroll Period" := PayPeriod."Date Opened";
                                HrSetup.Modify();
                            end;

                            RecRef.GetTable(Employee2);
                            TempBlob.CreateOutStream(OutStr);
                            Report.SaveAs(Report::"PR Individual Payslip", '', ReportFormat::Pdf, OutStr, RecRef);
                            TempBlob.CreateInStream(InStr);
                            EmailMessage.AddAttachment(Filename, 'PDF', InStr);

                            Email.Send(EmailMessage);

                            Message('Payslip sent to E-mail successfully');
                        end;
                    end;

                end;
            }
            action("Re-Validate Transaction Codes")
            {
                ApplicationArea = All;
                Image = ValidateEmailLoggingSetup;
                trigger OnAction()
                var
                    SalPointer: record "Salary Pointers";
                    SalScale: record "Salary Scales";
                    SalaryCard: record "PR Salary Card";
                    EmpEarnings: record "PR Employee Transactions";
                    PayrollSetup: record "PR Vital Setup Info";
                    ScaleBenefits2: Record "Scale Benefits";
                    BasicSalary: decimal;
                    PRPayrollPeriods: Record "PR Payroll Periods";
                    SalaryPointers: record "Salary Pointers";
                    GrossPay: Decimal;
                    EmpEarning2: record "PR Employee Transactions";
                    PrTrans: Record "PR Transaction Codes";
                    HrEmp: Record Employee;
                begin
                    PRPayrollPeriods.Reset();
                    PRPayrollPeriods.Setrange(PRPayrollPeriods.Closed, false);
                    if PRPayrollPeriods.find('-') then
                        EmpEarning2.Reset();
                    // EmpEarning2.SetRange(EmpEarning2."Employee Code", "No.");
                    EmpEarning2.SetRange(EmpEarning2."Payroll Period", PRPayrollPeriods."Date Opened");
                    //EmpEarning2.SetRange(EmpEarning2."coop parameters", EmpEarning2."coop parameters"::Pension);
                    //EmpEarning2.SetRange(EmpEarning2."Transaction Type", EmpEarning2."Transaction Type"::Income);
                    if EmpEarning2.Find('-') then begin
                        repeat
                            if HrEmp.Get(EmpEarning2."Employee Code") then
                                if (PrTrans.Get(EmpEarning2."Transaction Code")) and (HrEmp.Status = HrEmp.Status::Active) then begin
                                    if PrTrans."Recalculate Basic Changes" then begin
                                        EmpEarning2.Validate("Transaction Code");
                                        EmpEarning2.Modify();
                                    end;
                                end;
                        until EmpEarning2.Next() = 0;
                    end;
                    Message('Completed Successfully');

                end;
            }

            action("Correct Revalidation")
            {
                ApplicationArea = All;
                Image = ChangeBatch;
                trigger OnAction()
                var
                    SalPointer: record "Salary Pointers";
                    SalScale: record "Salary Scales";
                    SalaryCard: record "PR Salary Card";
                    EmpEarnings: record "PR Employee Transactions";
                    PayrollSetup: record "PR Vital Setup Info";
                    ScaleBenefits2: Record "Scale Benefits";
                    BasicSalary: decimal;
                    PRPayrollPeriods: Record "PR Payroll Periods";
                    SalaryPointers: record "Salary Pointers";
                    GrossPay: Decimal;
                    EmpEarning2: record "PR Employee Transactions";
                    PrTrans: Record "PR Transaction Codes";
                    HrEmp: Record Employee;
                    PCAs: Record "prBasic pay PCA";
                    objPeriod: Record "pr Payroll Periods";
                    uSetup: Record "User Setup";
                    mPayrollCode: Code[50];
                    objEmp: Record "Employee";
                    objSalCard: Record "pr Salary Card";
                    objEmpTrans: Record "pr Employee Transactions";
                    objEmpTransPCA: Record "prEmployee Trans PCA";
                    objPayrollPeriod: Record "pr Payroll Periods";
                    intMonth: Integer;
                    intYear: Integer;
                    dtPAyrollPeriod: Date;
                    dim1: Code[50];
                    dim2: Code[50];
                    dim3: Code[50];
                    dim4: Code[50];
                    UserSetup: Record "User Setup";
                    Inaonekana: Boolean;
                    Fichua: Boolean;
                    objEmpTrans2: Record "pr Employee Transactions";
                    PrVital: record "PR Vital Setup Info";
                    pension: decimal;
                    SpecialTransType: Option "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief";
                    Payroll: Codeunit "PR Payroll Processing";
                    objEmpTrans3: Record "pr Employee Transactions";
                    PayrollBuffer: Record "PR Payroll Buffer";
                    PRTransactions: Record "PR Employee Transactions";
                    Data: Record "PR Transactions Buffer";
                    TransCode: Record "PR Transaction Codes";
                begin
                    PRPayrollPeriods.Reset();
                    PRPayrollPeriods.Setrange(PRPayrollPeriods.Closed, false);
                    if PRPayrollPeriods.find('-') then
                        intMonth := PRPayrollPeriods."Period Month";
                    intYear := PRPayrollPeriods."Period Year";
                    dtPAyrollPeriod := PRPayrollPeriods."Date Opened";
                    PCAs.Reset();
                    PCAs.SetRange(PCAs."Payroll Period", PRPayrollPeriods."Date Opened");
                    PCAs.SetRange(PCAs.Status, PCAs.Status::Posted);
                    PCAs.SetRange(PCAs."Document Type", PCAs."Document Type"::PCA);
                    if PCAs.find('-') then begin
                        repeat
                            objEmpTransPCA.Reset;
                            objEmpTransPCA.SetRange(objEmpTransPCA."Employee Code", PCAs."Employee Code");
                            objEmpTransPCA.SetRange(objEmpTransPCA."Payroll Period", PCAs."Payroll Period");
                            // objEmpTransPCA.SetRange(objEmpTransPCA."Change Advice Serial No.", PCAs."Change Advice Serial No.");
                            if objEmpTransPCA.Find('-') then begin
                                repeat
                                begin

                                    dim1 := objEmpTransPCA."Global Dimension 1 Code";
                                    dim2 := objEmpTransPCA."Global Dimension 2 Code";
                                    dim3 := objEmpTransPCA."Shortcut Dimension 3 Code";
                                    dim4 := objEmpTransPCA."Shortcut Dimension 4 Code";

                                    if dim1 = '' then dim1 := objEmp."Global Dimension 1 Code";
                                    if dim2 = '' then dim2 := objEmp."Department Code";


                                    objEmpTrans.Reset;
                                    objEmpTrans.SetRange(objEmpTrans."Employee Code", objEmpTransPCA."Employee Code");
                                    objEmpTrans.SetRange(objEmpTrans."Payroll Period", objEmpTransPCA."Payroll Period");
                                    objEmpTrans.SetRange(objEmpTrans."Transaction Code", objEmpTransPCA."Transaction Code");
                                    // objEmpTrans.SetRange(objEmpTrans."Payroll Code", mPayrollCode);
                                    if objEmpTrans.Find('-') then begin
                                        if PrTrans.Get(objEmpTrans."Transaction Code") then
                                            if PrTrans."Calculation Method" = PrTrans."Calculation Method"::"Basic Pay" then begin

                                                objEmpTrans."Employee Code" := objEmpTransPCA."Employee Code";
                                                objEmpTrans."Transaction Code" := objEmpTransPCA."Transaction Code";
                                                objEmpTrans.Validate("Transaction Code");
                                                objEmpTrans."Period Month" := intMonth;
                                                objEmpTrans."Period Year" := intYear;
                                                objEmpTrans."Payroll Period" := dtPAyrollPeriod;
                                                objEmpTrans."Transaction Name" := objEmpTransPCA."Transaction Name";
                                                objEmpTrans.Amount := objEmpTransPCA.SubTotal;
                                                objEmpTrans.Balance := objEmpTransPCA.Balance;
                                                objEmpTrans."Payroll Period" := objEmpTransPCA."Payroll Period";

                                                objEmpTrans."Start Date" := objEmpTransPCA."Start Date";
                                                objEmpTrans."End Date" := objEmpTransPCA."End Date";
                                                objEmpTrans.Modify;


                                            end;
                                    end;
                                end;

                                until objEmpTransPCA.Next = 0;
                            end;
                        until PCAs.Next() = 0;
                    end;
                    PayrollBuffer.Reset();
                    PayrollBuffer.SetRange(PayrollBuffer."Payroll Period", PRPayrollPeriods."Date Opened");
                    PayrollBuffer.SetRange(PayrollBuffer.Status, PayrollBuffer.Status::Posted);
                    if PayrollBuffer.find('-') then begin
                        repeat
                            Data.Reset();
                            Data.SetRange("Document No", PayrollBuffer."Payroll-Num");
                            Data.SetRange("Payroll Period", PayrollBuffer."Payroll Period");
                            if Data.FindSet() then begin
                                repeat
                                    if PrTrans.Get(Data."Transaction Code") then
                                        if PrTrans."Calculation Method" = PrTrans."Calculation Method"::"Basic Pay" then begin

                                            PRTransactions.Init();
                                            PRTransactions."Employee Code" := Data."Employee Code";
                                            PRTransactions.Validate("Transaction Code", Data."Transaction Code");
                                            PRTransactions."Payroll Period" := Data."Payroll Period";
                                            PRTransactions."Period Month" := Data."Period Month";
                                            PRTransactions."Period Year" := Data."Period Year";
                                            PRTransactions."Reference No2" := Data."Reference No";
                                            PRTransactions.Amount := Data.Amount;
                                            PRTransactions.Balance := Data.Balance;
                                            if not PRTransactions.Insert(true) then
                                                PRTransactions.Modify();
                                        end;

                                until Data.Next() = 0;
                            end;

                        until PayrollBuffer.Next() = 0;
                    end;

                    Message('Completed Successfully');

                end;
            }




        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(ProcessPayroll_Promoted; ProcessPayroll)
                {
                }
                actionref(ProcessCurrent_Promoted; ProcessCurrent)
                {
                }
                actionref(ProcessCurrent2_Promoted; ProcessCurrent2)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Reports', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref(EmailPayslips_Promoted; EmailPayslips)
                {
                }
                actionref("Re-Validate Transaction Codes_Promoted"; "Re-Validate Transaction Codes")
                {
                }
                actionref("Correct Revalidation_Promoted"; "Correct Revalidation")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Functions', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(ViewPayslip_Promoted; ViewPayslip)
                {
                }
                actionref(AssignEarningDeductions_Promoted; AssignEarningDeductions)
                {
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        if Format(Rec.Status) = 'Active' then StyleTextExp := 'None' else StyleTextExp := 'Attention';
    end;


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

    procedure fnLastLineNo() LastLineNo: Integer
    var
    // HRChangeLog_2: Record "HR Change Entries";
    begin
        /*  HRChangeLog_2.Reset;
         if HRChangeLog_2.FindLast then begin
             LastLineNo := HRChangeLog_2."Line No";
         end else begin
             LastLineNo := 1;
         end; */
    end;


    procedure fn_EnsureMandatoryTransCodesAssignedToAllStaff(CurrPayrollPeriod: Date)
    var
        PRTransCode_4: Record "PR Transaction Codes";
        PREmpTrans_4: Record "PR Employee Transactions";
        HREmp_4: Record "Employee";
    begin
        PRTransCode_4.Reset();
        PRTransCode_4.SetRange(Mandatory, true);
        if PRTransCode_4.FindSet(false, false) then begin
            repeat
                HREmp_4.Reset();
                HREmp_4.SetRange(Status, Rec.Status::Active);
                if HREmp_4.FindSet(false, false) then begin
                    repeat
                        PREmpTrans_4.SetRange("Payroll Period", CurrPayrollPeriod);
                        PREmpTrans_4.SetRange("Employee Code", HREmp_4."No.");
                        PREmpTrans_4.SetRange("Transaction Code", PRTransCode_4."Transaction Code");
                        if not PREmpTrans_4.FindFirst() then begin
                            Error('[ %1 ] has not been assigned to [ %2 ] during payroll period [ %3 ]',
                                 PRTransCode_4."Transaction Name", HREmp_4."FullName", CurrPayrollPeriod);
                        end else begin
                            PREmpTrans_4.TestField(Amount);
                        end;
                    until HREmp_4.Next() = 0;
                end;

            until PRTransCode_4.Next() = 0;
        end;
    end;

    local procedure fn_AutoDeactivateStaff()
    var
        curr_MonthDate_Leaving: Integer;
        curr_YearDate_Leaving: Integer;
        curr_PayPeriod_Month: Integer;
        curr_PayPeriod_Year: Integer;
        PayrollPeriod30D: Date;
    begin
        //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
        Clear(HREmp);
        HREmp.SetFilter(HREmp."Date Of Leaving", '<>%1', 0D);

        HREmp.SetRange(HREmp.Status, HREmp.Status::Active);
        if HREmp.FindFirst() then begin
            repeat
                //Don't Disable an Employee if he is exiting in the same Month and Same Year as the current Payroll Period
                curr_MonthDate_Leaving := Date2dmy(HREmp."Date Of Leaving", 2);
                curr_YearDate_Leaving := Date2dmy(HREmp."Date Of Leaving", 3);

                curr_PayPeriod_Month := Date2dmy(PRPeriod."Date Opened", 2);
                curr_PayPeriod_Year := Date2dmy(PRPeriod."Date Opened", 3);

                //1. Check if the year is the same
                if curr_PayPeriod_Year = curr_YearDate_Leaving then begin
                    //Check if Month of Leaving is Same as Current Period Month and Period Year
                    if curr_MonthDate_Leaving = curr_PayPeriod_Month then begin
                        //We dont remove him
                    end else begin
                        if HREmp."Date Of Leaving" < PRPeriod."Date Opened" then begin
                            HREmp.Status := HREmp.Status::InActive;
                            HREmp.Modify;

                            //  HRChangeLog.Init;

                            /*  HRChangeLog."Line No." := fnLastLineNo + 10;
                             HRChangeLog."Date Modified" := HREmp."Date Of Leaving the Company";
                             HRChangeLog."Modified by" := 'AUTO SYSTEM CHANGE';
                             HRChangeLog."No." := HREmp."No.";
                             HRChangeLog."Old Value" := '';
                             HRChangeLog."New Value" := Format(HREmp."Date Of Leaving the Company");
                             HRChangeLog."Field Changed" := 'Date Of Leaving the Company';
                             HRChangeLog."Payroll Period" := SelectedPeriod; */

                            // HRChangeLog.Insert;
                        end;
                    end;
                end else begin
                    if HREmp."Date Of Leaving" < PRPeriod."Date Opened" then begin
                        HREmp.Status := HREmp.Status::InActive;
                        HREmp.Modify;

                        // HRChangeLog.Init;

                        // HRChangeLog."Line No" := fnLastLineNo + 10;
                        // HRChangeLog."Change Date" := HREmp."Date Of Leaving";
                        // HRChangeLog.UserID := 'AUTO SYSTEM CHANGE';
                        // HRChangeLog."employee No" := HREmp."No.";
                        // HRChangeLog."Old Value" := '';
                        // HRChangeLog."New Value" := Format(HREmp."Date Of Leaving");
                        // //HRChangeLog."Reason for Change":=HREMP."Termination Grounds";
                        // HRChangeLog."Change Description" := 'Date Of Leaving the Company';
                        // // HRChangeLog.p := SelectedPeriod;

                        // HRChangeLog.Insert;
                    end;
                end;
            until HREmp.Next = 0;

        end;
        //Mark Employee as in InActive if Curr Period Opened is > than Date of Separtion
    end;

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

