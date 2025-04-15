Table 52193533 "Employee Payroll"
{
    // //DrillDownPageID = UnknownPage52341;
    // //LookupPageID = UnknownPage52341;

    fields
    {
        field(1; "No."; Code[20])
        {
            ////TableRelation = Table51507369.Field1;

            trigger OnValidate()
            begin
                if Emp.Get("No.") then begin
                    "First Name" := Emp."First Name";
                    "Middle Name" := Emp."Middle Name";
                    "Last Name" := Emp."Last Name";
                    //"Country Code":=Emp."Country Code";
                    /* "Branch  Code":=Emp."Branch Code";*/

                    //Each record should have a costing center
                    /* IF  "Branch  Code" = '' THEN
                      ERROR('Cost Centre Must be specified under the employee data');*/

                    /*   "Project Code":=Emp.Office;
                       "Job Title":=Emp.Position;
                       "Social Security No.":=Emp."NSSF No.";
                       "N.H.I.F No":=Emp."NHIF No.";
                       "P.I.N":=Emp."PIN Number";
                       Status:=Emp.Status;    */

                    //Globals applicable to each employee**
                    "HR Setup".Get;
                    "Tax Relief Amount" := "HR Setup"."Tax Relief Amount";
                    /*"Posting Group":=;*/
                    "Pays tax?" := true;


                    // Global Earnings and Deductions
                    LoadEarnings.Reset;
                    LoadDeductions.Reset;

                    // Get first open pay period
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";

                    //LoadEarnings.SETRANGE(LoadEarnings.Code);
                    LoadEarnings.SetRange(LoadEarnings.IsMandatory, true);
                    if LoadEarnings.Find('-') then begin
                        repeat
                            AssMatrix.Init;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := LoadEarnings.Code;
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix.Validate(Code);
                            AssMatrix.Amount := LoadEarnings."Total Amount";
                            AssMatrix.Validate(Amount);
                            AssMatrix.Insert;

                        until LoadEarnings.Next = 0;
                    end;

                    //LoadDeductions.SETRANGE(LoadDeductions.Code);
                    LoadDeductions.SetRange(LoadDeductions.IsMandatory, true);
                    LoadDeductions.SetRange(LoadDeductions."Pension Scheme", false); //Nothing related to pensions will b entered here
                    if LoadDeductions.Find('-') then begin
                        repeat
                            AssMatrix.Init;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Deduction;
                            AssMatrix.Code := LoadDeductions.Code;
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix.Validate(Code);
                            AssMatrix.Amount := LoadDeductions."Total Amount";
                            AssMatrix.Validate(Amount);
                            AssMatrix.Insert;

                        until LoadDeductions.Next = 0;
                    end;
                    /*
                    {Differentiate between Pension and Provident HERE
                      Put here since one cannot contribute both}
                     LoadDeductions.RESET;
                     LoadDeductions.SETRANGE(LoadDeductions.IsMandatory,TRUE);
                     LoadDeductions.SETRANGE(LoadDeductions."Pension Scheme",TRUE);
                    // LoadDeductions.SETRANGE(LoadDeductions.IsStatutoryDeduction,FALSE);
                     IF LoadDeductions.FIND('-') THEN BEGIN
                       ContractType.RESET;
                       ContractType.SETRANGE(ContractType.Contract,Emp."Contract Type");
                       IF ContractType.FIND('-') THEN BEGIN
                          IF ContractType."Pays Pension"=TRUE THEN BEGIN
                           LoadDeductions.SETRANGE(LoadDeductions.IsProvident,FALSE);
                            IF LoadDeductions.FIND('-') THEN BEGIN
                            REPEAT
                
                            AssMatrix.INIT;
                            AssMatrix."Employee No":="No.";
                            AssMatrix.Type:=AssMatrix.Type::Deduction;
                            AssMatrix.Code:=LoadDeductions.Code;
                            AssMatrix."Payroll Period":=CurrentMonth;
                            AssMatrix.VALIDATE(Code);
                            AssMatrix.Amount:=LoadDeductions."Total Amount";
                            AssMatrix.VALIDATE(Amount);
                            AssMatrix.INSERT;
                            UNTIL LoadDeductions.NEXT=0;
                            END;
                          END ELSE
                          BEGIN
                            //LoadDeductions.SETRANGE(LoadDeductions.IsProvident,TRUE);
                            //IF LoadDeductions.FIND('-') THEN BEGIN
                            REPEAT
                            IF (LoadDeductions.IsProvident=TRUE)OR(LoadDeductions.IsStatutoryDeduction=TRUE)THEN BEGIN
                            AssMatrix.INIT;
                            AssMatrix."Employee No":="No.";
                            AssMatrix.Type:=AssMatrix.Type::Deduction;
                            AssMatrix.Code:=LoadDeductions.Code;
                            AssMatrix."Payroll Period":=CurrentMonth;
                            AssMatrix.VALIDATE(Code);
                            AssMatrix.Amount:=LoadDeductions."Total Amount";
                            AssMatrix.VALIDATE(Amount);
                            AssMatrix.INSERT;
                            END;
                            UNTIL LoadDeductions.NEXT=0;
                           // END;
                
                         END;
                       END;
                     END;
                     */
                end;

            end;
        }
        field(2; "First Name"; Text[30])
        {
        }
        field(3; "Middle Name"; Text[30])
        {
        }
        field(4; "Last Name"; Text[30])
        {
        }
        field(6; "Job Title"; Text[50])
        {
        }
        field(21; "Social Security No."; Text[30])
        {
        }
        field(25; "Country Code"; Code[10])
        {
            TableRelation = "Country/Region";
        }
        field(31; Status; Option)
        {
            OptionMembers = Active,Inactive,Terminated;

            trigger OnValidate()
            begin
                //EmployeeQualification.SETRANGE("Employee No.","No.");
                //EmployeeQualification.MODIFYALL("Employee Status",Status);

                if Status <> Status::Active then begin
                    if not Confirm('Are You sure that you want to change the employee status?') then
                        Error('Employee Details not Changed');

                    if not Confirm('Are You Absolutely sure that you want to change the employee status?') then
                        Error('Employee Details not Changed');

                    GetPayPeriod;
                    AssMatrix.Reset;
                    AssMatrix.SetRange(AssMatrix."Employee No", "No.");
                    //AssMatrix.SETRANGE(AssMatrix."Payroll Period",PayStartDate);
                    AssMatrix.SetRange(AssMatrix.Closed, false);
                    if AssMatrix.Find('-') then begin
                        AssMatrix.DeleteAll;
                    end;
                    "Basic Pay" := 0;
                    Modify;
                end;
            end;
        }
        field(36; "Branch  Code"; Code[20])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));

            trigger OnValidate()
            begin
                /*
                 GetPayPeriod;
                AssMatrix.RESET;
                AssMatrix.SETRANGE(AssMatrix."Employee No","No.");
                AssMatrix.SETRANGE(AssMatrix."Payroll Period",PayStartDate);
                AssMatrix.SETRANGE(AssMatrix.Closed,FALSE);
                IF AssMatrix.FIND('-') THEN BEGIN
                 REPEAT
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.MODIFY;
                 UNTIL AssMatrix.NEXT=0;
                END;
                */

            end;
        }
        field(37; "Project Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(41; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(42; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(43; "Project Filter"; Code[10])
        {
            FieldClass = Normal;
        }
        field(47; "Employee No. Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(50000; "Pays SSF?"; Boolean)
        {
        }
        field(50001; "Pays tax?"; Boolean)
        {
        }
        field(50002; "Section/Location"; Code[10])
        {
            TableRelation = Sections;

            trigger OnValidate()
            begin
                //IF SalaryGrade.GET("Salary Grade") THEN
                //"Basic Pay":=SalaryGrade."Minimum salary";
                //MaximumPay:=SalaryGrade."Maximum Salary";
            end;
        }
        field(50003; "Basic Pay"; Decimal)
        {

            trigger OnValidate()
            begin

                // Get first open pay period
                PayPeriod.Reset;
                PayPeriod.SetRange(PayPeriod.Closed, false);
                if PayPeriod.Find('-') then
                    CurrentMonth := PayPeriod."Starting Date";

                if Employee.Get("No.") then begin
                    AssMatrix.SetRange(AssMatrix."Employee No", "No.");
                    AssMatrix.SetRange(AssMatrix."Payroll Period", CurrentMonth);

                    if AssMatrix.Find('-') then begin

                        repeat
                            if AssMatrix.Type = AssMatrix.Type::Payment then begin

                                Earn.SetRange(Earn.Code, AssMatrix.Code);
                                Earn.SetRange(Earn."Calculation Method", Earn."calculation method"::"% of Basic pay");
                                //Earn.SETRANGE(,Earn."Calculation Method"::"% of Basic pay");

                                if Earn.Find('-') then begin
                                    if Earn."Calculation Method" = Earn."calculation method"::"% of Basic pay" then begin
                                        Amount := Earn.Percentage / 100 * Employee."Basic Pay";
                                        Employee."Basic Pay" := Amount;
                                        Modify;
                                        AssMatrix.Validate(Code);
                                        AssMatrix.Modify;
                                    end;

                                end;
                            end else begin
                                Ded.SetRange(Ded.Code, AssMatrix.Code);
                                Ded.SetRange(Ded."Calculation Method", Ded."calculation method"::"% of Basic Pay");
                                if Ded.Find('-') then begin
                                    if Ded."Calculation Method" = Ded."calculation method"::"% of Basic Pay" then begin
                                        Amount := Ded.Percentage / 100 * Employee."Basic Pay";
                                        Employee."Basic Pay" := Amount;
                                        Modify;
                                        AssMatrix.Validate(Code);
                                        AssMatrix.Modify;
                                    end;

                                end;
                            end;
                            //Cater for AssignBased on Table
                            Ded.SetRange(Ded.Code, AssMatrix.Code);
                            Ded.SetRange(Ded."Calculation Method", Ded."calculation method"::"Based on Table");
                            if Ded.Find('-') then begin
                                if Ded."Calculation Method" = Ded."calculation method"::"Based on Table" then begin
                                    Modify;
                                    AssMatrix.Validate(Code);
                                    AssMatrix.Modify;
                                end;
                            end;
                        //End Cater for AssignBased on Table

                        until AssMatrix.Next = 0;

                    end;
                end;
                /*
                //For NIC Global OVertime Hrly Rate
                
                "HR Setup".GET;
                IF "HR Setup"."Overtime Indicator"<>0 THEN
                "Hourly Rate":=("Basic Pay"/20)/8;
                
                
                //For cases where Where based on a table
                
                
                //End NIC Global OVertime Hrly Rate
                 */

            end;
        }
        field(50004; "Salary Type"; Code[10])
        {
        }
        field(50005; "Paid Overtime?"; Boolean)
        {
        }
        field(50006; "Tax Relief"; Boolean)
        {
        }
        field(50007; "Overtime taxed"; Boolean)
        {
        }
        field(50008; "Agency Car"; Boolean)
        {
        }
        field(50009; "Housed by Employer"; Boolean)
        {
        }
        field(50010; "Employee's Bank"; Code[10])
        {
            TableRelation = "Employee Bank Account";

            trigger OnValidate()
            begin
                EMPBANK.Reset;
                EMPBANK.SetRange(EMPBANK.Code, "Employee's Bank");
                if EMPBANK.Find('-') then begin
                    "Branch Name" := EMPBANK.Name;
                end;
            end;
        }
        field(50011; "Paying Bank Code"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(50012; "Taxable Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                Type = const(Payment),
                                                                "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50013; "Tax Deductible Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Tax Deductible" = const(true),
                                                                "Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50014; "Employee Type"; Code[10])
        {
        }
        field(50015; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Type = const(Payment),
                                                                "Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Type = const(Deduction),
                                                                "Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; Payment; Code[10])
        {
            TableRelation = Earnings;
        }
        field(50018; Deduction; Code[10])
        {
            TableRelation = DeductionsL;
        }
        field(50019; "Posting Group"; Code[10])
        {
            NotBlank = true;
            TableRelation = "Employee Posting Group";
        }
        field(50020; "Total Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                Type = const("Saving Scheme"),
                                                                "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[20])
        {
        }
        field(50022; "Bank Branch"; Code[30])
        {
            TableRelation = "Employee Bank Account";

            trigger OnValidate()
            begin
                EMPBANK.Reset;
                EMPBANK.SetRange(EMPBANK.Code, "Bank Branch");
                if EMPBANK.Find('-') then begin
                    "Bank Name" := EMPBANK.Name;
                end;
            end;
        }
        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Period";
        }
        field(50024; "Opening SSF"; Decimal)
        {
        }
        field(50025; "Opening PAYE"; Decimal)
        {
        }
        field(50026; "Tax Deductible to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Tax Deductible" = const(true),
                                                                "Employee No" = field("No."),
                                                                "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50027; "SSF Employer to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix"."Employer Amount" where("Tax Deductible" = const(true),
                                                                           "Employee No" = field("No."),
                                                                           "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50028; "Opening Employer SSF"; Decimal)
        {
        }
        field(50029; "Cumm. Basic Pay"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1"."Basic Pay" where("Payroll Period" = field("Pay Period Filter"),
                                                                         Employee = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Tax Relief Amount"; Decimal)
        {
        }
        field(50031; "P.I.N"; Code[20])
        {
        }
        field(50032; "Passport No."; Code[20])
        {
        }
        field(50033; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1"."Income Tax" where(Employee = field("No."),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50034; "Cumm. Net Pay"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1"."Net Pay" where(Employee = field("No."),
                                                                       "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
        }
        field(50038; "Hourly Rate"; Decimal)
        {
        }
        field(50039; "Daily Rate"; Decimal)
        {
        }
        field(50040; "Pays N.H.I.F"; Boolean)
        {
        }
        field(50041; "Last Modified By"; Code[20])
        {
            Editable = false;
        }
        field(50042; "Gross Cash"; Decimal)
        {
        }
        field(50043; "Debtor Code"; Code[10])
        {
            TableRelation = Customer;
        }
        field(50045; "Benefits-Non Cash"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Non-Cash Benefit" = const(true),
                                                                Type = const(Payment),
                                                                Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50046; "Pay Mode"; Option)
        {
            OptionMembers = Bank,Cash,Cheque,"Bank Transfer";
        }
        field(50047; Housing; Option)
        {
            OptionMembers = Agricultural,Directors,Ordinary;
        }
        field(50048; "Home Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                Type = const(Deduction),
                                                                "Tax Deductible" = const(true),
                                                                Retirement = const(false)));
            FieldClass = FlowField;
        }
        field(50049; "Retirement Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Tax Deductible" = const(true),
                                                                Retirement = const(true)));
            FieldClass = FlowField;
        }
        field(50050; "Home Ownership Status"; Option)
        {
            OptionMembers = "None","Owner Occupier","Home Savings";
        }
        field(50052; "National ID"; Code[20])
        {
        }
        field(50053; "House Rent"; Decimal)
        {
        }
        field(50054; "Employer Rent"; Boolean)
        {
        }
        field(50055; "Total Quarters"; Decimal)
        {
        }
        field(50056; "Cumulative Quarters"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1".Quarters where(Employee = field("No."),
                                                                      "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50057; BfMpr; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1".BfMpr where(Employee = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50058; PensionNo; Code[10])
        {
        }
        field(50059; "Salary Scheme Category"; Code[20])
        {
            TableRelation = Category;
        }
        field(50060; "Salary Steps"; Code[20])
        {
            TableRelation = "Salary Steps"."Step Code" where("Category code" = field("Salary Scheme Category"),
                                                              Level = field(Level));

            trigger OnValidate()
            begin
                if Employee.Get("No.") then
                    if Status = Employee.Status::Active then begin
                        // populate the basic salary based on the steps
                        if SalaryStep.Get("Salary Steps", SalaryStep.Level::"Level 1", "Salary Scheme Category") then begin
                            "Basic Pay" := SalaryStep."Basic amount";
                            "Gross pay" := SalaryStep."Gross pay";
                        end;
                        // Get first open pay period
                        PayPeriod.Reset;
                        PayPeriod.SetRange(PayPeriod.Closed, false);
                        if PayPeriod.Find('-') then
                            CurrentMonth := PayPeriod."Starting Date";
                        //House all
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."House All. Code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."House allowance";
                            AssMatrix.Modify;
                        end;
                        //std allowance
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Standard Overtime code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Standard overtime";
                            AssMatrix.Modify;
                        end;
                        //duty allowance
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Duty Allowance code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Duty allowance";
                            AssMatrix.Modify;
                        end;
                        //personal allow
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Personal Allowance code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Personal allowance";
                            AssMatrix.Modify;
                        end;
                        // performance
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Performance Allowance code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Perfomance allowance";
                            AssMatrix.Modify;
                        end;
                        //Standard Allowance
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Std Allowance code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Std Allowance";
                            AssMatrix.Modify;
                        end;
                        // Dog handler
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Dog handlers allowance code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Dog handlers allowance";
                            AssMatrix.Modify;
                        end;

                        // Public holiday
                        if AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Public holiday allowance code", CurrentMonth, "Branch  Code") then begin
                            AssMatrix.Amount := SalaryStep."Public holiday allowance";
                            AssMatrix.Modify;
                        end;

                        // Insert

                        //House all
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."House All. Code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."House All. Code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."House All. Code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix."Branch Code" := "Branch  Code";
                            AssMatrix.Amount := SalaryStep."House allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;
                        //std allowance
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Standard Overtime code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Standard Overtime code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Standard Overtime code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix."Branch Code" := "Branch  Code";
                            AssMatrix.Amount := SalaryStep."Standard overtime";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;
                        //duty allowance
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Duty Allowance code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Duty Allowance code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Duty Allowance code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix."Branch Code" := "Branch  Code";
                            AssMatrix.Amount := SalaryStep."Duty allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;
                        //personal allow
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Personal Allowance code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Personal Allowance code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Personal Allowance code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix."Branch Code" := "Branch  Code";
                            AssMatrix.Amount := SalaryStep."Personal allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;
                        //Standard allowance
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Std Allowance code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Std Allowance code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Personal Allowance code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix."Branch Code" := "Branch  Code";
                            AssMatrix.Amount := SalaryStep."Std Allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;
                        // Dog handler
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Dog handlers allowance code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Dog handlers allowance code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Dog handlers allowance code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix."Branch Code" := "Branch  Code";
                            AssMatrix.Amount := SalaryStep."Dog handlers allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;

                        // performance
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Performance Allowance code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Performance Allowance code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Performance Allowance code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix.Amount := SalaryStep."Perfomance allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;
                        end;

                        // Public holiday allowance
                        if not AssMatrix.Get("No.", AssMatrix.Type::Payment, SalaryStep."Public holiday allowance code", CurrentMonth, "Branch  Code") then begin
                            //find earnings
                            if Earn.Get(SalaryStep."Public holiday allowance code") then begin
                                AssMatrix.Code := Earn.Code;
                                AssMatrix.Description := Earn.Description;
                                AssMatrix.Taxable := Earn.Taxable;
                                if Earn."Pay Type" = Earn."pay type"::Recurring then
                                    AssMatrix."Next Period Entry" := true
                                else
                                    AssMatrix."Next Period Entry" := false;
                            end;
                            AssMatrix."Employee No" := "No.";
                            AssMatrix.Type := AssMatrix.Type::Payment;
                            AssMatrix.Code := SalaryStep."Public holiday allowance code";
                            AssMatrix."Payroll Period" := CurrentMonth;
                            AssMatrix.Amount := SalaryStep."Public holiday allowance";
                            if AssMatrix.Amount <> 0 then
                                AssMatrix.Insert;


                        end;
                    end else
                        Error('Employee not active');
            end;
        }
        field(50061; Level; Option)
        {
            OptionMembers = "Level 1","Level 2";
        }
        field(50065; "Share Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                Shares = const(true)));
            Caption = 'coop skg fund';
            FieldClass = FlowField;
        }
        field(50066; "House allowance"; Decimal)
        {
        }
        field(50067; Overtime; Decimal)
        {
        }
        field(50068; Absence; Decimal)
        {
        }
        field(50069; "Other allowances"; Decimal)
        {
        }
        field(50070; "Total earnings"; Decimal)
        {
        }
        field(50071; PAYE; Decimal)
        {
        }
        field(50072; NHIF; Decimal)
        {
        }
        field(50073; NSSF; Decimal)
        {
        }
        field(50074; Advance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Type = const(Deduction),
                                                                "Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                Code = field("Advance Code Filter")));
            FieldClass = FlowField;
        }
        field(50075; Loans; Decimal)
        {
        }
        field(50076; COOP; Decimal)
        {
        }
        field(50077; "Other deductions"; Decimal)
        {
        }
        field(50079; "Net pay"; Decimal)
        {
        }
        field(50080; "Advance Code Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsL.Code;
        }
        field(50081; "Gross pay"; Decimal)
        {
        }
        field(50082; interest; Decimal)
        {
            CalcFormula = sum("Assignment Matrix"."Interest Amount" where("Employee No" = field("No."),
                                                                           "Payroll Period" = field("Pay Period Filter"),
                                                                           Type = filter(Deduction)));
            FieldClass = FlowField;
        }
        field(50083; "Account Group"; Code[20])
        {
        }
        field(50084; "Payslip Message"; Text[100])
        {
        }
        field(50085; "Actual Basic Salary"; Decimal)
        {
        }
        field(50086; "Days Worked"; Integer)
        {

            trigger OnValidate()
            begin
                if "Days Worked" <> 0 then begin
                    if "Actual Basic Salary" <> 0 then begin
                        BasicPay := ("Actual Basic Salary" / 30) * "Days Worked";
                        "Basic Pay" := BasicPay;
                        Modify;
                        Validate("Basic Pay")
                    end;
                end;
            end;
        }
        field(50087; "Owner Occupier"; Decimal)
        {
            CalcFormula = sum("Employee Ledger Entry1"."Owner Occupier" where(Employee = field("No."),
                                                                              "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50088; "Low Interest Benefits"; Decimal)
        {
        }
        field(50089; "Terminal Dues Code"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Earnings.Code;
        }
        field(50090; Pensionable; Boolean)
        {
        }
        field(50091; "Account Type"; Code[20])
        {
        }
        field(50092; InsuranceAmt; Decimal)
        {
        }
        field(50093; PensionAmt; Decimal)
        {
        }
        field(50094; CummulativeEmpPension; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                "Tax Deductible" = const(true),
                                                                Retirement = const(true),
                                                                Statutory = const(false)));
            FieldClass = FlowField;
        }
        field(50095; CummStimaInv; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                "Payroll Period" = field("Pay Period Filter"),
                                                                StimaInvest = const(true)));
            FieldClass = FlowField;
        }
        field(50096; "BOSA No"; Code[20])
        {
            // TableRelation = Customer."No." where("Customer Type" = const(Member));
        }
        field(50097; Gratuity; Decimal)
        {
        }
        field(50098; "In-Patient Amount"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50099; "Out-Patient Amount"; Decimal)
        {
            FieldClass = Normal;
        }
        field(50100; Gender; Option)
        {
            OptionMembers = Male,Female;
        }
        field(50101; "N.S.S.F"; Code[20])
        {
        }
        field(50102; "Date Of Birth"; Date)
        {
        }
        field(50103; "Emp Date"; Date)
        {
        }
        field(50104; "Home Address"; Text[30])
        {
        }
        field(50105; "Marital Status"; Option)
        {
            OptionMembers = Single,Married;
        }
        field(50106; "Phone No"; Text[30])
        {
        }
        field(50107; JuJu; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where("Employee No" = field("No."),
                                                                Type = const(Payment)));
            FieldClass = FlowField;
        }
        field(50108; "Department Code"; Code[10])
        {
        }
        field(50109; "Tax Releaf Deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix".Amount where(Taxable = const(true),
                                                                "Employee No" = field("No."),
                                                                Type = filter(Deduction)));
            FieldClass = FlowField;
        }
        field(50110; "Bank Name"; Text[60])
        {
        }
        field(50111; "Branch Name"; Text[60])
        {
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Pay Mode")
        {
        }
        key(Key3; "Branch  Code")
        {
        }
        key(Key4; "Posting Group")
        {
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
        SalaryStep: Record "Salary Steps";
        PayPeriod: Record "Payroll Period";
        CurrentMonth: Date;
        AssMatrix: Record "Assignment Matrix";
        Earn: Record Earnings;
        Netpay: Decimal;
        EmployeeLegderEntry: RecordID;
        Employee: Record "Employee Payroll";
        "HR Setup": Record "Human Resources Setup";
        LoadEarnings: Record Earnings;
        LoadDeductions: Record DeductionsL;
        BasicPay: Decimal;
        ActualBasicPay: Decimal;
        Ded: Record DeductionsL;
        Amount: Decimal;
        PayStartDate: Date;
        PayPeriodText: Text[30];
        EMPBANK: Record "Employee Bank Account";


    procedure GetPayPeriod()
    begin
        PayPeriod.SetRange(PayPeriod."Close Pay", false);
        if PayPeriod.Find('-') then
            PayStartDate := PayPeriod."Starting Date";
        PayPeriodText := PayPeriod.Name;
    end;
}

