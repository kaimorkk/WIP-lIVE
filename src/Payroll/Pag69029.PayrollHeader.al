

page 52193741 "Payroll Header"
{
    PageType = Card;
    SourceTable = "Payroll Header";
    SourceTableView = where(Posted = const(false),
                            Status = filter(<> Released));
    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field("Gross Pay"; Rec."Gross Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Pay field.';
                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Net Pay field.';
                }
                field("Total Employer Deductions"; Rec."Total Employer Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Payable"; "Total Payable")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Deductions field.';
                }
                field("Total Non-Payroll Payments"; Rec."Total Non-Payroll Payments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Non-Payroll Payments field.';
                }
                field("Pension Arrears"; Rec."Pension Arrears")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Pension Arrears field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }

                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    //Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
            part(Control14; "Payroll Lines")
            {
                SubPageLink = "Payroll Header" = field("No.");
                ApplicationArea = Basic;
            }
            part("Non-Payroll Payments"; "Non-Payroll Payments")
            {
                SubPageLink = "Salary Voucher" = field("No.");
                ApplicationArea = Basic;

            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup16)
            {
                action("Run Payroll")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Caption = 'Populate Payroll Entries';
                    ToolTip = 'Executes the Run Payroll action.';
                    trigger OnAction()
                    var
                        emp: Record Employee;
                        PrSalaryList: Page "PR Salary List (ALL)";
                        PayrollLines: Record "Payroll Lines";
                        LineNo: Integer;
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.TestField("Payroll Period");
                        SelectedPeriod := Rec."Payroll Period";
                        LineNo := 0;
                        ///Clear Existing payroll Lines
                        PayrollLines.Reset();
                        PayrollLines.SetRange("Payroll Header", Rec."No.");
                        if PayrollLines.FindSet() then
                            PayrollLines.DeleteAll();
                        //Mark Employee as in In Active if Curr Period Opened is > than Date of Separtion
                        //fn_AutoDeactivateStaff;

                        //Ensure all the Transaction Codes marked as Mandatory have been assigned to All Employees
                        PrSalaryList.fn_EnsureMandatoryTransCodesAssignedToAllStaff(SelectedPeriod);
                        //ProcessPayroll.fnClearCurrentPeriod(SelectedPeriod, SelectedPeriod, '');
                        Employee.reset;
                        Employee.setrange(Status, Employee.Status::Active);
                        if Employee.Find('-') then begin
                            ProgressWindow.Open('Processing Salary #1#################################################################');
                            repeat
                                Employee.TestField(Employee."Posting Group");
                                LineNo += 1;
                                ProgressWindow.Update(1, Employee."No." + ':' + Employee."FullName");
                                if PRSalaryCard.Get(Employee."No.") then begin
                                    // ProcessPayroll.fnProcesspayroll(Employee."No.", Employee."Employment Date"
                                    // , PRSalaryCard."Basic Pay", PRSalaryCard."Pays PAYE", PRSalaryCard."Pays NSSF", PRSalaryCard."Pays NHIF"
                                    // , SelectedPeriod, SelectedPeriod, '', '', Employee."Date Of Leaving", true,
                                    // Employee."Global Dimension 2 Code", PRSalaryCard."Insurance Certificate?", false);

                                    //Insert Payroll Lines
                                    PayrollLines.Init();
                                    PayrollLines."Payroll Header" := Rec."No.";
                                    PayrollLines."Line No" := LineNo;
                                    PayrollLines."Personal No." := Employee."No.";
                                    PayrollLines."Employee Name" := Employee.FullName();
                                    PayrollLines."Payroll Period" := SelectedPeriod;
                                    PayrollLines."Payroll Group" := Employee."Posting Group";

                                    PRPeriodT.Reset();
                                    PRPeriodT.SetRange("Employee Code", PayrollLines."Personal No.");
                                    PRPeriodT.SetRange("Payroll Period", PayrollLines."Payroll Period");
                                    if PRPeriodT.FindSet() then
                                        repeat
                                            case
                                            PRPeriodT."Transaction Code" of
                                                'BPAY':
                                                    PayrollLines."Basic Salary" := PRPeriodT.Amount;
                                                'GPAY':
                                                    PayrollLines."Gross Pay" := PRPeriodT.Amount;
                                                'NPAY':
                                                    PayrollLines.Netpay := PRPeriodT.Amount;
                                                'TOT-DED':
                                                    PayrollLines."Total Deduction" := PRPeriodT.Amount;
                                            end;

                                        until PRPeriodT.Next() = 0;
                                    if PayrollLines."Gross Pay" <> 0 then
                                        PayrollLines.Insert();
                                end else begin
                                    //ERROR('Employee not found in PR Salary Card table, please capture Basic PY information');
                                end;
                            until Employee.Next = 0;
                            ProgressWindow.Close;
                        end;

                        Commit();
                        //if Confirm('Processing complete. Run the Company Payslip Report for %1', true, PRPeriod."Period Name") = true then
                        //   Report.Run(Report::"PR Company Payslip Summary", true, false);
                    end;
                }
                action("Master Roll")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    ToolTip = 'Executes the Master Roll action.';
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"PR Master Roll Report", true, true, emp)
                    end;
                }
                action(PREarningandDeductions)
                {
                    Caption = 'Monthly Transactions Summary- PY 20';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Company Payroll Summary 3";
                }
                action(Party)
                {
                    Caption = 'Third Party Deductions';
                    Image = SelectReport;
                    ApplicationArea = Basic, Suite;
                    // RunObject = report "Third Party Deductions2";
                    trigger OnAction()
                    var
                        PrTrans: Record "PR Transaction Codes";
                    begin
                        PrTrans.SetFilter(PrTrans."Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"Third Party Deductions2", true, true, PrTrans)
                    end;
                }
                action(Party1)
                {
                    Caption = 'Third Party Deductions Individual';
                    Image = RefreshDiscount;
                    ApplicationArea = Basic, Suite;
                    RunObject = report "Third Party Deductions Individ";
                }
                action(PRPensionReport)
                {
                    Caption = 'PR Pension Report';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    //RunObject = report "PR Pension Report";
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"PR Pension Report", true, true, emp)
                    end;
                }
                action(PRNHIFRemmitance)
                {
                    Caption = 'PR NHIF Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    //RunObject = report "PR NHIF Report";
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"PR NHIF Report", true, true, emp)
                    end;
                }

                action(PRNSSSFRemmitance)
                {
                    Caption = 'PR NSSF Remmitance';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    // RunObject = report "PR NSSF Report";
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"PR NSSF Report", true, true, emp)
                    end;
                }
                action("PR Housing Levy")
                {
                    Caption = 'PR Housing Levy';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    //RunObject = report "PR Housing Levy";
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(Report::"PR Housing Levy", true, true, emp)
                    end;
                }
                action("PR NITA")
                {
                    Caption = 'NITA';
                    Image = Transactions;
                    ApplicationArea = Basic, Suite;
                    RunObject = report NITA;
                    trigger OnAction()
                    var
                        employer: Record "PR Employer Deductions";
                    begin
                        employer.SetFilter(employer."Payroll Period", Format(Rec."Payroll Period"));
                        Report.Run(Report::NITA, true, true, employer)
                    end;
                }
                action("Payroll Cost Analysis")
                {
                    ApplicationArea = Basic;
                    Caption = ' Payroll Cost Analysis';
                    //  RunObject = Report "Payroll Cost Analysis";
                    ToolTip = 'Executes the  Payroll Cost Analysis action.';
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69055, true, true, emp)
                    end;
                }
                action("Transfer to Journal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Payroll to Journal';
                    Image = Post;
                    Visible = false;
                    //RunObject = report "PR Transfer To Journal - BATCH";
                }

            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    ToolTip = 'Executes the &Print action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(69001, true, true, Rec)
                    end;
                }
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    //Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin

                        VarVariant := Rec;
                        if CustomApprovals.CheckApprovalsWorkflowEnabled(VarVariant) then
                            CustomApprovals.OnSendDocForApproval(VarVariant);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                        //ApprovalsMgmt: Codeunit "Approval Mgmt Ext";
                        VarVariant: Variant;
                        CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    begin
                        VarVariant := Rec;
                        CustomApprovals.OnCancelDocApprovalRequest(VarVariant);
                        //ApprovalsMgmt.OnCancelPayrollHeaderApprovalRequest(Rec);
                    end;
                }

                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                        DocumentType: Enum "Approval Document Type";
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Payroll Header", DocumentType::"Salary Voucher", Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }

            }

            group("Payroll Reconcilliation")
            {
                Caption = 'Payroll Reconcilliation';
                action("Zero Earnings Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Earnings Report';
                    Image = "Report";
                    Visible = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "Zero Earnings Report";
                    ToolTip = 'Executes the Zero Earnings Report action.';
                }
                action("Zero Deductions Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Zero Deductions Report';
                    Image = "Report";
                    Visible = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //RunObject = Report "Zero Deductions Report";
                    ToolTip = 'Executes the Zero Deductions Report action.';
                }
                action("Employees Joining Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employees Joining Payroll';
                    Image = "Report";
                    Visible = false;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = false;
                    //  RunObject = Report "Employees Joining Payroll";
                    ToolTip = 'Executes the Employees Joining Payroll action.';
                }
                // action("Employees Leaving Payroll")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Employees Leaving Payroll';
                //     Image = "Report";

                //     Promoted = false;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = false;
                //     RunObject = Report "Employees Leaving Payroll";
                //     ToolTip = 'Executes the Employees Leaving Payroll action.';
                // }

                // action("Payroll Reconciliation Summary")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Payroll Reconciliation Summary';
                //     Image = "Report";
                //     Promoted = false;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = false;
                //     RunObject = Report "Payroll Reconciliation Summary";
                //     ToolTip = 'Executes the Payroll Reconciliation Summary action.';
                // }
                // action("Payroll Reconciliation Earning Detailed")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Payroll Reconciliation Earning Detailed';
                //     Image = "Report";
                //     Promoted = false;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = false;
                //     RunObject = Report "Payroll Reconciliation Earnin";
                //     ToolTip = 'Executes the Payroll Reconciliation Earning Detailed action.';
                // }
                // action("<Report Payroll Reconciliation D")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Payroll Reconciliation Deduction Detailed';
                //     Image = "Report";
                //     Promoted = false;
                //     //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //     //PromotedIsBig = false;
                //     RunObject = Report "Payroll Reconciliation Deduc.";
                //     ToolTip = 'Executes the Payroll Reconciliation Deduction Detailed action.';
                // }

            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref("Run Payroll_Promoted"; "Run Payroll")
                {
                }
                actionref("Transfer to Journal_Promoted"; "Transfer to Journal")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';

                actionref("Master Roll_Promoted"; "Master Roll")
                {
                }
            }
            group(Category_Category4)
            {
                Caption = 'Approvals', Comment = 'Generated from the PromotedActionCategories property index 3.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    trigger OnAfterGetRecord()
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status <> Rec.Status::Open then
            CurrPage.Editable := false;
        Rec.CalcFields("Gross Pay");
        rec.CalcFields("Total Employer Deductions");
        Rec.CalcFields("Total Non-Payroll Payments");
        "Total Payable" := Rec."Gross Pay" + Rec."Total Employer Deductions" + Rec."Total Non-Payroll Payments";
    end;

    var
        emp: Record Employee;
        //PayrollLines: Record "Payroll Pay Mode";
        LineNo: Integer;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "Payroll PeriodX";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        //DMSManagement: Codeunit "DMS Management";
        PRSalaryCard: Record "PR Salary Card";
        PRPeriod: Record "PR Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        PeriodMonth: Integer;
        PeriodYear: Integer;
        ProcessPayroll: Codeunit "PR Payroll Processing";
        Employee: Record "Employee";
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
        "Total Payable": Decimal;
}

#pragma implicitwith restore

