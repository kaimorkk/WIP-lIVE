

page 52193950 "Approved Salary Voucher"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Payroll Header";
    SourceTableView = where(Status = const(Released));

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
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Name field.';
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
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
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
                // action("Transfer to Journal")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Transfer Payroll to Journal';
                //     Image = Post;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;
                //     // RunObject = report "PR Transfer To Journal - DIM1";
                //     // RunObject = Report "PR Transfer To Journal Batch";
                // }
                // action("Transfer to Journal Batch")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Transfer Payroll to Journal Batch';
                //     Image = Post;
                //     Visible = false;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     PromotedIsBig = true;

                //     RunObject = Report "PR Transfer To Journal - BATCH";
                // }
                action("Generate Payroll Payment Voucher")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    Caption = 'Generate Payroll Payment Vouchers';
                    Image = CalculateRegenerativePlan;
                    trigger OnAction()
                    var
                        PayH: Record Payments;
                        PayH2: Record Payments;
                        PayL: Record "PV Lines1";
                        PrTransCode: Record "PR Transaction Codes";
                        PrTransGroup: Record "PR Trans Codes Groups";
                        BankSummary: Record "HR Bank Summary";
                        BankSummary2: Record "HR Bank Summary";
                        Banks: Record "PR Bank Accounts";
                        PVNo: Code[30];
                        CashMgt: Record "Cash Management Setup";
                        NoSeriesMgt: Codeunit NoSeriesManagement;
                        PRPeriod: Record "PR Period Transactions";
                        NoPeople: Integer;
                        Commission: Decimal;
                        lineno: Integer;
                        PRSetup: Record "PR Vital Setup Info";
                        Paymode: Record "Pay Mode";
                        BankAcc: Record "Bank Account";
                        GenLedgerSetup: Record "General Ledger Setup";
                    begin
                        // if Confirm('Do you wish to Generate Payroll Payment Vouchers?') then begin
                        //     PRSetup.Get();
                        //     GenLedgerSetup.Get();
                        //     // BankAcc.Reset();
                        //     // BankAcc.SetRange(BankAcc.Type, BankAcc.Type::Recurrent);
                        //     // if BankAcc.Find('-') then;
                        //     // Paymode.Reset();
                        //     // Paymode.SetRange(Paymode.Default, true);
                        //     // if Paymode.Find('-') then;
                        //     PrTransGroup.Reset();
                        //     if PrTransGroup.Find('-') then begin
                        //         Repeat
                        //             CashMgt.Get();
                        //             CashMgt.TestField("PV Nos");
                        //             PayH.Init();
                        //             // PVNo := NoSeriesMgt.GetNextNo(CashMgt."PV Nos", 0D, true);
                        //             PVNo := NoSeriesMgt.GetNextNo(GenLedgerSetup."Payments No", 0D, true);
                        //             PayH.No := PVNo;
                        //             PayH."Payment Type" := PayH."payment type"::"Payment Voucher";
                        //             // PayH."Document Type" := PayH."document type"::"Payment Voucher";
                        //             // PayH."PV Type" := PayH."PV Type"::Payroll;
                        //             // PayH."Posting Date" := Today;
                        //             PayH.Date := Today;
                        //             PayH.Validate("Paying Bank Account", BankAcc."No.");
                        //             PayH.Payee := PrTransGroup."Group Description";
                        //             PayH."Pay Mode" := Paymode.Code;
                        //             PayH."On behalf of" := PrTransGroup."Group Description";//+ ' - ' + Format(PayPeriod) + ' Payroll Payment';
                        //             PayH.Purpose := PrTransGroup."Group Description";// + ' - ' + Format(PayPeriod) + ' Payroll Payment';
                        //             PayH."Global Dimension 1 Code" := PRSetup."Payroll PVS Default Dim 1";
                        //             PayH."Global Dimension 2 Code" := PRSetup."Payroll PVS Default Dim 2";
                        //             PayH."Global Dimension 3 Code" := PRSetup."Payroll PVS Default Dim 3";
                        //             // PayH."Shortcut Dimension 4 Code" := PRSetup."Payroll PVS Default Dim 4";
                        //             // PayH."Shortcut Dimension 5 Code" := PRSetup."Payroll PVS Default Dim 5";
                        //             // PayH."Shortcut Dimension 6 Code" := PRSetup."Payroll PVS Default Dim 6";
                        //             // PayH."Applies- To Doc No." := AdvanceNo."No.";
                        //             PayH.Date := Today;
                        //             PayH.Insert;

                        //             PrTransCode.Reset();
                        //             PrTransCode.SetRange(PrTransCode."Group Code", PrTransGroup."Group Code");
                        //             if PrTransCode.Find('-') then begin
                        //                 repeat
                        //                     PRPeriod.Reset();
                        //                     PRPeriod.SetRange(PRPeriod."Transaction Code", PrTransCode."Transaction Code");
                        //                     PRPeriod.SetRange(PRPeriod."Payroll Period", Rec."Payroll Period");
                        //                     if PRPeriod.Find('-') then begin
                        //                         lineno := lineno + 1;
                        //                         Commission := 0;
                        //                         PayL.Init();
                        //                         PayL."PV No" := PVNo;
                        //                         PayL."Line No" := lineno;
                        //                         PayL."Account Type" := PayL."account type"::"G/L Account";
                        //                         PayL."Account No" := PrTransCode."GL Account";
                        //                         PayL.Validate("Account No");

                        //                         PRPeriod.CalcSums(Amount);
                        //                         NoPeople := PRPeriod.Count;
                        //                         if PrTransCode.Commission <> 0 then begin
                        //                             if PrTransCode."Commission Type" = PrTransCode."Commission Type"::"Flat Amount" then
                        //                                 Commission := PrTransCode.Commission * NoPeople;
                        //                             if PrTransCode."Commission Type" = PrTransCode."Commission Type"::Percentage then
                        //                                 Commission := PrTransCode.Commission / 100 * PRPeriod.Amount;
                        //                         end;
                        //                         PayL.Amount := PRPeriod.Amount - Commission;
                        //                         PayL.Insert();
                        //                     end;
                        //                 until PrTransCode.Next() = 0;
                        //             end;
                        //         until PrTransGroup.Next() = 0;
                        //     end;
                        //     Banks.Reset();
                        //     if Banks.Find('-') then begin
                        //         repeat
                        //             PayH2.Reset();
                        //             PayH2.SetRange(PayH2.Payee, Banks."Bank Code");
                        //             PayH2.SetRange(PayH2.Purpose, Banks."Bank Name" + ' - ' + Format(PayPeriod) + ' Net Pay');
                        //             if not PayH2.Find('-') then begin

                        //                 Banksummary.Reset();
                        //                 Banksummary.SetRange(Banksummary."Transaction Code", 'NPAY');
                        //                 Banksummary.SetRange(Banksummary."Payroll Period", Rec."Payroll Period");
                        //                 Banksummary.SetRange(Banksummary."Bank Code", Banks."Bank Code");
                        //                 if Banksummary.Find('-') then begin
                        //                     CashMgt.Get();
                        //                     CashMgt.TestField("PV Nos");
                        //                     PayH.Init();
                        //                     PVNo := NoSeriesMgt.GetNextNo(CashMgt."PV Nos", 0D, true);
                        //                     PayH.No := PVNo;
                        //                     PayH."Payment Type" := PayH."payment type"::"Payment Voucher";
                        //                     // PayH."Document Type" := PayH."document type"::"Payment Voucher";
                        //                     // PayH."PV Type" := PayH."PV Type"::Payroll;
                        //                     PayH.Payee := Banks."Bank Code";
                        //                     PayH.Date := Today;
                        //                     PayH."Pay Mode" := Paymode.Code;
                        //                     PayH.Validate("Paying Bank Account", BankAcc."No.");
                        //                     PayH."On behalf of" := Banks."Bank Name";// + ' - ' + Format(PayPeriod) + ' Net Pay';
                        //                     PayH.Purpose := Banks."Bank Name";// + ' - ' + Format(PayPeriod) + ' Net Pay';
                        //                     PayH."Global Dimension 1 Code" := PRSetup."Payroll PVS Default Dim 1";
                        //                     PayH."Global Dimension 2 Code" := PRSetup."Payroll PVS Default Dim 2";
                        //                     PayH."Global Dimension 3 Code" := PRSetup."Payroll PVS Default Dim 3";
                        //                     // PayH."Shortcut Dimension 4 Code" := PRSetup."Payroll PVS Default Dim 4";
                        //                     // PayH."Shortcut Dimension 5 Code" := PRSetup."Payroll PVS Default Dim 5";
                        //                     // PayH."Shortcut Dimension 6 Code" := PRSetup."Payroll PVS Default Dim 6";
                        //                     // PayH."Applies- To Doc No." := AdvanceNo."No.";
                        //                     PayH.Date := Today;
                        //                     PayH.Insert;
                        //                     lineno := lineno + 1;
                        //                     PayL.Init();
                        //                     PayL."PV No" := PVNo;
                        //                     PayL."Line No" := lineno;
                        //                     PayL."Account Type" := PayL."account type"::"G/L Account";
                        //                     PayL."Account No" := '7320018';
                        //                     PayL.Validate("Account No");
                        //                     Banksummary.CalcSums(Amount);
                        //                     PayL.Amount := Banksummary.Amount;
                        //                     PayL.Insert();
                        //                 end;


                        //             end;
                        //         until Banks.Next() = 0;
                        //     end;

                        //     Message('Payroll PVs created successfully');
                        // end;

                    end;


                }

                action("Run Payroll")
                {
                    ApplicationArea = Basic;
                    Image = Recalculate;
                    Visible = false;
                    ToolTip = 'Executes the Run Payroll action.';
                    trigger OnAction()
                    var
                        emp: Record Employee;
                    begin
                        //CurrPage.SETSELECTIONFILTER(FORMAT("Payroll Period"));
                        //REPORT.RUNMODAL(69004,TRUE,FALSE,REC);


                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69004, true, true, emp);
                        Report.Run(69007, true, true, emp)

                        /*
                        Assignmat.RESET;
                        Assignmat.SETRANGE(Assignmat.Type,Assignmat.Type::Payment);
                        Assignmat.SETRANGE(Assignmat."Payroll Period","Payroll Period");
                        IF Assignmat.FIND('-') THEN BEGIN
                         REPEAT
                           LineNo:=LineNo+1000;
                           PayrollLines."Line No":=LineNo;
                           PayrollLines."Payroll Header":="No.";
                           PayrollLines."Payroll Group":=Assignmat."Posting Group Filter";
                           PayrollLines."Annuitant Name":=Assignmat."First Name"+' '+Assignmat."Last Name"+' '+Assignmat."Middle Name";
                           //PayrollLines."Basic Arrears":=Assignmat."Basic Pay Arrears";
                           PayrollLines."Basic Pension":=Assignmat."Basic Pay";
                           PayrollLines."Gross Pay":=Assignmat.Amount;
                           PayrollLines.Netpay:=Assignmat.Amount;
                           PayrollLines.Wtax:=Assignmat.Amount;
                           PayrollLines."Annuitant No":=Assignmat."Employee No";
                           PayrollLines."Payroll Period":="Payroll Period";
                           PayrollLines.INSERT;
                         UNTIL Assignmat.NEXT=0;
                        END;
                        */

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
                action("Post Payroll")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Payroll';
                    Image = Post;
                    Visible = false;
                    ToolTip = 'Executes the Post Payroll action.';
                    trigger OnAction()
                    begin
                        // IF Status<>Status::Approved THEN
                        //   ERROR('Payroll Must be fully approved first before Posting');

                        //PayPeriod.SetFilter(PayPeriod."Starting Date", Format(Rec."Payroll Period"));
                        Report.Run(69059, true, true, PayPeriod);

                        DocNumber := 'PAYROLL' + Format(Date2dmy(Rec."Payroll Period", 2)) + Format(Date2dmy(Rec."Payroll Period", 3));
                        GLEntry.Reset;
                        GLEntry.SetRange(GLEntry."Document No.", DocNumber);
                        GLEntry.SetRange(GLEntry.Reversed, false);
                        if GLEntry.FindFirst then begin
                            Rec.Posted := true;
                            Rec."Posted By" := UserId;
                            Rec."Date Created" := Today;
                            Rec."Time Posted" := Time;
                            Rec.Modify;


                        end;
                    end;
                }
                action("EFT Export")
                {
                    ApplicationArea = Basic;
                    Image = report2;
                    Visible = false;
                    ToolTip = 'Executes the EFT Export action.';
                    trigger OnAction()
                    begin
                        emp.SetFilter(emp."Pay Period Filter", Format(Rec."Payroll Period"));
                        Report.Run(69005, true, true, emp)
                    end;
                }
                action(VPayslip)
                {
                    Caption = 'View payslip';
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Report.Run(report::"PR Individual Payslip", true, true);
                    end;
                }

                action(EmailPayslips)
                {
                    Caption = 'Email all payslips';
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
                        Employee.SetFilter("Payslip Sent Date", '<>%1', Rec."Payroll Period");
                        if Employee.FindSet() then
                            repeat
                                PayrollLines.Reset();
                                PayrollLines.SetRange("Personal No.", Employee."No.");
                                PayrollLines.SetRange("Payroll Period", Rec."Payroll Period");
                                PayrollLines.SetFilter(Netpay, '>%1', 0);
                                if PayrollLines.find('-') then begin
                                    Clear(Recipients);
                                    Clear(RecRef);
                                    Clear(InStr);
                                    Clear(OutStr);
                                    PayPeriod.Get(Rec."Payroll Period");
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
                                    end;
                                end;
                                Employee."Payslip Sent Date" := Rec."Payroll Period";
                                Employee.Modify(false);
                            until Employee.Next() = 0;
                    end;
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
                        Report.Run(69001, true, true, Rec);
                    end;
                }
                // action("&Print")
                // {
                //     ApplicationArea = Basic;
                //     Caption = '&Print';
                //     Ellipsis = true;
                //     Image = Print;
                //     Promoted = true;
                //     PromotedCategory = Process;
                //     ToolTip = 'Executes the &Print action.';
                //     trigger OnAction()
                //     begin
                //         //DocPrint.PrintPurchHeader(Rec);


                //         Rec.SetRange("No.", Rec."No.");
                //         Report.Run(Report::"Salary Payment Vouchers", true, true, Rec)
                //     end;
                // }
                // separator(Action29)
                // {
                // }
                action("Transfer to Journal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transfer Payroll to Journal';
                    Image = Post;
                    // RunObject = report "PR Transfer To Journal - DIM1";
                    RunObject = Report "PR Transfer To Journal Batch";
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
                    begin
                        ApprovalEntries.SetRecordFilters(Database::"Payroll Header", 19, Rec."No.");
                        ApprovalEntries.Run;
                    end;
                }
            }

            group(ActionGroup26)
            {
                action("&Navigate")
                {
                    ApplicationArea = Basic;
                    Caption = '&Navigate';
                    Image = Navigate;
                    Scope = Repeater;
                    ToolTip = 'Executes the &Navigate action.';
                    trigger OnAction()
                    begin
                        Navigate.SetDoc(Rec."Payroll Period", Rec."No.");
                        Navigate.Run;
                    end;
                }
                action("General Ledger Entries")
                {
                    ApplicationArea = Basic;
                    Image = LedgerBook;
                    RunObject = Page "General Ledger Entries";
                    RunPageLink = "Document No." = field("No."),
                                  "Posting Date" = field("Payroll Period");
                    ToolTip = 'Executes the General Ledger Entries action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Comment Sheet";
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("Post Payroll_Promoted"; "Post Payroll")
                {
                }
                actionref("Transfer to Journal_Promoted"; "Transfer to Journal")
                {
                }
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Generate Payroll Payment Voucher_Promoted"; "Generate Payroll Payment Voucher")
                {
                }
                actionref("Run Payroll_Promoted"; "Run Payroll")
                {
                }
                actionref("General Ledger Entries_Promoted"; "General Ledger Entries")
                {
                }
                actionref("&Print_Promoted"; "&Print")
                {
                }
                actionref("&Navigate_Promoted"; "&Navigate")
                {
                }
            }
            group(Category_Report)
            {
                actionref("Master Roll_Promoted"; "Master Roll")
                {
                }
                actionref("EFT Export_Promoted"; "EFT Export")
                {
                }
                actionref(VPayslip_Promoted; VPayslip)
                {
                }
                actionref(EmailPayslips_Promoted; EmailPayslips)
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
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false
    end;

    trigger OnOpenPage()
    begin
        if Rec.Status = Rec.Status::Released then
            CurrPage.Editable := false;
        Rec.CalcFields("Gross Pay");
        rec.CalcFields("Total Employer Deductions");
        Rec.CalcFields("Total Non-Payroll Payments");
        "Total Payable" := Rec."Gross Pay" + Rec."Total Employer Deductions" + Rec."Total Non-Payroll Payments";
    end;

    var
        emp: Record Employee;
        LineNo: Integer;
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Navigate: Page Navigate;
        Post: Boolean;
        GenLedgerSetup: Record "General Ledger Setup";
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order",Sclaims,"Imprest Memo","Payment Voucher","Petty Cash"," Imprest","Imprest Surrender",Payroll,"Store Requisition","Purchase Requisition","Leave Application","Bank Transfer","Transport Requisition";
        PayPeriod: Record "PR Payroll Periods";
        DocNumber: Text;
        GLEntry: Record "G/L Entry";
        SalaryCard: Record "PR Salary Card";
        "Total Payable": Decimal;
}

#pragma implicitwith restore

