Page 52194196 "Employees Card"
{
    Caption = 'Employee Card';
    Editable = false;
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;

                    trigger OnAssistEdit()
                    begin
                        if AssistEdit() then
                            CurrPage.Update;
                    end;
                }
                field(JobTitle; "Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleNameInitials; "Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name/Initials';
                }
                field(Initials; Initials)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Address)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; "Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(PostCodeCity; "Post Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Code/City';
                }
                field(City; City)
                {
                    ApplicationArea = Basic;
                }
                field(CountryRegionCode; "Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo; "Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(SearchName; "Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Gender2; Gender2)
                {
                    ApplicationArea = Basic;
                }
                field(LastDateModified; "Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(PostingGroup; "Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field(IncremantalMonth; "Incremental Month")
                {
                    ApplicationArea = Basic;
                    Caption = 'Incremantal Month';
                }
                field(ReliefAmount; "Relief Amount")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1000000001)
            {
                Caption = 'General';
                field(Paystax; "Pays tax")
                {
                    ApplicationArea = Basic;
                }
                field(TaxReliefAmount; "Tax Relief Amount")
                {
                    ApplicationArea = Basic;
                }
                field(PayMode; "Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field(BankAccountNumber; "Bank Account Number")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeesBank; "Employee's Bank")
                {
                    ApplicationArea = Basic;
                }
                field(BankBranch; "Bank Branch")
                {
                    ApplicationArea = Basic;
                }
                field(PayingBankCode; "Paying Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(HourlyRate; "Hourly Rate")
                {
                    ApplicationArea = Basic;
                }
                field(DailyRate; "Daily Rate")
                {
                    ApplicationArea = Basic;
                }
                field(PIN; "P.I.N")
                {
                    ApplicationArea = Basic;
                    Caption = 'P.I.N';
                    Editable = true;
                }
                field(NHIFNo; "N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(NSSFNo; "Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'NSSF No.';
                    Editable = true;
                }
                field(IDNumber; "ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(ProRataCalculated; "Pro-Rata Calculated")
                {
                    ApplicationArea = Basic;
                }
                field(TaxableAllowance; "Taxable Allowance")
                {
                    ApplicationArea = Basic;
                }
                field(TotalCashAllowance; "Total Allowances")
                {
                    ApplicationArea = Basic;
                    Caption = 'Total Cash Allowance';
                }
                field(TotalDeductions; "Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field(TaxDeductibleAmount; "Tax Deductible Amount")
                {
                    ApplicationArea = Basic;
                }
                field(CummPAYE; "Cumm. PAYE")
                {
                    ApplicationArea = Basic;
                }
                field(CummNetPay; "Cumm. Net Pay")
                {
                    ApplicationArea = Basic;
                }
                field(BenefitsNonCash; "Benefits-Non Cash")
                {
                    ApplicationArea = Basic;
                }
                field(Overtime; Overtime)
                {
                    ApplicationArea = Basic;
                }
                field(NoOfDaysWorked; "days worked")
                {
                    ApplicationArea = Basic;
                    Caption = 'No.Of Days Worked';
                    Editable = true;
                }
                field(OvertimeHoursWeekendHoliday; "No. Of Hours Weekend")
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime Hours (Weekend  Holiday)';
                }
                field(OvertimeHoursNormal; "No. of Hours")
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime Hours (Normal)';
                }
                field(Basic; Basic)
                {
                    ApplicationArea = Basic;
                }
            }
            group(SalaryScale)
            {
                Caption = 'Salary Scale';
                field(GlobalDimension1Code; "Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000097; "Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Present; Present)
                {
                    ApplicationArea = Basic;
                }
                field(Previous; Previous)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Halt; Halt)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Extension)
                {
                    ApplicationArea = Basic;
                }
                field(MobilePhoneNo; "Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Pager; Pager)
                {
                    ApplicationArea = Basic;
                }
                field(EMail; "E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyEMail; "Company E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field(AltAddressCode; "Alt. Address Code")
                {
                    ApplicationArea = Basic;
                }
                field(AltAddressStartDate; "Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(AltAddressEndDate; "Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field(EmploymentDate; "Employment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(DateOfJoin; "Date Of Join")
                {
                    ApplicationArea = Basic;
                }
                field(InactiveDate; "Inactive Date")
                {
                    ApplicationArea = Basic;
                }
                field(CauseofInactivityCode; "Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                }
                field(TerminationDate; "Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field(GroundsforTermCode; "Grounds for Term. Code")
                {
                    ApplicationArea = Basic;
                }
                field(ProRataonJoining; "Pro-Rata on Joining")
                {
                    ApplicationArea = Basic;
                }
                field(ProrataonLeaving; "Pro-rata on Leaving")
                {
                    ApplicationArea = Basic;
                }
                field(EmplymtContractCode; "Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                }
                field(StatisticsGroupCode; "Statistics Group Code")
                {
                    ApplicationArea = Basic;
                }
                field(ResourceNo; "Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(SalespersPurchCode; "Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                }
                field(HalfPay; "Half Pay")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field(BirthDate; "Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field(UnionCode; "Union Code")
                {
                    ApplicationArea = Basic;
                }
                field(UnionMembershipNo; "Union Membership No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Earnings)
            {
                Caption = 'Earnings ';
                action(AssignEarnings)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Earnings';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Payment),
                                  Closed = const(false);
                }
                action(List)
                {
                    ApplicationArea = Basic;
                    Caption = 'List';
                    RunObject = Page Earnings;
                }
                action(DisplayRecurringEarningsList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Recurring Earnings List';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Payment),
                                  Frequency = const(Recurring),
                                  Closed = const(false);
                }
                action(DisplayNonrecurringEarningsList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Non-recurring Earnings List';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Payment),
                                  Frequency = const("Non-recurring"),
                                  Closed = const(false);
                }
            }
            group(Deductions)
            {
                Caption = 'Deductions';
                action(AssignDeductions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Assign Deductions';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Deduction),
                                  Closed = const(false);
                }
                action(DeductionsList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Deductions List';
                    RunObject = Page Deductions;
                }
                action(DisplayRecurringDeductionsList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Recurring  Deductions  List';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Deduction),
                                  Frequency = const(Recurring),
                                  Closed = const(false);
                }
                action(DisplayNonRecurringDeductionList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Display Non-Recurring Deduction List';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Deduction),
                                  Frequency = const("Non-recurring"),
                                  Closed = const(false);
                }
            }
            group(Loans)
            {
                Caption = 'Loans';
                action(DeductionLoan)
                {
                    ApplicationArea = Basic;
                    Caption = 'Deduction Loan';
                    RunObject = Page "Payment & Deductions";
                    RunPageLink = "Employee No" = field("No."),
                                  Type = const(Loan),
                                  Closed = const(false);
                }
                action(EmployeeLoansList)
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Loan(s) List';
                    Visible = false;
                    // RunObject = Page "Loan Application List";
                    // RunPageLink = "Employee No"=field("No.");
                }
            }
            group(Employee)
            {
                Caption = 'E&mployee';
                action(Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                }
                action(Picture)
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                }
                action(AlternativeAddresses)
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                }
                action(Relatives)
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                }
                action(MiscArticleInformation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action(ConfidentialInformation)
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action(Qualifications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                }
                action(Absences)
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                }
                separator(Action1000000082)
                {
                }
                action(AbsencesbyCategories)
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                }
                action(MiscArticlesOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    RunObject = Page "Misc. Articles Overview";
                }
                action(ConfidentialInfoOverview)
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    RunObject = Page "Confidential Info. Overview";
                }
            }
            group(PayManager)
            {
                Caption = 'Pay Manager';
                Visible = true;
                action(PayInformation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Pay Information';
                    RunObject = Page "Employee List";
                    RunPageLink = "No." = field("No.");
                    Visible = false;
                }
                separator(Action1000000111)
                {
                    Caption = '';
                }
                action(AccountMapping)
                {
                    ApplicationArea = Basic;
                    Caption = 'Account Mapping';
                    RunObject = Page "Employee Account Mapping";
                    RunPageLink = "Employee No." = field("No.");
                }
            }
        }
        area(processing)
        {
            action(AssignDefaultDedEarngs)
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Ded/Earngs';

                trigger OnAction()
                begin
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        Earnings.SetRange(Earnings."Basic Salary Code", true);
                        /* IF Earnings.FIND('-') THEN BEGIN
                          REPEAT
                           AssMatrix.INIT;
                           AssMatrix."Employee No":="No.";
                           AssMatrix.Type:=AssMatrix.Type::Payment;
                           AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                           AssMatrix."Department Code":="Global Dimension 1 Code";
                           AssMatrix.Code:=Earnings.Code;
                           AssMatrix.VALIDATE(Code);

                           SalaryPointer.RESET;

                           SalaryPointer.SETRANGE(SalaryPointer."Salary Pointer",Present);
                           IF SalaryPointer.FIND('-') THEN
                           BEGIN
                           AssMatrix.Amount:=SalaryPointer."Basic Pay";
                           AssMatrix.VALIDATE(Amount);
                           //MESSAGE('%1',SalaryPointer."Basic Pay");
                           END
                           ELSE
                           ERROR('Please select the present salary pointer for this employee');

                           AssMatrix.INSERT;
                          UNTIL Earnings.NEXT=0;
                          END;*/



                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        Earnings.SetRange(Earnings."Basic Salary Code", false);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Global Dimension 1 code" := "Global Dimension 1 Code";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;







                        // Deducton
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);

                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := "No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Global Dimension 1 code" := "Global Dimension 1 Code";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Ded.Next = 0;
                        end;

                    end;

                end;
            }
            action(Payslip)
            {
                ApplicationArea = Basic;
                Caption = 'Payslip';

                trigger OnAction()
                begin
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    Employee.SetRange(Employee."No.", "No.");
                    Employee.SetRange(Employee."Pay Period Filter", CurrentMonth);

                    //REPORT.RUN(50053,TRUE,FALSE,Employee);
                    Report.Run(51511156, true, false, Employee);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(AssignDefaultDedEarngs_Promoted; AssignDefaultDedEarngs)
                {
                }
                actionref(Payslip_Promoted; Payslip)
                {
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Pays tax" := true;
    end;

    var
        Mail: Codeunit Mail;
        PayPeriod: Record "Payroll PeriodX1";
        CurrentMonth: Date;
        Employee: Record Employee;
        GetGroup: Codeunit Payroll5;
        GroupCode: Code[20];
        CUser: Code[20];
        Earnings: Record EarningsX1;
        Ded: Record DeductionsX1;
        AssMatrix: Record "Assignment Matrix-X1";
        SalaryPointer: Record "Salary Pointers1";
}

