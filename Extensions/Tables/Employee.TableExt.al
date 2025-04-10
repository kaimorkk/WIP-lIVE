TableExtension 52193668 tableextension52193668 extends Employee
{
    fields
    {



        modify(Title)
        {

            TableRelation = Titles;
        }

        modify("Phone No.")
        {
            trigger OnAfterValidate()
            begin
                if DuplicatePhoneExists > 1 then
                    Error('The Telephone Number Exists');
            end;
        }
        modify("Bank Account No.")
        {
            trigger OnAfterValidate()
            begin
                if DuplicateAccountExists > 1 then
                    Error('The Bank Account Number Exists');
            end;
        }

        modify(Status)
        {
            trigger OnAfterValidate()
            var
                Emp: Record Employee;
                Contract: Record "Employment Contract";
                SalCard: Record "PR Salary Card";
            begin
                if Status = Status::Inactive then begin
                    TestField("Termination Date");
                    Rec.TestField("Emplymt. Contract Code");
                    if Contract.Get("Emplymt. Contract Code") then
                        if Contract."Has Gratuity" then
                            "Exit Status" := "Exit Status"::"Pending Gratuity"
                        else
                            "Exit Status" := "Exit Status"::Exited;
                    Validate("Exit Status");
                    // if SalCard.Get("No.") then SalCard.Delete();
                end;
            end;

        }

        modify("Emplymt. Contract Code")
        {
            trigger OnAfterValidate()
            var
                Emp: Record Employee;
                Contract: Record "Employment Contract";
                SalCard: Record "PR Salary Card";
                EmpTrans: Record "PR Employee Transactions";
                PRsetup: Record "PR Vital Setup Info";
            begin
                PayPeriod.Reset;
                PayPeriod.SetRange(PayPeriod.Closed, false);
                if PayPeriod.Find('-') then
                    Begindate := PayPeriod."Date Opened";
                if Contract.Get("Emplymt. Contract Code") then
                    if PRsetup.Get() then PRsetup.TestField("PrPension Employee Code");
                if Contract."Has Pension" then begin
                    PRsetup.TestField("Post-Retirement Medical");
                    EmpTrans.Init();
                    EmpTrans."Employee Code" := "No.";
                    EmpTrans."Transaction Code" := PRsetup."PrPension Employee Code";
                    EmpTrans.Validate("Transaction Code");
                    //EmpTrans.Amount := 40 / 100 * SalaryCard."Basic Pay";                    
                    EmpTrans."Payroll Period" := PayPeriod."Date Opened";
                    EmpTrans."Period Month" := PayPeriod."Period Month";
                    EmpTrans."Period Year" := PayPeriod."Period Year";
                    if not EmpTrans.Insert(true) then
                        EmpTrans.Modify();

                    EmpTrans.Init();
                    EmpTrans."Employee Code" := "No.";
                    EmpTrans."Transaction Code" := PRsetup."Post-Retirement Medical";
                    EmpTrans.Validate("Transaction Code");
                    //EmpTrans.Amount := 40 / 100 * SalaryCard."Basic Pay";                    
                    EmpTrans."Payroll Period" := PayPeriod."Date Opened";
                    EmpTrans."Period Month" := PayPeriod."Period Month";
                    EmpTrans."Period Year" := PayPeriod."Period Year";
                    if not EmpTrans.Insert(true) then
                        EmpTrans.Modify();

                end else begin
                    EmpTrans.Reset();
                    EmpTrans.SetRange(EmpTrans."Employee Code", "No.");
                    EmpTrans.SetRange(EmpTrans."Payroll Period", Begindate);
                    EmpTrans.SetRange(EmpTrans."Transaction Code", PRsetup."PrPension Employee Code");
                    if EmpTrans.Find('-') then
                        EmpTrans.Delete();
                    EmpTrans.Reset();
                    EmpTrans.SetRange(EmpTrans."Employee Code", "No.");
                    EmpTrans.SetRange(EmpTrans."Payroll Period", Begindate);
                    EmpTrans.SetRange(EmpTrans."Transaction Code", PRsetup."Post-Retirement Medical");
                    if EmpTrans.Find('-') then
                        EmpTrans.Delete();

                end;



            end;
        }
        modify("Employment Date")
        {
            trigger OnAfterValidate()
            begin
                "Date Of Join" := Rec."Employment Date";

            end;
        }


        field(50000; "Pays SSF"; Boolean)
        {
        }
        field(50001; "Pays tax"; Boolean)
        {
        }
        field(50002; "Section/Location"; Code[10])
        {

            trigger OnValidate()
            begin
                //IF SalaryGrade.GET("Salary Grade") THEN
                //"Basic Pay":=SalaryGrade."Minimum salary";
                //MaximumPay:=SalaryGrade."Maximum Salary";
            end;
        }
        field(50003; "Basic Pay"; Decimal)
        {
        }
        field(50004; "Salary Type"; Code[10])
        {
        }
        field(50005; "Paid Overtime"; Boolean)
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
        field(50010; "Employee's Bank"; Code[100])
        {
            NotBlank = true;
            TableRelation = "Employee Bank AccountX1";
        }
        field(50011; "Paying Bank Code"; Code[10])
        {
            TableRelation = "Bank Account";
        }
        field(50012; "Taxable Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Taxable = const(true),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50013; "Tax Deductible Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Tax Deductible" = const(true),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        // field(50014; "Employee Type"; Code[10])
        // {
        // }
        field(50015; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = const(Payment),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Non-Cash Benefit" = const(false),
                                                                   "Normal Earnings" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = filter(Deduction | Loan),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   Information = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; Payment; Code[10])
        {
            TableRelation = "Bracket Tablesx1";
        }
        field(50018; Deduction; Code[10])
        {
            TableRelation = "Assignment Matrix-X1";
        }
        field(50019; "Posting Group"; Code[10])
        {
            NotBlank = true;
            TableRelation = "Employee Posting GroupX1";

            trigger OnValidate()
            begin
                if xRec."Posting Group" = 'PROBATION' then begin
                    /*
                     IF "Date Of Join"<>0D THEN
                     BEGIN
                       NoofMonthsWorked:=0;
                       */
                    Nextmonth := "Date Of Join";
                    // REPEAT
                    Nextmonth := CalcDate('1M', Nextmonth);
                    //     NoofMonthsWorked:=NoofMonthsWorked+1;
                    //  UNTIL NoofMonthsWorked=HumanResSetup."Probation Period";
                    EndDate := CalcDate(format(HumanResSetup."Probation Period(Months)" + 'D'), Nextmonth);//Nextmonth;
                                                                                                           // END;
                    if EndDate > Today then
                        Error('You cannot change status from Probation before the probation period has expired');
                end;

            end;
        }
        field(50020; "Total Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   Type = const("Saving Scheme"),
                                                                   "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
            NotBlank = true;
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX1"."Bank Branch No." where(Code = field("Employee's Bank"));

            // trigger OnValidate()
            // begin
            //     EmployeeBank.Reset;
            //     EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch");
            //     if EmployeeBank.FindSet() then begin
            //         "Bank Branch Name" := EmployeeBank."Name 2";
            //     end;
            // end;
        }
        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;
        }
        field(50024; "Opening SSF"; Decimal)
        {
        }
        field(50025; "Opening PAYE"; Decimal)
        {
        }
        field(50026; "Tax Deductible to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Tax Deductible" = const(true),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50027; "SSF Employer to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1"."Employer Amount" where("Tax Deductible" = const(true),
                                                                              "Employee No" = field("No."),
                                                                              "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50028; "Opening Employer SSF"; Decimal)
        {
        }
        field(50029; "Cumm. Basic Pay"; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX1"."Basic Pay" where("Payroll Period" = field("Pay Period Filter"),
                                                                           Employee = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Tax Relief Amount"; Decimal)
        {
        }
        field(50031; "P.I.N"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                if DuplicatePINExists > 1 then
                    Error('The KRA PIN Number Exists');
                if not ValidLength("P.I.N", 11) then
                    Error('The KRA pin is wrong');
            end;
        }
        field(50032; "Passport No."; Code[20])
        {

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."Passport No.", "Passport No.");
                if Employee.Find('-') then
                    Error('You have already created an employee with Passport Number %1 in Employee No %2', Employee."Passport No.", Employee."No.");
            end;
        }
        field(50033; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50034; "Cumm. Net Pay"; Decimal)
        {
            Editable = false;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
            Caption = 'SHIF No.';
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
        field(50043; "Customer Code"; Code[20])
        {
            TableRelation = Customer;
        }
        field(50045; "Benefits-Non Cash"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
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
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   Type = const(Deduction),
                                                                   "Tax Deductible" = const(true),
                                                                   Retirement = const(false)));
            FieldClass = FlowField;
        }
        field(50049; "Retirement Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Tax Deductible" = const(true),
                                                                   Retirement = const(true)));
            FieldClass = FlowField;
        }
        field(50050; "Home Ownership Status"; Option)
        {
            OptionMembers = "None","Owner Occupier","Home Savings";
        }
        field(50051; "Owner Occupier"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   Type = const(Payment),
                                                                   "Tax Deductible" = const(true)));
            FieldClass = FlowField;
        }
        field(50052; "National ID"; Code[20])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."National ID", "National ID");
                if Employee.Find('-') then
                    Error('You have already created an employee with ID Number %1 in Employee No %2', "National ID", Employee."No.");
            end;
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
            CalcFormula = sum("Employee Ledger EntryX1".Quarters where(Employee = field("No."),
                                                                        "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50057; BfMpr; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX1".BfMpr where(Employee = field("No."),
                                                                     "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50058; PensionNo; Code[10])
        {
        }
        field(50059; "Salary Scheme Category"; Code[20])
        {
            TableRelation = Categoryx1;
        }
        field(50060; "Salary Steps"; Code[20])
        {
            TableRelation = "Salary Stepsx1"."Step Code" where("Category code" = field("Salary Scheme Category"),
                                                                Level = field(Level));

            trigger OnValidate()
            begin


            end;
        }
        field(50061; Level; Option)
        {
            OptionMembers = "Level 1","Level 2";
        }
        field(50065; "Share Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   Shares = const(true)));
            Caption = 'coop skg fund';
            FieldClass = FlowField;
        }
        field(50066; "House allowance"; Decimal)
        {
        }
        field(50067; Overtime; Decimal)
        {
            Editable = false;
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

        field(50074; Advance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = const(Deduction),
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
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   Paye = const(false)));
            FieldClass = FlowField;
        }
        field(50079; "Net pay"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Information = const(false),
                                                                   "Non-Cash Benefit" = const(false),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50080; "Advance Code Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX1.Code;
        }
        field(50081; "Gross pay"; Decimal)
        {
        }
        field(50082; interest; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1"."Interest Amount" where("Employee No" = field("No."),
                                                                              "Payroll Period" = field("Pay Period Filter"),
                                                                              Type = filter(Deduction)));
            FieldClass = FlowField;
        }
        field(50083; "Working Hours"; Decimal)
        {

            trigger OnValidate()
            begin
                "Hourly Rate" := "Daily Rate" / "Working Hours";
            end;
        }
        field(50084; "No. Of Days Worked"; Decimal)
        {
            Editable = false;
        }
        field(50085; "No. of Hours"; Decimal)
        {
            Editable = false;
        }
        field(50086; "No. Of Hours Weekend"; Decimal)
        {
            Editable = false;
        }
        field(50087; Basic; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = const(Payment),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50088; ECode; Code[10])
        {
        }
        field(50089; SKey; Code[20])
        {
        }
        field(50090; Employer; Code[20])
        {
        }
        field(50091; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50092; "Job ID"; Code[20])
        {
        }
        field(50094; "Home Phone Number"; Text[30])
        {
        }
        field(50095; "Cellular Phone Number"; Text[30])
        {
        }
        field(50096; "Work Phone Number"; Text[30])
        {
        }
        field(50097; "Ext."; Text[7])
        {
        }
        field(50098; "ID Number"; Text[30])
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."ID Number", "ID Number");
                if Employee.Find('-') then
                    Error('You have already created an employee with ID Number %1 in Employee No %2', "ID Number", Employee."No.");
            end;
        }
        field(50099; Gender2; Option)
        {
            NotBlank = true;
            OptionMembers = Female,Male;
        }
        field(50100; "Fax Number"; Text[30])
        {
        }
        field(50104; "Known As"; Text[30])
        {

            trigger OnValidate()
            begin


            end;
        }
        field(50105; Position; Text[30])
        {
            NotBlank = true;
            TableRelation = "Company Jobs1";

            trigger OnValidate()
            begin
                if Jobs.Get(Position) then
                    "Job Title" := Jobs."Job Description";
                "Salary Scale" := Jobs.Grade;
                "Notice Period" := Jobs."Notice Period";
                "Probation Period" := Jobs."Probation Period";
                "Global Dimension 1 Code" := Jobs."Dimension 1";
                DimensionRec.Reset;
                DimensionRec.SetRange(DimensionRec."Dimension Code", 'DIRECTORATE');
                DimensionRec.SetRange(DimensionRec.Code, "Global Dimension 1 Code");
                if DimensionRec.Find('+') then
                    "Directorate Name" := DimensionRec.Name;

                "Global Dimension 2 Code" := Jobs."Dimension 2";

                DimensionRec.Reset;
                DimensionRec.SetRange(DimensionRec."Dimension Code", 'DEPARTMENT');
                DimensionRec.SetRange(DimensionRec.Code, "Global Dimension 2 Code");
                if DimensionRec.Find('+') then
                    "Department Name" := DimensionRec.Name;


                if ((xRec.Position <> '') and (Position <> xRec.Position)) then begin
                    Jobs.Reset;
                    Jobs.SetRange(Jobs."Job ID", Position);
                    if Jobs.Find('-') then begin
                        "Job Title" := Jobs."Job Description";
                        "Salary Scheme Category" := Jobs.Category;
                        //  "Salary Steps":=Jobs.Grade;
                        //MODIFY;
                    end;




                    CareerEvent.SetMessage('Job Title Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    // IF OK THEN BEGIN
                    CareerHistory.Init;
                    if not CareerHistory.Find('-') then
                        CareerHistory."Line No." := 1
                    else begin
                        CareerHistory.Find('+');
                        CareerHistory."Line No." := CareerHistory."Line No." + 1;
                    end;

                    CareerHistory."Employee No." := "No.";
                    CareerHistory."Date Of Event" := Today;
                    CareerHistory."Career Event" := 'Job Title Changed';
                    CareerHistory."Job Title" := "Job Title";
                    CareerHistory."Employee First Name" := "Known As";
                    CareerHistory."Employee Last Name" := "Last Name";
                    CareerHistory.Reason := CareerEvent.ReturnReason;
                    CareerHistory.Insert;
                end;


                //  END;

            end;
        }
        field(50106; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";

            trigger OnValidate()
            begin
                if ("Full / Part Time" <> xRec."Full / Part Time") then begin
                    CareerEvent.SetMessage('Full / Part Time Changed');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    if OK then begin
                        CareerHistory.Init;
                        if not CareerHistory.Find('-') then
                            CareerHistory."Line No." := 1
                        else begin
                            CareerHistory.Find('+');
                            CareerHistory."Line No." := CareerHistory."Line No." + 1;
                        end;

                        CareerHistory."Employee No." := "No.";
                        CareerHistory."Date Of Event" := Today;
                        CareerHistory."Career Event" := 'Full / Part Time Changed';
                        CareerHistory."Full/Part Time" := "Full / Part Time";
                        CareerHistory."Employee First Name" := "Known As";
                        CareerHistory."Employee Last Name" := "Last Name";
                        CareerHistory.Insert;
                    end;
                end;
            end;
        }
        field(50107; "Contract Type"; Code[20])
        {
            TableRelation = "Employment Contract";

            trigger OnValidate()
            begin
                CareerEvent.SetMessage('Contract Type Changed');
                CareerEvent.RunModal;
                OK := CareerEvent.ReturnResult;
                // IF OK THEN BEGIN
                CareerHistory.Init;
                if not CareerHistory.Find('-') then
                    CareerHistory."Line No." := 1
                else begin
                    CareerHistory.Find('+');
                    CareerHistory."Line No." := CareerHistory."Line No." + 1;
                end;

                CareerHistory."Employee No." := "No.";
                CareerHistory."Date Of Event" := Today;
                CareerHistory."Career Event" := 'Contract Type Changed';
                CareerHistory."Job Title" := "Job Title";
                CareerHistory."Employee First Name" := "Known As";
                CareerHistory."Employee Last Name" := "Last Name";
                CareerHistory.Reason := CareerEvent.ReturnReason;
                CareerHistory.Insert;
                //END;
            end;
        }
        field(50108; "Contract End Date"; Date)
        {
        }
        field(50109; "Notice Period"; DateFormula)
        {
        }
        field(50110; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;

            trigger OnValidate()
            begin
                /*  IF ("Marital Status" <> xRec."Marital Status") THEN BEGIN
                     CareerEvent.SetMessage('Marital Status Changed');
                     CareerEvent.RUNMODAL;
                     OK:= CareerEvent.ReturnResult;
                      IF OK THEN BEGIN
                         CareerHistory.INIT;
                         IF NOT CareerHistory.FIND('-') THEN
                          CareerHistory."Line No.":=1
                        ELSE BEGIN
                          CareerHistory.FIND('+');
                          CareerHistory."Line No.":=CareerHistory."Line No."+1;
                        END;

                         CareerHistory."Employee No.":= "No.";
                         CareerHistory."Date Of Event":= TODAY;
                         CareerHistory."Career Event":= 'Marital Status Changed';
                         CareerHistory."Marital Status":= "Marital Status";
                         CareerHistory."Employee First Name":= "Known As";
                         CareerHistory."Employee Last Name":= "Last Name";
                         CareerHistory.INSERT;
                      END;
                  END;
                */

            end;
        }
        field(50111; "Ethnic Origin"; Option)
        {
            OptionMembers = African,Indian,White,Coloured;

            trigger OnValidate()
            begin
                /*EmployeeEquity.SETRANGE("Employee No.","No.");
                OK:= EmployeeEquity.FIND('-');
                IF OK THEN BEGIN
                  EmployeeEquity."Ethnic Origin":= "Ethnic Origin";
                  EmployeeEquity.MODIFY;
                END;
                 */

            end;
        }
        field(50112; "First Language (R/W/S)"; Code[10])
        {
            TableRelation = "Company Jobs1";
        }
        field(50113; "Driving Licence"; Code[20])
        {
        }
        field(50114; "Date Of Birth"; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                HumanResSetup.Get;
                "Retirement Date" := CalcDate(HumanResSetup."Retirement Age", "Date Of Birth");
                if (Rec."Date Of Birth" <> 0D) then
                    Rec.Age := Dates.DetermineAge(Rec."Date Of Birth", Today);
            end;
        }
        field(50115; Age; Text[80])
        {
        }
        field(50116; "Date Of Join"; Date)
        {
            NotBlank = true;

            trigger OnValidate()
            begin
                /*
               HumanResSetup.GET;
               DateInt:=DATE2DMY("Date Of Join",1);
               "Pro-Rata on Joining":=HumanResSetup."No. Of Days in Month"-DateInt+1;
               PayPeriod.RESET;
               PayPeriod.SETRANGE(PayPeriod."Starting Date",0D,"Date Of Join");
               PayPeriod.SETRANGE(PayPeriod."New Fiscal Year",TRUE);
               IF PayPeriod.FIND('+') THEN
               BEGIN
               FiscalStart:=PayPeriod."Starting Date";
               MaturityDate:=CALCDATE('1Y',PayPeriod."Starting Date")-1;
                MESSAGE('Maturity %1',MaturityDate)
               END;

               IF ("Posting Group"='PERMANENT') OR ("Posting Group"='DG') THEN BEGIN
               //MESSAGE('Date of join %1',"Date Of Join") ;
                Entitlement:=ROUND(((MaturityDate-"Date Of Join")/30),1)*2.5;

               EmpLeaves.RESET;
               EmpLeaves.SETRANGE(EmpLeaves."Employee No","No.");
               EmpLeaves.SETRANGE(EmpLeaves."Maturity Date",MaturityDate);
               IF NOT EmpLeaves.FIND('-') THEN BEGIN
                 EmpLeaves."Employee No":="No.";
                 EmpLeaves."Leave Code":='ANNUAL';
                 EmpLeaves."Maturity Date":=MaturityDate;
                 EmpLeaves.Entitlement:=Entitlement;
               //IF NOT EmpLeaves.GET("No.",'ANNUAL',MaturityDate) THEN
                 EmpLeaves.INSERT;
               END;

               END;
                 */


                CareerEvent.SetMessage('Joined Organisation');
                CareerEvent.RunModal;
                OK := CareerEvent.ReturnResult;
                // IF OK THEN BEGIN
                CareerHistory.Init;
                if not CareerHistory.Find('-') then
                    CareerHistory."Line No." := 1
                else begin
                    CareerHistory.Find('+');
                    CareerHistory."Line No." := CareerHistory."Line No." + 1;
                end;

                CareerHistory."Employee No." := "No.";
                CareerHistory."Date Of Event" := "Date Of Join";
                CareerHistory."Career Event" := 'Joined Organisation';
                CareerHistory."Job Title" := "Job Title";
                CareerHistory."Employee First Name" := "Known As";
                CareerHistory."Employee Last Name" := "Last Name";
                CareerHistory.Reason := CareerEvent.ReturnReason;
                CareerHistory.Insert;
                //END;


                //HumanResSetup.GET;
                //"End Of Probation Date":=CALCDATE(HumanResSetup."Probation Period(Months)","Date Of Join");
                AccPeriod.Reset;
                AccPeriod.SetRange(AccPeriod."Starting Date", 0D, Today);
                AccPeriod.SetRange(AccPeriod."New Fiscal Year", true);
                if AccPeriod.Find('+') then
                    EndYearDate := CalcDate('1Y', AccPeriod."Starting Date") - 1;
                // MESSAGE('EndYear=%1',EndYearDate);

                NoofMonthsToWork := 0;
                NextDate := "Date Of Join";
                repeat
                    NextDate := CalcDate('1M', NextDate);
                    NoofMonthsToWork := NoofMonthsToWork + 1;
                until NextDate >= EndYearDate;
                NoofMonthsToWork := NoofMonthsToWork - 1;

                LeaveTypes.Reset;
                LeaveTypes.SetRange(LeaveTypes."Annual Leave", true);
                if LeaveTypes.Find('-') then begin

                    LeaveCode := LeaveTypes.Code;
                    LeaveEarnedtoDate := ROUND(((LeaveTypes.Days / 12) * ((EndYearDate - "Date Of Join") / 30)), 1);//NoofMonthsToWork
                                                                                                                    //Entitlement:=ROUND(((MaturityDate-"Date Of Join")/30),1)*2.5;
                end;

                EmpLeave.Reset;
                EmpLeave."Leave Code" := LeaveCode;
                EmpLeave."Maturity Date" := EndYearDate;
                EmpLeave."Employee No" := "No.";
                EmpLeave.Entitlement := LeaveEarnedtoDate;
                if not EmpLeave.Get(EmpLeave."Employee No", EmpLeave."Leave Code", EmpLeave."Maturity Date") then
                    EmpLeave.Insert
                else
                    EmpLeave.Modify;

                //  MESSAGE('%1',LeaveEarnedtoDate);

            end;
        }
        field(50117; "Length Of Service"; Text[80])
        {
        }
        field(50118; "End Of Probation Date"; Date)
        {
        }
        field(50119; "Pension Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                /*  IF ("Date Of Leaving" <> 0D) AND ("Pension Scheme Join" <> 0D) THEN
                   "Time Pension Scheme":= Dates.DetermineAge("Pension Scheme Join","Date Of Leaving");

            */

            end;
        }
        field(50120; "Time Pension Scheme"; Text[80])
        {
        }
        field(50121; "Medical Scheme Join"; Date)
        {

            trigger OnValidate()
            begin
                /*  IF  ("Date Of Leaving" <> 0D) AND ("Medical Scheme Join" <> 0D) THEN
                   "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");
                */

            end;
        }
        field(50122; "Time Medical Scheme"; Text[80])
        {
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(50123; "Date Of Leaving"; Date)
        {

            trigger OnValidate()
            begin
                /* IF ("Date Of Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                  "Length Of Service":= Dates.DetermineAge("Date Of Join","Date Of Leaving");
                 IF ("Pension Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                  "Time Pension Scheme":= Dates.DetermineAge("Pension Scheme Join","Date Of Leaving");
                 IF ("Medical Scheme Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
                  "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");


                 IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                    ExitInterviews.SETRANGE("Employee No.","No.");
                    OK:= ExitInterviews.FIND('-');
                    IF OK THEN BEGIN
                      ExitInterviews."Date Of Leaving":= "Date Of Leaving";
                      ExitInterviews.MODIFY;
                    END;
                    COMMIT();
                 END;

                  */
                if ("Date Of Leaving" <> 0D) and ("Date Of Leaving" <> xRec."Date Of Leaving") then begin
                    CareerEvent.SetMessage('Left The Company');
                    CareerEvent.RunModal;
                    OK := CareerEvent.ReturnResult;
                    // IF OK THEN BEGIN
                    CareerHistory.Init;
                    if not CareerHistory.Find('-') then
                        CareerHistory."Line No." := 1
                    else begin
                        CareerHistory.Find('+');
                        CareerHistory."Line No." := CareerHistory."Line No." + 1;
                    end;

                    CareerHistory."Employee No." := "No.";
                    CareerHistory."Date Of Event" := "Date Of Leaving";
                    CareerHistory."Career Event" := 'Left The Company';
                    CareerHistory."Employee First Name" := "Known As";
                    CareerHistory."Employee Last Name" := "Last Name";

                    CareerHistory.Insert;
                    //  END;
                end;


                ExitInterviewTemplate.Reset;
                //TrainingEvalTemplate.SETRANGE(TrainingEvalTemplate."AIT/Evaluation",TrainingEvalTemplate."AIT/Evaluation"::AIT);
                if ExitInterviewTemplate.Find('-') then
                    repeat
                        ExitInterviewLines.Init;
                        ExitInterviewLines."Employee No" := "No.";
                        ExitInterviewLines.Question := ExitInterviewTemplate.Question;
                        ExitInterviewLines."Line No" := ExitInterviewTemplate."Line No";
                        ExitInterviewLines.Bold := ExitInterviewTemplate.Bold;
                        ExitInterviewLines."Answer Type" := ExitInterviewTemplate."Answer Type";
                        if not ExitInterviewLines.Get(ExitInterviewLines."Line No", ExitInterviewLines."Employee No") then
                            ExitInterviewLines.Insert


                    until ExitInterviewTemplate.Next = 0;

            end;
        }
        field(50124; "Second Language (R/W/S)"; Code[10])
        {
        }
        field(50125; "Additional Language"; Code[10])
        {
        }
        field(50126; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;

            trigger OnValidate()
            var
                "Lrec Resource": Record Resource;
                OK: Boolean;
            begin
                //**Added by ACR 12/08/2002
                //**Block resource if Terminated

                if "Resource No." <> '' then begin
                    OK := "Lrec Resource".Get("Resource No.");
                    "Lrec Resource".Blocked := true;
                    "Lrec Resource".Modify;
                end;

                //**
            end;
        }
        field(50127; "Job Specification"; Code[30])
        {
        }
        field(50129; Citizenship; Code[10])
        {
        }
        field(50130; "Passport Number"; Text[30])
        {

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."Passport Number", "Passport Number");
                if Employee.Find('-') then
                    Error('You have already created an employee with Passport Number %1 in Employee No %2', "Passport Number", Employee."No.");
            end;
        }
        field(50131; "First Language Read"; Boolean)
        {
        }
        field(50132; "First Language Write"; Boolean)
        {
        }
        field(50133; "First Language Speak"; Boolean)
        {
        }
        field(50134; "Second Language Read"; Boolean)
        {
        }
        field(50135; "Second Language Write"; Boolean)
        {
        }
        field(50136; "Second Language Speak"; Boolean)
        {
        }
        field(50137; "PIN Number"; Code[20])
        {
            NotBlank = true;
        }

        field(50142; "HELB No"; Text[30])
        {
        }
        field(50143; "Co-Operative No"; Text[30])
        {
        }
        field(50144; "Position To Succeed"; Code[20])
        {
            TableRelation = "Company Jobs1"."Job ID";

            trigger OnValidate()
            begin
                Jobs.Reset;
                if Jobs.Get("Position To Succeed") then
                    "Position To Succeed Name" := Jobs."Job Description";

                SuccessionGap.Reset;
                SuccessionGap.SetRange(SuccessionGap."Employee No", "No.");
                if SuccessionGap.Find('-') then
                    SuccessionGap.DeleteAll;

                JobReq.Reset;
                JobReq.SetRange(JobReq."Job Id", "Position To Succeed");
                if JobReq.Find('-') then begin
                    repeat
                        EmpQualification.Reset;
                        EmpQualification.SetRange(EmpQualification."Employee No.", "No.");
                        EmpQualification.SetRange(EmpQualification."Qualification Code", JobReq."Qualification Code");
                        //IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                        if not EmpQualification.Find('-') then begin

                            SuccessionGap.Init;
                            SuccessionGap."Employee No" := "No.";
                            SuccessionGap."Job Id" := JobReq."Job Id";
                            SuccessionGap."Qualification Type" := JobReq."Qualification Type";
                            SuccessionGap."Qualification Code" := JobReq."Qualification Code";
                            SuccessionGap.Qualification := JobReq.Qualification;
                            SuccessionGap.Priority := JobReq.Priority;
                            SuccessionGap.Insert;
                        end;
                    until JobReq.Next = 0;
                end;
            end;
        }
        field(50145; "Succesion Date"; Date)
        {
        }
        field(50146; "Send Alert to"; Code[100])
        {
        }
        field(50147; Religion; Code[20])
        {

            trigger OnValidate()
            begin
                CareerEvent.SetMessage('Religion Changed');
                CareerEvent.RunModal;
                OK := CareerEvent.ReturnResult;
                // IF OK THEN BEGIN
                CareerHistory.Init;
                if not CareerHistory.Find('-') then
                    CareerHistory."Line No." := 1
                else begin
                    CareerHistory.Find('+');
                    CareerHistory."Line No." := CareerHistory."Line No." + 1;
                end;

                CareerHistory."Employee No." := "No.";
                CareerHistory."Date Of Event" := Today;
                CareerHistory."Career Event" := 'Religion Changed';
                CareerHistory."Job Title" := "Job Title";
                CareerHistory."Employee First Name" := "Known As";
                CareerHistory."Employee Last Name" := "Last Name";
                CareerHistory.Reason := CareerEvent.ReturnReason;
                CareerHistory.Insert;
                //END;
            end;
        }
        field(50149; "Served Notice Period"; Boolean)
        {
        }
        field(50150; "Exit Interview Date"; Date)
        {
        }
        field(50151; "Exit Interview Done by"; Code[20])
        {
        }
        field(50152; "Allow Re-Employment In Future"; Boolean)
        {
        }
        field(50153; "Postal Address"; Text[80])
        {
        }
        field(50154; "Residential Address"; Text[80])
        {
        }
        field(50155; "Postal Address2"; Text[30])
        {
        }
        field(50156; "Postal Address3"; Text[20])
        {
        }
        field(50157; "Residential Address2"; Text[30])
        {
        }
        field(50158; "Residential Address3"; Text[20])
        {
        }
        field(50159; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
        }
        field(50160; "Incremental Month"; Text[30])
        {
        }
        field(50161; "Current Date"; Date)
        {
        }
        field(50162; Present; Code[30])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field("Salary Scale"));
            DataClassification = CustomerContent;
            Caption = 'Salary Notch';

            trigger OnValidate()
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
            begin
                if SalPointer.Get("Salary Scale", Present) then begin
                    GrossPay := SalPointer."Gross Pay";
                    PayrollSetup.get();
                    PayrollSetup.TestField("Minimum Taxable Pay");
                    ScaleBenefits.Reset;
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", "Salary Scale");
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", Present);
                    ScaleBenefits.SetRange(ScaleBenefits."Basic Salary", true);
                    if ScaleBenefits.Find('-') then begin
                        SalaryCard.reset;
                        SalaryCard.SetRange(SalaryCard."Employee Code", "No.");
                        if SalaryCard.find('-') then begin
                            if ScaleBenefits."Based On" = ScaleBenefits."Based On"::Amount then
                                SalaryCard."Basic Pay" := ScaleBenefits.Amount
                            else begin
                                ScaleBenefits.TestField(Percentage);
                                SalaryCard."Basic Pay" := ScaleBenefits.Percentage / 100 * GrossPay;
                            end;
                            BasicSalary := EmpEarnings.Amount;
                            SalaryCard.Validate("Has Fuel Card");
                            // if ScaleBenefits.Amount > PayrollSetup."Minimum Taxable Pay" then
                            //   SalaryCard."Pays PAYE" := true
                            //else
                            //   SalaryCard."Pays PAYE" := false;
                            //SalaryCard."Pays NHIF" := true;
                            //SalaryCard."Pays NSSF" := true;
                            SalaryCard.Modify();

                        end else begin
                            SalaryCard.Init();
                            SalaryCard."Employee Code" := "No.";
                            if ScaleBenefits."Based On" = ScaleBenefits."Based On"::Amount then
                                SalaryCard."Basic Pay" := ScaleBenefits.Amount
                            else begin
                                ScaleBenefits.TestField(Percentage);
                                SalaryCard."Basic Pay" := ScaleBenefits.Percentage / 100 * GrossPay;
                            end;
                            BasicSalary := EmpEarnings.Amount;
                            if ScaleBenefits.Amount > PayrollSetup."Minimum Taxable Pay" then
                                SalaryCard."Pays PAYE" := true
                            else
                                SalaryCard."Pays PAYE" := false;
                            SalaryCard.Validate("Has Fuel Card");
                            SalaryCard."Pays NHIF" := true;
                            SalaryCard."Pays NSSF" := true;
                            SalaryCard.insert();
                        end;

                    end;
                    PRPayrollPeriods.Reset;
                    PRPayrollPeriods.SetRange(PRPayrollPeriods.Closed, false);
                    PRPayrollPeriods.FindFirst();
                    Begindate := PRPayrollPeriods."Date Opened";
                    EmpEarning2.Reset();
                    EmpEarning2.SetRange(EmpEarning2."Employee Code", "No.");
                    EmpEarning2.SetRange(EmpEarning2."Payroll Period", PRPayrollPeriods."Date Opened");
                    //EmpEarning2.SetRange(EmpEarning2."coop parameters", EmpEarning2."coop parameters"::Pension);
                    //EmpEarning2.SetRange(EmpEarning2."Transaction Type", EmpEarning2."Transaction Type"::Income);
                    if EmpEarning2.Find('-') then begin
                        repeat
                            if PrTrans.Get(EmpEarning2."Transaction Code") then begin
                                if PrTrans."Recalculate Basic Changes" then begin
                                    EmpEarning2.Validate("Transaction Code");
                                    EmpEarning2.Modify();
                                end;
                            end;
                        until EmpEarning2.Next() = 0;
                    end;
                    //   EmpEarning2.DeleteAll();

                    ScaleBenefits.Reset;
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", "Salary Scale");
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", Present);
                    ScaleBenefits.SetRange(ScaleBenefits."Basic Salary", false);
                    if ScaleBenefits.Find('-') then begin
                        repeat
                            EmpEarnings.Init;
                            EmpEarnings."Employee Code" := "No.";
                            EmpEarnings."Transaction Code" := ScaleBenefits."ED Code";
                            EmpEarnings.Validate("Transaction Code");
                            if ScaleBenefits."Based On" = ScaleBenefits."Based On"::Amount then
                                EmpEarnings.Amount := ScaleBenefits.Amount
                            else begin
                                ScaleBenefits.TestField(Percentage);
                                EmpEarnings.Amount := ScaleBenefits.Percentage / 100 * GrossPay;
                            end;
                            EmpEarnings."Payroll Period" := Begindate;
                            if PayPeriod.Get(Begindate) then begin
                                EmpEarnings."Period Month" := PayPeriod."Period Month";
                                EmpEarnings."Period Year" := PayPeriod."Period Year";
                            end;
                            EmpEarnings."Payroll Period" := PRPayrollPeriods."Date Opened";
                            if PrTrans.Get(ScaleBenefits."ED Code") then
                                //if PrTrans."Is Formula" then
                                EmpEarnings.Validate("Transaction Code");
                            EmpEarnings.Validate(Amount);

                            if not EmpEarnings.Insert() then EmpEarnings.Modify();
                        until ScaleBenefits.Next() = 0;
                    end;
                    // Rec."Increment Date" := Today;
                end;
            end;
        }
        field(50163; Previous; Code[30])
        {
            TableRelation = "Salary Pointers1";
        }
        field(50164; Halt; Code[30])
        {
        }
        field(50165; "Salary Scale"; Code[30])
        {
            // f("Posting Group" = filter('CASUAL')) "Resource Price"."Work Type Code" where(Code = filter('CASUAL'))
            // else
            // "Salary Scales".Scale;
            TableRelation = "Salary Scales".Scale;
            DataClassification = CustomerContent;

            trigger OnValidate()
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
            begin
                clear(rec.present);
                GrossPay := 0;
                PayrollSetup.get();
                PayrollSetup.TestField("Minimum Taxable Pay");
                "Current Job Grade" := "Salary Scale";

                SalaryCard.reset;
                SalaryCard.SetRange(SalaryCard."Employee Code", "No.");
                if SalaryCard.find('-') then begin
                    SalaryCard."Basic Pay" := 0;
                    SalaryCard."Pays PAYE" := true;
                    SalaryCard."Pays NHIF" := true;
                    SalaryCard."Pays NSSF" := true;
                    SalaryCard.Modify();

                end else begin
                    SalaryCard.Init();
                    SalaryCard."Employee Code" := "No.";
                    SalaryCard."Basic Pay" := 0;
                    SalaryCard."Pays PAYE" := true;
                    SalaryCard."Pays NHIF" := true;
                    SalaryCard."Pays NSSF" := true;
                    SalaryCard.insert();
                end;

            end;
        }
        field(50166; Insurance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = const(Deduction),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Insurance Code" = const(true)));
            FieldClass = FlowField;
        }
        field(50167; "days worked"; Decimal)
        {
        }
        field(50168; "Pro-Rata on Joining"; Decimal)
        {
        }
        field(50169; "Pro-rata on Leaving"; Decimal)
        {
        }
        field(50170; "Date OfJoining Payroll"; Date)
        {
        }
        field(50171; "PAYE Diff"; Decimal)
        {
        }
        field(50172; "Pro-Rata Calculated"; Boolean)
        {
        }
        field(50173; "Half Pay"; Boolean)
        {
        }
        field(50174; "Basic Arrears"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X1".Amount where(Type = const(Payment),
                                                                   "Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Basic Pay Arrears" = const(true)));
            FieldClass = FlowField;
        }
        field(50175; "Relief Amount"; Decimal)
        {
            CalcFormula = - sum("Assignment Matrix-X1".Amount where("Employee No" = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter"),
                                                                    "Non-Cash Benefit" = const(true),
                                                                    Type = const(Payment),
                                                                    "Tax Deductible" = const(true),
                                                                    "Tax Relief" = const(false),
                                                                    "Manual Entry" = const(false)));
            FieldClass = FlowField;
        }
        field(50176; "Employee Qty"; Integer)
        {
            CalcFormula = count(Employee);
            FieldClass = FlowField;
        }
        field(50177; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count(Employee where("Termination Category" = filter(= " ")));
            FieldClass = FlowField;
        }
        field(50178; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count(Employee where("Termination Category" = filter(<> " ")));
            FieldClass = FlowField;
        }
        field(50179; "Other Language Read"; Boolean)
        {
        }
        field(50180; "Other Language Write"; Boolean)
        {
        }
        field(50181; "Other Language Speak"; Boolean)
        {
        }
        field(50182; "Employee Job Type"; Option)
        {
            OptionCaption = '  ,Driver,Office Staff';
            OptionMembers = "  ",Driver,"Office Staff";
        }
        field(50183; cumul; Integer)
        {
        }
        field(50184; "Contract Start Date"; Date)
        {
        }
        field(50185; "Contract Number"; Integer)
        {
            TableRelation = "Employee Contracts1"."Contract No" where("Employee No" = field("No."),
                                                                       Status = const(Active));

            trigger OnValidate()
            begin
                TestField("Contract Type");
                if "Contract Type" <> 'PERM' then begin
                    EmployeeContracts.Reset;
                    EmployeeContracts.SetRange(EmployeeContracts."Contract No", "Contract Number");
                    if EmployeeContracts.Find('-') then begin
                        "Contract Start Date" := EmployeeContracts."Contract Start Date";
                        "Contract End Date" := EmployeeContracts."Contract End Date";
                        "Retirement Date" := EmployeeContracts."Contract End Date";
                    end;
                end else begin
                    "Contract Start Date" := "Date Of Join";
                    HumanResSetup.Get;
                    "Contract End Date" := CalcDate(Format(HumanResSetup."Retirement Age") + 'Y', "Date Of Join");
                    "Retirement Date" := CalcDate(Format(HumanResSetup."Retirement Age") + 'Y', "Date Of Join");
                end;
            end;
        }
        field(50186; "Leave Balance"; Decimal)
        {
        }
        field(50187; "Ethnic Group"; Code[30])
        {
            TableRelation = "Ethnic Groups1".Code;
        }
        field(50188; "Resource Request Status"; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled;
        }
        field(50189; "Blood Type"; Code[10])
        {
            TableRelation = "Blood Types List";
        }
        field(50190; Disability; Text[30])
        {
        }
        field(50191; "County Code"; Code[30])
        {
            TableRelation = Counties;
        }
        field(50192; "Retirement Date"; Date)
        {
        }
        field(50193; "Sub Section Code"; Code[10])
        {
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(50194; "First Employment Date"; Date)
        {
        }
        field(50195; "Probation Period"; DateFormula)
        {
        }
        field(50196; "Department Name"; Text[50])
        {
        }
        field(50197; "Directorate Name"; Text[50])
        {
        }
        field(50198; "Position To Succeed Name"; Text[50])
        {

            trigger OnValidate()
            begin

                SuccessionGap.Reset;
                SuccessionGap.SetRange(SuccessionGap."Employee No", "No.");
                if SuccessionGap.Find('-') then
                    SuccessionGap.DeleteAll;

                JobReq.Reset;
                JobReq.SetRange(JobReq."Job Id", "Position To Succeed");
                if JobReq.Find('-') then begin
                    repeat
                        EmpQualification.Reset;
                        EmpQualification.SetRange(EmpQualification."Employee No.", "No.");
                        EmpQualification.SetRange(EmpQualification."Qualification Code", JobReq."Qualification Code");
                        //IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                        if not EmpQualification.Find('-') then begin

                            SuccessionGap.Init;
                            SuccessionGap."Employee No" := "No.";
                            SuccessionGap."Job Id" := JobReq."Job Id";
                            SuccessionGap."Qualification Type" := JobReq."Qualification Type";
                            SuccessionGap."Qualification Code" := JobReq."Qualification Code";
                            SuccessionGap.Qualification := JobReq.Qualification;
                            SuccessionGap.Priority := JobReq.Priority;
                            SuccessionGap.Insert;
                        end;
                    until JobReq.Next = 0;
                end;
            end;
        }
        field(50199; "Notice Period(Probation)"; DateFormula)
        {
        }
        field(50200; Signature; Blob)
        {
            SubType = Bitmap;
        }
        field(50201; "Curency Code"; Code[20])
        {
        }
        field(50202; x; Text[30])
        {
        }
        field(50203; "Department Code"; Code[10])
        {
        }
        field(70092; "Implementing Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70025; Disabled; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'PWD';
            trigger OnValidate()
            begin
                if PRSalaryCard.Get("No.") then
                    PRSalaryCard."PWD Certificate?" := Disabled;
                PRSalaryCard.modify();
            end;
        }
        field(70026; "Disability Description"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70027; "Disability No."; Text[50])
        {
            Caption = 'NCPWD No.';
            trigger OnValidate()
            begin
                if "Disability No." = '' then
                    "Disability Cert Expiry" := 0D;
            end;

        }
        field(70102; "Disability Cert Expiry"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                TestField("Disability No.");
                if SalaryCard.Get("No.") then
                    if "Disability Cert Expiry" = 0D then begin
                        SalaryCard."PWD Certificate?" := false;
                        SalaryCard.Modify();
                    end;
                if "Disability Cert Expiry" > Today then begin
                    SalaryCard."PWD Certificate?" := true;
                    SalaryCard.Modify();
                end else begin
                    SalaryCard."PWD Certificate?" := false;
                    SalaryCard.Modify();
                end;
            end;
        }
        field(69601; "Current Duty Station"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Duty Station";
            trigger OnValidate()
            var
                EmpEarnings: record "PR Employee Transactions";
                PayrollSetup: record "PR Vital Setup Info";
                DutyStation: Record "Duty Station";
                SalaryCard: Record "PR Salary Card";
            begin
                GetPayPeriod();
                PayrollSetup.get();
                PayPeriod.Reset;
                PayPeriod.SetRange(PayPeriod.Closed, false);
                if PayPeriod.Find('-') then
                    Begindate := PayPeriod."Date Opened";
                if SalaryCard.Get("No.") then
                    PayrollSetup.TestField("Hardship Allowance Code");
                DutyStation.get("Current Duty Station");
                if DutyStation."Hardship Area" then begin
                    EmpEarnings."Employee Code" := "No.";
                    EmpEarnings."Transaction Code" := PayrollSetup."Hardship Allowance Code";
                    EmpEarnings.Validate("Transaction Code");
                    //EmpEarnings.Amount := 40 / 100 * SalaryCard."Basic Pay";                    
                    EmpEarnings."Payroll Period" := Begindate;
                    EmpEarnings."Period Month" := PayPeriod."Period Month";
                    EmpEarnings."Period Year" := PayPeriod."Period Year";

                    EmpEarnings.Insert();
                end else begin
                    EmpEarnings.Reset();
                    EmpEarnings.SetRange(EmpEarnings."Employee Code", "No.");
                    EmpEarnings.SetRange(EmpEarnings."Payroll Period", Begindate);
                    EmpEarnings.SetRange(EmpEarnings."Transaction Code", PayrollSetup."Hardship Allowance Code");
                    if EmpEarnings.Find('-') then
                        EmpEarnings.Delete();

                end;
            end;
        }
        field(70018; "Directorate Code"; Code[50])
        {
            Caption = 'Implementing Unit';
            DataClassification = CustomerContent;
            // TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                if RespC.get("Directorate Code") then
                    "Implementing Unit Name" := RespC.Name;
            end;
        }
        field(70093; "Employee Category Type"; Option)
        {
            OptionCaption = '"...",Attachee,Casual,Intern,Temporary,Board,Second-In,Second-Out';
            OptionMembers = "...",Attachee,Casual,"Intern","Temporary",Board,"Second-In","Second-Out";
            DataClassification = CustomerContent;
        }
        field(70085; "Employee Status 2"; Option)
        {
            caption = 'Employee Status';
            DataClassification = CustomerContent;
            OptionMembers = " ",Suspension,Interdiction,Absence,"Leave of Absence",Dismissal,Resignation,"Contract Expiry","In Service",Retirement,"Retire Mandatory",Death,"Stoppage of Salary",Termination,Probation;
        }
        field(70063; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(" "));
            ;
            DataClassification = CustomerContent;
        }
        field(70064; "Job Title2"; Text[250])
        {
            Caption = 'Designation';
            DataClassification = CustomerContent;
        }
        field(70080; "Exit Status"; Option)
        {
            Editable = false;
            DataClassification = CustomerContent;
            OptionMembers = "","Exit Processing","Pending Gratuity",Exited;
            optioncaption = ' ,Exit Processing,Pending Final Payment,Exited';
            trigger OnValidate()
            var
                PayrollProcessing: Codeunit "PR Payroll Processing";
            begin
                if "Exit Status" = "Exit Status"::"Pending Gratuity" then begin
                    PayrollProcessing.CalculateGratuity(Rec);
                    Present := '';
                    Modify();
                end;

            end;
        }
        field(70082; "Increment Date"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                IF DATE2DMY("Increment Date", 2) = 1 THEN
                    "Incremental Month" := 'January';
                IF DATE2DMY("Increment Date", 2) = 2 THEN
                    "Incremental Month" := 'February';
                IF DATE2DMY("Increment Date", 2) = 3 THEN
                    "Incremental Month" := 'March';
                IF DATE2DMY("Increment Date", 2) = 4 THEN
                    "Incremental Month" := 'April';
                IF DATE2DMY("Increment Date", 2) = 5 THEN
                    "Incremental Month" := 'May';
                IF DATE2DMY("Increment Date", 2) = 6 THEN
                    "Incremental Month" := 'June';
                IF DATE2DMY("Increment Date", 2) = 7 THEN
                    "Incremental Month" := 'July';
                IF DATE2DMY("Increment Date", 2) = 8 THEN
                    "Incremental Month" := 'August';
                IF DATE2DMY("Increment Date", 2) = 9 THEN
                    "Incremental Month" := 'September';
                IF DATE2DMY("Increment Date", 2) = 10 THEN
                    "Incremental Month" := 'October';
                IF DATE2DMY("Increment Date", 2) = 11 THEN
                    "Incremental Month" := 'November';
                IF DATE2DMY("Increment Date", 2) = 12 THEN
                    "Incremental Month" := 'December';
            end;
        }
        field(70100; "Last Increment Date"; Date)
        {
        }
        field(70103; "Re-Employment Date"; Date)
        {
        }
        field(70066; "On Suspension"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70067; "On Interdiction"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69014; "Employee Type"; Option)
        {
            OptionCaption = 'Primary Employee,Secondary Employee';
            OptionMembers = Primary,Secondary;
            DataClassification = CustomerContent;
        }
        field(70068; "Previous Payment System"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(69016; "Bank Name"; Text[100])
        {
            // CalcFormula = lookup("PR Bank Accounts"."Bank Name" where("Bank Code" = field("Employee's Bank")));
            CalcFormula = lookup("Employee Bank AccountX1".Name where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69017; "Bank Branch Name"; Text[100])
        {
            // CalcFormula = lookup("PR Bank Branches"."Branch Name" where("Branch Code" = field("Bank Branch"),
            //                                                                    "Bank Code" = field("Employee's Bank")));
            CalcFormula = lookup("Employee Bank AccountX1"."Name 2" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69600; "Current Position ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Company Positions"."Position ID";
            trigger OnValidate()
            var
                JobId: record "Company Positions";
            begin
                if JobId.get("Current Position ID") then
                    "Job Title2" := JobId."Job Title";
                "End Of Probation Date" := Today;
            end;

        }
        field(70073; "Employees Type"; Option)
        {
            OptionCaption = ' ,Permanent,Casual,Part Time,Interns,Contract,UnPaidLeave,Seconded';
            OptionMembers = " ",Permanent,Casual,"Part Time",Interns,Contract,UnPaidLeave,Seconded;
            DataClassification = CustomerContent;
        }
        field(69089; "On Leave"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70110; "Payslip Sent Date"; Date)
        {
        }
        field(69602; "Current Job Grade"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Salary Scales";
        }
        field(70091; "Organisation Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(69030; "Send Payslip By E-mail?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69001; "Pays tax?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
            DataClassification = CustomerContent;
        }
        field(70083; "Due for Retirement"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70057; "Record Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Employee,Intern,Management Trainee';
            OptionMembers = Employee,Intern,"Management Trainee";
        }
        field(70079; "Insurance Certificate"; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if PRSalaryCard.Get("No.") then
                    PRSalaryCard."Insurance Certificate?" := "Insurance Certificate";
                PRSalaryCard.modify();
            end;
        }
        field(70016; "Reason for termination"; Enum "Exit Reasons")
        {
            DataClassification = CustomerContent;
        }
        field(70069; "Period Year Filter"; Integer)
        {
            FieldClass = FlowFilter;
        }
        field(69087; "Leave Outstanding Bal"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             Closed = filter(false),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Type" = const('ANNUAL')));
            FieldClass = FlowField;
        }
        field(70055; "Age in Years"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70011; HOD; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70043; CEO; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69069; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
            DataClassification = CustomerContent;
        }
        field(69072; "Allocated Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Leave Type" = filter('ANNUAL'),
                                                                             "Leave Entry Type" = filter(Positive),
                                                                             "Document No." = filter('OPENING BAL' | 'J2023-24' | 'L2023-24'),
                                                                             "No. of days1" = filter(> 0),
                                                                             Closed = filter(false)));
            FieldClass = FlowField;

            // trigger OnValidate()
            // begin
            //     CalcFields("Total Leave Taken");
            //     "Total (Leave Days)" := "Allocated Leave Days" + "Reimbursed Leave Days";
            //     //SUM UP LEAVE LEDGER ENTRIES
            //     "Leave Balance" := "Total (Leave Days)" + "Total Leave Taken";
            //     //TotalDaysVal := Rec."Total Leave Taken";
            // end;
        }
        field(69071; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Types".Code;
        }
        field(69081; "Total Leave Taken"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Negative),
                                                                             Closed = const(false)));

            FieldClass = FlowField;
        }
        field(69082; "Total (Leave Days)"; Integer)
        {

            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69084; "Reimbursed Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Entry Type" = const(Reimbursement),
                                                                             "Leave Type" = const('ANNUAL'),
                                                                             Closed = const(false)));

            FieldClass = FlowField;

            trigger OnValidate()
            begin
                Validate("Allocated Leave Days");
            end;
        }
        field(69075; "Annual Leave Account"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Type" = const('ANNUAL'),
                                                                             "Staff No." = field("No."),
                                                                             "Leave Entry Type" = filter(<> Reimbursement)));
            FieldClass = FlowField;
        }
        field(69076; "Compassionate Leave Acc."; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Type" = const('COMPASSIONATE'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69077; "Maternity Leave Acc."; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Type" = const('MATERNITY'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69078; "Paternity Leave Acc."; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Type" = const('PATERNITY'),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69079; "Sick Leave Acc."; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Sick Leave"),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69080; "Study Leave Acc"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69627; "Off Days Acc."; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Off),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69070; "User ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;
            ValidateTableRelation = false;
        }
        field(69083; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            DataClassification = CustomerContent;
        }
        field(69085; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            DataClassification = CustomerContent;
        }
        field(70088; "Head of Station"; Boolean)
        {
            Caption = 'Head of Station';
            DataClassification = ToBeClassified;
        }
        field(70044; "Allow Negative Leave"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70081; "Leave Balance BF"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Leave Type" = filter('ANNUAL'),
                                                                             "Leave Entry Type" = filter(Reimbursement),
                                                                             "Document No." = filter('OPENING BAL'),
                                                                             "No. of days1" = filter(> 0),
                                                                             Closed = filter(false)));
            FieldClass = FlowField;


        }
        field(70029; "Employee's Bank 2"; Code[80])
        {
            // DataClassification = CustomerContent;
            // TableRelation = "Employee Bank AccountX";

            // trigger OnValidate()
            // begin
            //     EmployeeBank.Reset;
            //     EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank 2");
            //     if EmployeeBank.FindSet() then begin
            //         "Bank Name 2" := EmployeeBank."Bank Name";
            //         "Bank Branch Name 2" := EmployeeBank."Branch Name";
            //         "Bank Branch 2" := EmployeeBank."Bank Branch No.";
            //     end;
            // end;
        }
        field(70030; "Bank Branch 2"; Code[100])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank 2"));

            // trigger OnValidate()
            // begin
            //     EmployeeBank.Reset;
            //     EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch 2");
            //     if EmployeeBank.FindSet() then begin
            //         "Bank Branch Name 2" := EmployeeBank."Branch Name";
            //     end;
            // end;
        }
        field(70031; "Bank Account No. 2"; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = CustomerContent;
        }
        field(70032; "Bank Name 2"; Text[80])
        {
            // CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank 2"),
            //                                                                  "Bank Branch No." = field("Bank Branch 2")));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(70033; "Bank Branch Name 2"; Text[80])
        {
            // CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch 2"),
            //                                                                    Code = field("Employee's Bank 2")));
            // Editable = false;
            // FieldClass = FlowField;
        }
        field(69612; "Primary Telephone No."; Text[30])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
            trigger OnValidate()
            begin
                if DuplicatePrimaryPhoneExists > 1 then
                    Error('The Telephone Number Exists');
            end;
        }
        field(69022; "Absent Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69060; "Annual Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Annual),
                                                                             "Staff No." = field("No."),
                                                                             Closed = const(false)));
            FieldClass = FlowField;
        }
        field(69088; "Acrued Leave Days"; Integer)
        {
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(70048; "Actual Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where(Type = const(Deduction),
                                                                             "Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70034; "Primary Bank %"; Decimal)
        {
            DataClassification = CustomerContent;
            InitValue = 100;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Bank 2 %" := 100 - "Primary Bank %";
            end;
        }
        field(70035; "Bank 2 %"; Decimal)
        {
            DataClassification = CustomerContent;
            InitValue = 0;
            MaxValue = 100;
            MinValue = 0;

            trigger OnValidate()
            begin
                "Primary Bank %" := 100 - "Bank 2 %";
            end;
        }
        field(69048; "Basic Salary"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Basic)));
            FieldClass = FlowField;
        }
        field(51002; Branch; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('BRANCH')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(70015; "Claim Limit"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(69049; Classification; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = Table0;
        }
        field(69061; "Compassionate Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Compassionate),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(70058; "County of Residence"; Code[10])
        {
            DataClassification = CustomerContent;
            // TableRelation = County.Code;

            // trigger OnValidate()
            // begin
            //     if Countys.Get("County of Residence") then begin

            //         "County of Residence Name" := Countys.Description;
            //     end;
            // end;
        }
        field(70059; "County of Residence Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70060; "County of Origin"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = County.Code;

            trigger OnValidate()
            var
                Countys: Record County;
            begin
                if Countys.Get("County of Origin") then begin

                    "County of Origin Name" := Countys.Description;
                end;
            end;
        }
        field(70061; "County of Origin Name"; Text[250])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(51009; "Country Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COUNTRY'));
        }
        field(51184; Country; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('COUNTRY')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(70049; "Residential Status"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Resident,Non-Resident';
            OptionMembers = Resident,"Non-Resident";
        }
        field(70050; "Welfare Member"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70051; "Morgage Relief"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Payment),
                                                                  Code = const('SP11')));
            FieldClass = FlowField;
        }
        field(70052; "Reliver Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
        }
        field(70053; "User Signature"; Blob)
        {
            Caption = 'Picture';
            DataClassification = CustomerContent;
            ObsoleteReason = 'Replaced by Image field';
            ObsoleteState = Pending;
            SubType = Bitmap;
        }
        field(69028; "Unpaid Leave Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69065; "Unpaid Leave"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Unpaid Leave"),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(70040; "Unpaid Leave Acc"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(51066; TRelief; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E002'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(69068; "Non-Fluctuating Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Taxable = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Fluctuating" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69054; "Other Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Others)));
            FieldClass = FlowField;
        }
        field(69050; "Leave Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Leave)));
            FieldClass = FlowField;
        }
        field(69051; "Overtime Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(OT)));
            FieldClass = FlowField;
        }
        field(69046; "House Allowance1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(HouseAllowance)));
            FieldClass = FlowField;
        }
        field(69047; "Transport Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(TransportAllowance)));
            FieldClass = FlowField;
        }
        field(69027; "Night Allowance Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69015; "Total Allowances1"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false),
                                                                  "Normal Earnings" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69029; "Total Statutory"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Type = const(Deduction),
                                                                  Description = filter('PAYE' | 'NHIF' | 'NSSF'),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(69090; "Total Gratuity Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Gratuity Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70047; "Terminal Leave"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Leave Posting Type" = const("Terminal Leave")));
            FieldClass = FlowField;
        }
        field(69019; "Terminal Dues"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70022; Supervisor; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
            //This property is currently not supported
            //TestTableRelation = true;

            // trigger OnLookup()
            // begin
            //     UserMgt.LookupUserID(Supervisor);
            // end;

            // trigger OnValidate()
            // begin
            //     UserMgt.ValidateUserID(Supervisor);
            // end;
        }
        field(69064; "Study Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Study Leave"),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(51005; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(51006; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70020; "Date Joined DC"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70021; "Date Joined DB"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(69603; "Current Terms of Service"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Terms of Service";
        }
        field(70065; "Court Levels"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Court Levels';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Court Levels"));
        }
        field(69606; "Specialization Area"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Domain Area";
        }
        field(70045; "Special Pension"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(51010; "Staffing Group"; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('STAFFINGGRP')));
            FieldClass = FlowField;
        }
        field(70039; "Sports Leave Acc"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Leave Posting Type" = const("Sports Leave")));
            FieldClass = FlowField;
        }
        field(69066; "Sick Leave"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Sick Leave"),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(51004; Shift; Option)
        {
            OptionCaption = ' ,DAY,NIGHT';
            OptionMembers = " ",DAY,NIGHT;
            DataClassification = CustomerContent;
        }
        field(69614; "Secondary Relationship"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Father,Mother,Sibling,Spouse,Child,Other';
            OptionMembers = " ",Father,Mother,Sibling,Spouse,Child,Other;
        }
        field(69615; "Secondary First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(69616; "Secondary Last Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(69617; "Secondary Telephone No."; Text[30])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = PhoneNo;
        }
        field(69613; "Sec Emergency Contact Person"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Relative;
        }
        field(69609; "Primary Relationship"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Father,Mother,Sibling,Spouse,Child,Other';
            OptionMembers = " ",Father,Mother,Sibling,Spouse,Child,Other;
        }
        field(69610; "Primary First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(69611; "Primary Last Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70028; "Regional Manager"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(51185; Region; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('REGION')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(69091; "Research Center"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Research Center" where("Research Center?" = const(true));
        }
        field(69605; "Disability Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Disability Code";
        }
        field(70019; Division; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Court Station';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Court Stations"));
            //  TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(69607; "No. of Children"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69608; "Emergency Contact Person"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Relative;
        }
        field(70041; "Employer Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where("Tax Deductible" = const(true),
                                                                             Retirement = const(true),
                                                                             "Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70042; "Employee Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Tax Deductible" = const(true),
                                                                  Retirement = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70074; "Employee Contract Type"; Option)
        {
            OptionMembers = "","Permanent and Pensionable","Contract","Probation","Casual","Intern","Seconded";
            DataClassification = CustomerContent;
        }
        field(70009; "Employement Terms"; Option)
        {
            OptionMembers = Contract,"Permenanent and Pensionable",Seconded;
            DataClassification = CustomerContent;
        }
        field(70017; "Exit Interview Conducted"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
        }
        field(69073; "End of Contract Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(69618; "e-Recruitment Profile ID"; Code[30])
        {
            DataClassification = CustomerContent;
        }
        field(69619; "No. of Job Applications"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69620; "No. of Employment Contracts"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69621; "No. of Promotions"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69622; "No. of Transfers"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69623; "No. of Trainings"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69624; "No. of Committee Appointments"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69625; "No. of Appraisals"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69626; "No. of Disciplinary Cases"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70072; "Full Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(51099; Gender1; Option)
        {
            OptionMembers = Female,Male;
            DataClassification = CustomerContent;
        }
        field(70056; HODIR; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70038; "ICT Help Desk Admin"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69057; "Insurance Relief"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(InsuranceRelief)));
            FieldClass = FlowField;
        }
        field(70003; Leave; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Leave Days" where("Employee No" = field("No."),
                                                                           Closed = filter(false),
                                                                           Code = const('E008')));
            FieldClass = FlowField;
        }
        field(69059; "Total Leave Days"; Integer)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = filter('ANNUAL' | 'MATERNITY' | 'PATENITY' | 'STUDY' | 'TIMEOFF'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69062; "Maternity Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Marternity),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69063; "Paternity Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Parternity),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69604; "Nationality Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(70075; "On Probation"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70076; Ward; Code[20])
        {
            TableRelation = Ward.Code where(County = field("County of Origin"), "Sub County" = field("Sub County"));
            DataClassification = ToBeClassified;
        }
        field(70077; Village; Code[20])
        {
            TableRelation = Village.Code where(County = field("County of Origin"), "Sub County" = field("Sub County"), Ward = field(Ward));
            DataClassification = ToBeClassified;
        }
        field(70078; "Sub County"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Sub County".Code where(County = field("County of Origin"));
        }
        field(71079; Inducted; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70070; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods";
        }
        field(80000; "PSC Employee No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(80001; "Acting Present"; Code[30])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field("Acting Scale"));
            Caption = 'Acting Salary Notch';
        }
        field(80002; "Acting Scale"; Code[30])
        {
            TableRelation = "Salary Scales".Scale;
        }
        field(80003; "Leave Allowance Taken"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(80004; "Leave Allowance Year"; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(80005; "Leave Allowance Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(80006; "Global Dimension 1 Name"; Text[100])
        {
            CaptionClass = '1,3,1';
            Caption = 'Global Dimension 1 Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
        }
        field(80007; "Global Dimension 2 Name"; Text[100])
        {
            CaptionClass = '1,3,2';
            Caption = 'Global Dimension 2 Name';
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            Editable = false;
        }
    }
    keys
    {

        key(Key2; "Posting Group")
        {
        }
        key(Key3; "Pay Mode")
        {
        }
    }

    procedure GetPayPeriod()
    begin
        PayPeriod.Reset;
        PayPeriod.SetRange(PayPeriod.Closed, false);
        if PayPeriod.Find('-') then begin
            //PayPeriodtext:=PayPeriod.Name;
            Begindate := PayPeriod."Date Opened";
            //MESSAGE('%1',Begindate);
        end;
    end;

    procedure CreateLeaveEntitlment(var PayPeriod: Record "Payroll PeriodX1")
    var
        AccPeriod: Record "Payroll PeriodX1";
        NextDate: Date;
        EndOfYear: Boolean;
        EmpLeaves: Record "Employee Leaves1";
        LeaveType: Record "Leave Types1";
        MaturityDate: Date;
        NextMaturityDate: Date;
        Emp: Record Employee;
        CarryForwardDays: Decimal;
        EmpleaveCpy: Record "Employee Leaves1";
        Entitlement: Integer;
    begin
        //VALIDATE("Date Of Join");
    end;

    procedure CreateImprestAC(EmpRec: Record Employee)
    var
        Customer: Record Customer;
        ImpSetup: Record "Imprest Customer Posting Gruop";
        window: Dialog;
        Names: Text[100];
    begin

        with EmpRec do begin

            if not Customer.Get("No.") then begin
                Names := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
                window.Open(Text003, "No.", Names);
                ImpSetup.Get;
                ImpSetup.TestField("Imprest Posting Group");
                ImpSetup.TestField("General Bus. Posting Group");
                ImpSetup.TestField("VAT Bus. Posting Group");
                Customer.Init;
                Customer."No." := "No.";
                Customer.Name := CopyStr("First Name" + ' ' + "Middle Name" + ' ' + "Last Name", 1, 50);
                Customer.Address := Address;
                Customer."Address 2" := Address;
                Customer."Customer Posting Group" := ImpSetup."Imprest Posting Group";
                Customer."Gen. Bus. Posting Group" := ImpSetup."General Bus. Posting Group";
                Customer."VAT Bus. Posting Group" := ImpSetup."VAT Bus. Posting Group";
                if not Customer.Get("No.") then
                    Customer.Insert;
                window.Close;
            end;
        end;
    end;

    procedure CreateResource(): Boolean
    var
        ResourceRec: Record Resource;
        ResourceGroup: Record "Resource Group";
    begin
        if not ResourceRec.Get("No.") then begin
            ResourceRec."No." := "No.";
            ResourceRec.Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            ResourceRec."Job Title" := "Job Title";
            ResourceRec.Type := ResourceRec.Type::Person;
            /*IF NOT ResourceGroup.GET("Salary Scale") THEN
              ERROR(Text000,"Salary Scale");*/
            ResourceRec."Resource Group No." := "Salary Scale";
            ResourceRec.Insert;
            exit(true)
        end else
            exit(false);

    end;

    procedure CreateCustomer(): Boolean
    var
        CustRec: Record Customer;
        CashMgtSetup: Record "Cash Management Setup";
    begin
        if not CustRec.Get("No.") then begin
            CashMgtSetup.Get;
            CashMgtSetup.TestField("Imprest Posting Group");
            CustRec."No." := "No.";
            CustRec.Name := "First Name" + ' ' + "Middle Name" + ' ' + "Last Name";
            CustRec."Customer Posting Group" := CashMgtSetup."Imprest Posting Group";
            CustRec.Insert;
            exit(true)
        end else
            exit(false);
    end;

    local procedure ValidInteger(control: Text) valid: Boolean
    var
        NewStrings: Text;
    begin

        valid := true;
        if StrLen(control) = 1 then valid := false;
        NewStrings := DelChr(UpperCase(control), '=', '!@#$%^&*()_+|}{":;''?>><,./-\-~`ABCDEFGHIJKLMNOPQRSTUVWXYZ');
        if StrLen(NewStrings) <= 1 then valid := false;
        if NewStrings = '' then valid := false;
        if valid = false then Error('Please enter the correct value to proceed');

    end;

    local procedure ValidCharacters(control: Text) valid: Boolean
    var
        NewStrings: Text;
    begin

        valid := true;

        NewStrings := DelChr(UpperCase(control), '=', '!@#$%^&*()_+|}{":;''?>><,./-\-~`0123456789');
        if StrLen(NewStrings) <= 1 then valid := false;
        if NewStrings = '' then valid := false;

        if valid = false then Error('Please enter the correct value to proceed');

    end;

    local procedure ValidLength(control: Text; mLength: Integer) valid: Boolean
    var
        NewStrings: Text;
    begin

        valid := true;
        if StrLen(control) < mLength then valid := false;
        if valid = false then Error('Please enter the correct number of characters to proceed');

    end;

    procedure DuplicatePhoneExists() mCount: Integer
    var
        EmployeeRec: Record Employee;
    begin
        mCount := 0;

        EmployeeRec.Reset;
        EmployeeRec.SetRange(EmployeeRec."Phone No.", "Phone No.");
        if EmployeeRec.Find('-') then mCount := EmployeeRec.Count;
    end;

    procedure DuplicatePrimaryPhoneExists() mCount: Integer
    var
        EmployeeRec: Record Employee;
    begin
        mCount := 0;

        EmployeeRec.Reset;
        EmployeeRec.SetRange(EmployeeRec."Primary Telephone No.", "Primary Telephone No.");
        if EmployeeRec.Find('-') then mCount := EmployeeRec.Count;
    end;

    procedure DuplicatePINExists() mCount: Integer
    var
        EmployeeRec: Record Employee;
    begin
        mCount := 0;

        EmployeeRec.Reset;
        EmployeeRec.SetRange(EmployeeRec."P.I.N", "P.I.N");
        if EmployeeRec.Find('-') then mCount := EmployeeRec.Count;
    end;

    procedure DuplicateAccountExists() mCount: Integer
    var
        EmployeeRec: Record Employee;
    begin
        mCount := 0;

        EmployeeRec.Reset;
        EmployeeRec.SetRange(EmployeeRec."Bank Account No.", "Bank Account No.");
        if EmployeeRec.Find('-') then mCount := EmployeeRec.Count;
    end;

    procedure GetEmployeeBankDetails(EmployeeCode: Code[20]; var EmpBankDetails: array[2, 6] of Text[80])
    var
        Employee: Record Employee;
    begin
        //Primary
        if Employee.Get(EmployeeCode) then begin

            EmpBankDetails[1] [1] := Employee."Employee's Bank";
            EmpBankDetails[1] [2] := Employee."Bank Branch";
            EmpBankDetails[1] [3] := Employee."Bank Account Number";
            EmpBankDetails[1] [4] := Employee."Phone No.";
            // if Employee."E-Mail" <> '' then EmpBankDetails[1] [5] := Employee."E-Mail";

            //Secondary
            EmpBankDetails[2] [1] := Employee."Employee's Bank 2";
            EmpBankDetails[2] [2] := Employee."Bank Branch 2";
            EmpBankDetails[2] [3] := Employee."Bank Account No. 2";
            EmpBankDetails[2] [4] := Employee."Phone No.";
            // if Employee."E-Mail" <> '' then EmpBankDetails[2] [5] := Employee."E-Mail";

        end;
    end;


    var
        Dates: Codeunit "HR Dates";
        SalPointer: Record "Salary Pointers";
        Scale: Record "Salary Scales";
        DateInt: Integer;
        Earnings: Record EarningsX1;
        AssMatrix: Record "Assignment Matrix-X1";
        Ded: Record DeductionsX1;
        PayPeriod: Record "PR Payroll Periods";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Payroll: Record Employee;
        Jobs: Record "Company Jobs1";
        CareerEvent: Page "HR Career Event Option Box";
        CareerHistory: Record "HR Career History1";
        OK: Boolean;
        EmpLeaves: Record "Employee Leaves1";
        FiscalStart: Date;
        MaturityDate: Date;
        Entitlement: Decimal;
        EmpContracts: Record "Employee Contracts1";
        NoofMonthsWorked: Integer;
        Nextmonth: Date;
        EndDate: Date;
        ExitInterviewTemplate: Record "Exit Interview Template1";
        ExitInterviewLines: Record "Exit Interview Lines1";
        DimensionRec: Record "Dimension Value";
        SuccessionGap: Record "Succession Gaps1";
        JobReq: Record "Job Requirementx1";
        EmpQualification: Record "Employee Qualification";
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        SenderName: Text[50];
        SenderAddress: Text[80];
        Recipients: Text[80];
        Subject: Text[150];
        Body: Text[250];
        UserSetup: Record "User Setup";
        EmployeeContracts: Record "Employee Contracts1";
        LeaveTypes: Record "Leave Types1";
        EmpLeave: Record "Employee Leaves1";
        LeaveEarnedtoDate: Decimal;
        LeaveCode: Code[30];
        Employee: Record Employee;
        NoofMonthsToWork: Decimal;
        NextDate: Date;
        EndYearDate: Date;
        Answer: Boolean;
        HumanResSetup: Record "Human Resources Setup";
        AccPeriod: Record "Accounting Period";
        SalaryCard, PRSalaryCard : Record "PR Salary Card";
        EmployeeBank: Record "Employee Bank AccountX1";
        Text001: label 'Employee No %1 already exists in the customer table';
        Text002: label 'Employee No %1 has been created successfully added to the customer table';
        Text003: label 'Creating Imprest a/c for 1##2####################';
}

