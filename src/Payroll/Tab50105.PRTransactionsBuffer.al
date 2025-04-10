table 52193427 "PR Transactions Buffer"
{
    Caption = 'PR Transactions Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            TableRelation = "Employee"."No.";
        }
        field(2; "Transaction Code"; Code[30])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code" where("Transaction Code" = filter(<> ''));

            trigger OnValidate()
            var
                strExtractedFrml: text[100];
                PRPayroll: codeunit "PR Payroll Processing";
                LeaveLedger: record "HR Leave Ledger Entries";
                LeaveCalendar: Record "Base Calendar";
                hrSetup: Record "Human Resources Setup";
                lDays: integer;
                Emp: Record Employee;
                YearsWorked: Integer;
                HREmp: Record Employee;

                PRSalCard: record "PR Salary Card";
                StartMonth, EndMonth, StartYear, EndYear, TotalMonthsWorked : Integer;
                Text001: Label 'Transaction Code [ %1 ] has already been assigned to "No." [ %2 ] Payroll Period [ %3 ]. Do you want to overwrite it?';
            begin

                // if "Transaction Code" <> '' then begin
                //     EmployeeTrans.Reset;
                //     EmployeeTrans.SetRange(EmployeeTrans."Transaction Code", "Transaction Code");
                //     EmployeeTrans.SetRange(EmployeeTrans."Employee Code", "Employee Code");
                //     EmployeeTrans.SetRange(EmployeeTrans."Payroll Period", "Payroll Period");
                //     EmployeeTrans.SetRange(EmployeeTrans."Reference No", "Reference No");
                //     if EmployeeTrans.FindFirst() then
                //         if not Confirm(StrSubstNo(Text001, "Transaction Code", "Employee Code", "Payroll Period")) then
                //             exit;

                // end;

                Transcode.Reset;
                Transcode.SetRange(Transcode."Transaction Code", "Transaction Code");
                if Transcode.FindFirst() then begin
                    PRSalCard.get("Employee Code");
                    if Transcode."Calculation Method" = Transcode."Calculation Method"::"Basic Pay" then begin
                        Amount := PRSalCard."Basic Pay" * Transcode."Formula %" / 100;
                        if HREmp.Get("Employee Code") then
                            if HREmp."Employee Status 2" = HREmp."Employee Status 2"::Interdiction then
                                Amount := PRSalCard."Basic Pay" / 2 * Transcode."Formula %" / 100;
                    end else
                        if Transcode."Is Formula" = true then begin
                            strExtractedFrml := PRPayroll.fnPureFormula("Employee Code", "Period Month", "Period Year", Transcode.Formula);
                            Amount := PRPayroll.fnFormulaResult(strExtractedFrml); //Get the calculated amount
                        end;
                    "Transaction Name" := Transcode."Transaction Name";
                    if Transcode.Frequency = Transcode.Frequency::Varied then
                        "Stop for Next Period" := true;
                    if Transcode."Special Trans Incomes" = Transcode."special trans incomes"::"Leave Allowance" then
                        if Amount > 50000 then Amount := 50000;

                    "Transaction Type2" := Transcode."Transaction Type";
                    if Transcode."Transaction Category" = Transcode."Transaction Category"::Gratuity then begin
                        Emp.Get("Employee Code");
                        Emp.TestField("Employment Date");
                        Emp.TestField("Termination Date");
                        StartMonth := Date2DMY(Emp."Employment Date", 2);
                        StartYear := Date2DMY(Emp."Employment Date", 3);
                        EndMonth := Date2DMY(Emp."Termination Date", 2);
                        EndYear := Date2DMY(Emp."Termination Date", 3);
                        YearsWorked := EndYear - StartYear + 1;
                        TotalMonthsWorked := YearsWorked * 12 - (StartMonth + 1) - (12 - EndMonth);
                        Amount := PRSalCard."Basic Pay" * TotalMonthsWorked * Transcode."Formula %" / 100;
                    end;
                    "Not Included Third" := Transcode."Not Included Third";
                    "Basic Salary Arrears" := Transcode."Basic Salary Arrears";
                end;


                if Transcode."Is Leave Allowance" = true then begin
                    LeaveCalendar.reset;
                    // LeaveCalendar.setrange(Current, true);
                    if hrSetup.Get() then
                        if LeaveCalendar.find('-') then begin
                            LeaveLedger.reset;
                            LeaveLedger.SetRange(LeaveLedger."Staff No.", "Employee Code");
                            LeaveLedger.SetRange("Leave Entry Type", LeaveLedger."Leave Entry Type"::"Negative");
                            LeaveLedger.SetRange("Leave Period", hrSetup."Base Calendar");
                            if LeaveLedger.find('-') then begin
                                repeat
                                    lDays := lDays + LeaveLedger."No. of days1";
                                until LeaveLedger.next = 0;
                            end;
                            "Taken Leave Days" := LDays;
                        end;
                end;
                if Emp.Get("Employee Code") then begin
                    "Last Promotion Date" := Emp."End Of Probation Date";
                    "Salary Scale" := Emp."Salary Scale";
                    "Current Duty Station" := Emp."Current Duty Station";
                    "Directorate Code" := Emp."Directorate Code";
                    "Job Title2" := Emp."Job Title2";
                    // Assigns the "Organisation Unit Name" from the Employee record to the "Organisation Unit Name" field in the PRTransactionsBuffer table.
                    "Organisation Unit Name" := Emp."Organisation Unit Name";
                    "Employee Category Type" := Emp."Employee Category Type";
                end


            end;
        }
        field(3; "Transaction Name"; Text[100])
        {
            editable = false;
        }
        field(4; Amount; Decimal)
        {
            trigger OnValidate()
            var
                Payroll: Codeunit "PR Payroll Processing";
                prSetup: Record "PR Vital Setup Info";
            begin
                // validate("Amount Borrowed");




                if "Original Amount" > 0 then
                    "#of Repayments" := "Amount Borrowed" / Amount;

                if Transcode.get("Transaction Code") then begin
                    if Transcode."Is Leave Allowance" = true then
                        if "Taken Leave Days" < 15 then
                            error('Please note that the minimum leave days for leave allowance is 15 days');
                    if prSetup.Get() then
                        if not prSetup."Exclude A Third" then begin
                            if Transcode."Transaction Type" = Transcode."Transaction Type"::Deduction then
                                if Payroll.ExceedsThirdRule("Employee Code", Amount) then
                                    Error('The amount ' + Format(Amount) + ' Exceeds the a third rule by ( kshs. ' + Format(Payroll.AmountExceedsThirdRule("Employee Code", Amount)) + '!');
                        end;
                end
            end;


        }
        field(5; Balance; Decimal)
        {

            trigger OnValidate()
            begin
                "#of Repayments" := 0;
                //IF (Balance > 0) AND ("#of Repayments" > 0) THEN
                //Amount:=Balance/"#of Repayments"
            end;
        }
        field(6; "Original Amount"; Decimal)
        {
        }
        field(7; "Period Month"; Integer)
        {
        }
        field(8; "Period Year"; Integer)
        {
        }
        field(9; "Payroll Period"; Date)
        {
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(10; "#of Repayments"; Integer)
        {

            trigger OnValidate()
            begin
                if (Balance > 0) and ("#of Repayments" > 0) then
                    Amount := Balance / "#of Repayments"
            end;
        }

        field(12; "Reference No"; Text[100])
        {
        }
        field(13; integera; Integer)
        {
        }
        field(14; "Employer Amount"; Decimal)
        {
        }
        field(15; "Employer Balance"; Decimal)
        {
        }
        field(16; "Stop for Next Period"; Boolean)
        {
        }
        field(17; "Amortized Loan Total Repay Amt"; Decimal)
        {
        }
        field(18; "Start Date"; Date)
        {
        }
        field(19; "End Date"; Date)
        {
        }
        field(20; "Loan Number"; Code[10])
        {
        }

        field(22; "No of Units"; Decimal)
        {
        }
        field(23; Suspended; Boolean)
        {
        }
        field(24; "Entry No"; Integer)
        {
            AutoIncrement = false;
        }
        field(38; "IsCoop/LnRep"; Boolean)
        {
            CalcFormula = lookup("PR Transaction Codes"."IsCoop/LnRep" where("Transaction Code" = field("Transaction Code")));
            Description = 'to be able to report the different coop contributions -Dennis';
            FieldClass = FlowField;
        }
        field(41; Stopped; Boolean)
        {
        }
        field(42; "Subledger Account"; Code[10])
        {
            TableRelation = if ("Subledger Account" = const('VENDOR')) Vendor."No." where(Blocked = filter(<> All),
                                                                                         "Vendor Posting Group" = const('OTHERS'))
            else
            if ("Subledger Account" = const('CUSTOMER')) Customer."No." where(Blocked = filter(<> All));
        }
        field(43; Subledger; Option)
        {
            OptionCaption = ' ,Customer,Vendor';
            OptionMembers = " ",Customer,Vendor;
        }
        field(44; "Sacco loan"; Boolean)
        {
        }
        field(45; "Sacco share"; Boolean)
        {
        }
        field(47; "Loan Interest Rate"; Decimal)
        {
        }
        field(48; "Exempt from Interest"; Boolean)
        {

            trigger OnValidate()
            begin
                /*
                if not "Exempt from Interest" then
                begin
                    if Confirm('Disable Staff No [ %1 ] from paying Interest on this Transaction Code [ %2 - %3? ]',false
                                  ,"Employee Code","Transaction Code","Transaction Name") = true then
                    begin
                        "Exempt from Interest":=true;
                    end else
                    begin
                        error('Aborted');
                    end;
                end else
                begin
                    if Confirm('Enalbe Staff No [ %1 ] to pay Interest on this Transaction Code [ %2 - %3? ]',false
                                  ,"Employee Code","Transaction Code","Transaction Name") = true then
                    begin
                        "Exempt from Interest":=true;
                    end else
                    begin
                        error('Aborted');
                    end;
                
                end;
                 */

            end;
        }
        field(52; "Transaction Type"; Option)
        {
            CalcFormula = lookup("PR Transaction Codes"."Transaction Type" where("Transaction Code" = field("Transaction Code")));
            Description = 'Income,Deduction';
            FieldClass = FlowField;
            OptionMembers = Income,Deduction,Benefit;
        }
        field(53; "coop parameters"; Option)
        {
            Caption = 'Other Categorization';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
            FieldClass = FlowField;
            CalcFormula = lookup("PR Transaction Codes"."coop parameters" where("Transaction Code" = field("Transaction Code")));
        }

        field(54; "Has Insurance Certificate"; enum "Has Insurance Certificate")
        {
            //OptionMembers = " ","No","Yes";
            trigger OnValidate()
            var
                PRTransCode: Record "PR Transaction Codes";
            begin
                PRTransCode.Reset();
                PRTransCode.SetRange("Transaction Code", "Transaction Code");
                if PRTransCode.FindFirst() then begin
                    PRTransCode.TestField("Special Trans Deductions", PRTransCode."Special Trans Deductions"::"Life Insurance");
                end;
            end;
        }

        field(55; "Amount Borrowed"; Decimal)
        {
            BlankZero = true;
            caption = 'Initial Loan Amount';

            trigger OnValidate()
            var
                NewSchedule: Record "Loan Repayment Schedule1";
                RemainingPrincipalAmountDec: Decimal;
                RunningDate: Date;
                RepaymentAmt: Decimal;
                LoopEndBool: Boolean;
                InterestAmountDec: Decimal;
                LoanTypeRec: Record "PR Transaction Codes";
                RoundPrecisionDec: Decimal;
                RoundDirectionCode: Code[20];
                LineNoInt: Integer;

            begin
                if LoanTypeRec.get("Transaction Code") then begin
                    if LoanTypeRec."coop parameters" <> LoanTypeRec."coop parameters"::none then begin
                        NewSchedule.Reset();
                        NewSchedule.SetRange("Loan No.", "Transaction Code");
                        NewSchedule.SetRange("Employee No.", "Employee Code");
                        NewSchedule.DeleteAll();


                        Balance := "Amount Borrowed";
                        if ("Total Installments" > 0) and ("Total Installments" > 0) and (Amount = 0) then
                            Amount := "Amount Borrowed" / "Total Installments";

                        RemainingPrincipalAmountDec := 0;
                        LoopEndBool := false;
                        LineNoInt := 0;

                        if "Total Installments" <= 0 then ERROR('Instalment Amount must be specified');

                        TestField("Amount Borrowed");

                        RemainingPrincipalAmountDec := "Amount Borrowed";
                        RunningDate := "Loan Application Date";
                        RepaymentAmt := Amount;


                        RoundPrecisionDec := 1;
                        RoundDirectionCode := '=';

                        LoanTypeRec.Reset();
                        LoanTypeRec.SetRange("Transaction Code", "Transaction Code");
                        if LoanTypeRec.FindFirst() then begin
                            //LoanTypeRec.TestField("Interest Rate");
                        end;

                        repeat
                            if LoanTypeRec."Interest Rate" > 0 then
                                InterestAmountDec := ROUND(RemainingPrincipalAmountDec * (LoanTypeRec."Interest Rate" / 100) / 12, RoundPrecisionDec);    //
                                                                                                                                                          // MESSAGE('%1 %2 %3',RepaymentAmt,RemainingPrincipalAmountDec,RunningDate);
                                                                                                                                                          // IF InterestAmountDec >=RepaymentAmt  THEN
                                                                                                                                                          //   ERROR('This Loan is not possible because\the the instalment Amount must\be higher than %1',InterestAmountDec);
                                                                                                                                                          //
                            LineNoInt := LineNoInt + 1;
                            NewSchedule."Instalment No" := LineNoInt;
                            NewSchedule."Employee No." := "Employee Code";
                            NewSchedule."Loan No." := "Transaction Code";
                            NewSchedule."Repayment Date" := RunningDate;
                            NewSchedule."Monthly Interest" := InterestAmountDec;
                            if LoanTypeRec."Interest Rate" > 0 then
                                NewSchedule."Interest Rate" := (LoanTypeRec."Interest Rate" / 100) / 12;
                            //NewSchedule."Monthly Repayment" := RepaymentAmt + InterestAmountDec;

                            NewSchedule."Monthly Repayment" := Amount;
                            //NewSchedule."Loan Category" := "Loan Product Type";
                            NewSchedule."Loan Amount" := RemainingPrincipalAmountDec;
                            if Amount <> 0 then
                                NewSchedule."Principal Repayment" := Amount
                            else
                                NewSchedule."Principal Repayment" := RepaymentAmt;//NewSchedule."Monthly Repayment"-NewSchedule."Monthly Interest";

                            NewSchedule."Monthly Repayment" := NewSchedule."Principal Repayment" + InterestAmountDec;
                            // Area to be looked at
                            if LineNoInt = "Total Installments" then begin
                                NewSchedule."Balance C/F" := 0;
                                NewSchedule."Monthly Repayment" := RemainingPrincipalAmountDec + NewSchedule."Monthly Interest";

                                LoopEndBool := true;
                            end;

                            if RepaymentAmt >= RemainingPrincipalAmountDec then begin  // - InterestAmountDec)
                                NewSchedule."Principal Repayment" := RemainingPrincipalAmountDec;
                                NewSchedule."Balance C/F" := 0;
                                LoopEndBool := true;
                            end else begin
                                NewSchedule."Principal Repayment" := RepaymentAmt;// - InterestAmountDec
                                RemainingPrincipalAmountDec := RemainingPrincipalAmountDec - RepaymentAmt;// - InterestAmountDec)
                                NewSchedule."Balance C/F" := RemainingPrincipalAmountDec;
                            end;
                            NewSchedule."Balance C/F" := NewSchedule."Balance C/F" + RepaymentAmt;
                            NewSchedule.INSERT;
                            RunningDate := CALCDATE('1M', RunningDate);

                        until LoopEndBool;
                    end;
                end;
            end;
        }
        field(56; "Loan Application Date"; Date)
        {
            trigger OnValidate()
            begin
                if "Amount Borrowed" <> 0 then Validate("Amount Borrowed");
            end;
        }

        field(57; "Total Installments"; Integer)
        {
            BlankZero = true;

            trigger OnValidate()
            begin
                if "Amount Borrowed" <> 0 then begin
                    Validate("Amount Borrowed");
                    if "Total Installments" > 0 then
                        Amount := "Amount Borrowed" / "Total Installments";
                end;

            end;
        }
        field(58; "Leave Application No"; code[20])
        {
            TableRelation = "HR Leave Application"."Application Code" where("Employee No" = field("Employee Code"), Status = filter(Released));
            trigger OnValidate()
            var
                LeaveApp: record "HR Leave Application";
            begin
                if LeaveApp.get("Leave Application No") then
                    "Taken Leave Days" := LeaveApp."Days Applied";
            end;
        }
        field(59; "Taken Leave Days"; Integer)
        {
        }
        field(60; "Absent Days"; Integer)
        {
            trigger OnValidate()
            var
                EmpSal: record "PR Salary Card";
            begin
                if EmpSal.get("Employee Code") then begin
                    if "Absent Days" > 0 then begin
                        Amount := ("Absent Days" / 30) * EmpSal."Basic Pay";
                    end;
                end;
            end;
        }
        field(62; "Transaction Type2"; Option)
        {
            Description = 'Income,Deduction';
            OptionMembers = Income,Deduction,Benefit;
        }
        field(63; "Not Included Third"; Boolean)
        {
            Caption = 'Not included in a Third Rule';
        }
        field(64; "Basic Salary Arrears"; Boolean)
        {

        }
        field(50118; "Last Promotion Date"; Date)
        {
        }
        field(50165; "Salary Scale"; Code[30])
        {
        }
        field(69601; "Current Duty Station"; Code[30])
        {
        }
        field(70018; "Directorate Code"; Code[50])
        {
            Caption = 'Implementing Unit';
        }
        field(70064; "Job Title2"; Text[250])
        {
            Caption = 'Designation';
        }

        field(70091; "Organisation Unit Name"; Text[100])
        {
        }
        field(70092; "Implementing Unit Name"; Text[100])
        {
        }
        field(70093; "Employee Category Type"; Option)
        {
            OptionCaption = '"...",Attachee,Casual,Intern,Judge,Judicial Officer,Judicial Staff,Pupillage,Temporary';
            OptionMembers = "...",Attachee,Casual,"Intern","Judge","Judicial Officer","Judicial Staff","Pupillage","Temporary";
        }
        field(70094; "Document No"; Code[50])
        {

        }

    }

    keys
    {
        key(Key1; "Document No", "Employee Code", "Transaction Code", "Payroll Period", "Reference No")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
        key(Key2; "Document No", "Employee Code", "Transaction Code", "Period Month", "Period Year", Suspended)
        {
        }

    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin

    end;

    trigger OnInsert()
    var
    begin

    end;

    trigger OnModify()
    begin

    end;

    var
        Transcode: Record "PR Transaction Codes";
        EmployeeTrans: Record "PR Employee Transactions";
        MonthName: Text[100];
        SalCard: Record "PR Salary Card";
        CurrentYr: Integer;
        objPeriod: Record "PR Payroll Periods";
}

