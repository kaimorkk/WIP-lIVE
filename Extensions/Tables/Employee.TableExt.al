 
    #pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 52193668 "Employee" extends Employee
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Insertion (FieldClass) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Insertion (CalcFormula) on ""Job Title"(Field 6)".


        //Unsupported feature: Property Insertion (Editable) on ""Job Title"(Field 6)".

        modify(County)
        {
            Caption = 'County of Origin';
            TableRelation = County.Code;
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


        //Unsupported feature: Property Modification (Data type) on ""Phone No."(Field 13)".


        //Unsupported feature: Property Modification (Data type) on ""Mobile Phone No."(Field 14)".


        //Unsupported feature: Property Modification (Data type) on ""E-Mail"(Field 15)".

        modify(Gender)
        {
            OptionCaption = ' ,Female,Male,Others';

            //Unsupported feature: Property Modification (OptionString) on "Gender(Field 24)".

        }
        modify("Global Dimension 1 Code")
        {
            trigger OnAfterValidate()
            begin
                If UserRec.Get("User ID") then Begin
                    UserRec.Validate("Global Dimension 1 Code", "Global Dimension 1 Code");
                    UserRec.Modify(false);
                End;
            end;
        }
        modify("Global Dimension 2 Code")
        {
            trigger OnAfterValidate()
            begin
                If UserRec.Get("User ID") then Begin
                    UserRec.Validate("Shortcut Dimension 2 Code", "Global Dimension 2 Code");
                    UserRec.Modify(false);
                End;
            end;
        }

        //Unsupported feature: Property Modification (Data type) on ""Manager No."(Field 26)".

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

                    //EmpTrans.Amount := 40 / 100 * SalaryCard."Basic Pay";                    
                    EmpTrans."Payroll Period" := PayPeriod."Date Opened";
                    EmpTrans."Period Month" := PayPeriod."Period Month";
                    EmpTrans."Period Year" := PayPeriod."Period Year";
                    EmpTrans.Validate("Transaction Code");
                    if not EmpTrans.Insert(true) then
                        EmpTrans.Modify();

                    EmpTrans.Init();
                    EmpTrans."Employee Code" := "No.";
                    EmpTrans."Transaction Code" := PRsetup."Post-Retirement Medical";

                    //EmpTrans.Amount := 40 / 100 * SalaryCard."Basic Pay";                    
                    EmpTrans."Payroll Period" := PayPeriod."Date Opened";
                    EmpTrans."Period Month" := PayPeriod."Period Month";
                    EmpTrans."Period Year" := PayPeriod."Period Year";
                    EmpTrans.Validate("Transaction Code");
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

        //Unsupported feature: Property Modification (Name) on ""Grounds for Term. Code"(Field 35)".


        //Unsupported feature: Property Modification (Data type) on ""Company E-Mail"(Field 50)".


        //Unsupported feature: Property Modification (Data type) on "IBAN(Field 58)".


        //Unsupported feature: Property Modification (CalcFormula) on "Balance(Field 59)".


        //Unsupported feature: Property Modification (Data type) on ""Cost Center Code"(Field 1100)".


        //Unsupported feature: Code Insertion on ""Birth Date"(Field 20)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF "Birth Date" > TODAY THEN
         ERROR('Date of birth cannot be greater than today');


        Age:=Dates.DetermineAge("Birth Date",TODAY);
        "Age in Years":=(TODAY-"Birth Date")/365;
        */
        //end;


        //Unsupported feature: Code Insertion on ""Reason for termination Code"(Field 35)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
        /*
        IF GTermination.GET("Reason for termination Code") THEN
        "Reason for termination" := GTermination.Description;
        */
        //end;
        modify("Employment Date")
        {
            trigger OnAfterValidate()
            begin
                "Date Of Join" := Rec."Employment Date";

            end;
        }
        field(50000; "Payroll Number"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50001; Rank; Option)
        {
            OptionCaption = 'ADMIN';
            OptionMembers = ADMIN;
            DataClassification = CustomerContent;
        }
        field(50002; Branch; Code[20])
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
        field(50003; "Registration Code"; Code[10])
        {
            Caption = 'Registration Code';
            TableRelation = "Cause of Absence";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if CauseOfAbsence.Get("Registration Code") then
                    //Description := CauseOfAbsence.Description;

                    if "Registration Code" <> '' then begin
                        //VALIDATE("Unit of Measure Code",CauseOfAbsence."Unit of Measure Code");
                        // "Quantity (Base)":=1;
                        //VALIDATE("Quantity (Base)");
                    end;


                if "Registration Code" = 'D' then
                    Shift := Shift::DAY;
                if "Registration Code" = 'N' then
                    Shift := Shift::NIGHT;
                if "Registration Code" = 'RD' then
                    Shift := Shift::DAY;
                if "Registration Code" = 'RN' then
                    Shift := Shift::NIGHT;
                if "Registration Code" = 'POD' then
                    Shift := Shift::DAY;
                if "Registration Code" = 'PON' then
                    Shift := Shift::NIGHT;


                /*
               IF "Registration Code"='O' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
               IF "Registration Code"='L' THEN BEGIN
               Shift:=Shift::DAY;
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
               IF "Registration Code"='AB' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='P' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='UL' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               END;

               IF "Registration Code"='SB' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='SBH' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;


               IF "Registration Code"='SUP' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='T' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='SC' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='S' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='M' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='COD' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;

               IF "Registration Code"='CON' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;


               IF "Registration Code"='' THEN BEGIN
               Shift:=Shift::" ";
               "Customer No.":='';
               "Customer Name":='';
               "Contract No.":='';
               "Contract description":='';
               END;
                */

            end;
        }
        field(50004; Shift; Option)
        {
            OptionCaption = ' ,DAY,NIGHT';
            OptionMembers = " ",DAY,NIGHT;
            DataClassification = CustomerContent;
        }
        field(50005; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50006; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50007; DaysDeployed; Integer)
        {
            CalcFormula = count("Employee Absence" where("Employee No." = field("No."),
                                                          Comment = filter(true)));
            FieldClass = FlowField;
        }
        field(50008; Paypoint; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('PAYPOINT')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(50009; "Country Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('COUNTRY'));
        }
        field(50010; "Staffing Group"; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('STAFFINGGRP')));
            FieldClass = FlowField;
        }
        field(50011; Department; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('DEPARTMENT')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50012; "Department Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
        }
        field(50013; "Region Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('REGION'));
        }
        field(50014; "Projects Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('PROJECTS'));
        }
        field(50015; "Total Allowances"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false),
                                                                  "Normal Earnings" = const(true),
                                                                  "Pay Mode" = field("Pay Mode Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50016; "Total Deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = filter(Deduction | Loan),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50017; Payment; Code[10])
        {
            TableRelation = "Bracket Tablesx";
            DataClassification = CustomerContent;
        }
        field(50018; Deduction; Code[10])
        {
            TableRelation = "Assignment Matrix-X";
            DataClassification = CustomerContent;
        }
        field(50019; "Posting Group"; Code[20])
        {
            Caption = 'Employee Category';
            NotBlank = true;
            TableRelation = "PR Employee Posting Groups";
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                myInt: Integer;
                EmployeeBank: Record "PR Employee Posting Groups";
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(Code, "Posting Group");
                if EmployeeBank.FindSet() then begin
                    EmployeeBank.TestField("Retirement Age");
                    Rec."Employee Category Type" := EmployeeBank."Employee Category Type";
                end;

            end;
        }
        field(50020; "Total Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Type = const("Saving Scheme"),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Honoraria = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
            DataClassification = CustomerContent;
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank"));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch");
                if EmployeeBank.FindSet() then begin
                    "Bank Branch Name" := EmployeeBank."Branch Name";
                end;
            end;
        }
        field(50023; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX"."Starting Date";
        }
        field(50024; MobileBills; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E003'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50025; "Opening PAYE"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50026; "Tax Deductible to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Tax Deductible" = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50027; "SSF Employer to Date"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where("Tax Deductible" = const(true),
                                                                             "Employee No" = field("No."),
                                                                             "Payroll Period" = field(upperlimit("Pay Period Filter"))));
            FieldClass = FlowField;
        }
        field(50028; "Opening Employer SSF"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50029; "Cumm. Basic Pay"; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX"."Basic Pay" where("Payroll Period" = field("Pay Period Filter"),
                                                                          Employee = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50030; "Tax Relief Amount"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50031; "P.I.N"; Code[20])
        {
            DataClassification = CustomerContent;
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
            DataClassification = CustomerContent;
        }
        field(50033; "Cumm. PAYE"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Paye = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50034; "Cumm. Net Pay"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50037; "N.H.I.F No"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50038; "Hourly Rate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50039; "Daily Rate"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50040; "Pays N.H.I.F"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50041; "Last Modified By"; Code[20])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50042; "Gross Cash"; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E001'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50043; "Debtor Code"; Code[10])
        {
            TableRelation = Customer;
            DataClassification = CustomerContent;
        }
        field(50045; "Benefits-Non Cash"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
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
            DataClassification = CustomerContent;
        }
        field(50047; Housing; Option)
        {
            OptionMembers = Agricultural,Directors,Ordinary;
            DataClassification = CustomerContent;
        }
        field(50048; "Home Savings"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Deduction),
                                                                  "Tax Deductible" = const(true),
                                                                  Retirement = const(false)));
            FieldClass = FlowField;
        }
        field(50049; "Retirement Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Tax Deductible" = const(true),
                                                                  Retirement = const(true)));
            FieldClass = FlowField;
        }
        field(50050; "Home Ownership Status"; Option)
        {
            OptionMembers = "None","Owner Occupier","Home Savings";
            DataClassification = CustomerContent;
        }
        field(50051; "Owner Occupier"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Type = const(Payment),
                                                                  "Tax Deductible" = const(true)));
            FieldClass = FlowField;
        }
        field(50052; "National ID"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50053; "House Rent"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50054; "Employer Rent"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50055; "Total Quarters"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50056; "Cumulative Quarters"; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX".Quarters where(Employee = field("No."),
                                                                       "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50057; BfMpr; Decimal)
        {
            CalcFormula = sum("Employee Ledger EntryX".BfMpr where(Employee = field("No."),
                                                                    "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(50058; PensionNo; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50059; "Salary Scheme Category"; Code[20])
        {
            // TableRelation = Categoryx;
            DataClassification = CustomerContent;
        }
        field(50060; "Salary Steps"; Code[20])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*IF Employee.GET("No.") THEN
                IF Status=Employee.Status::Active THEN
                BEGIN
                // populate the basic salary based on the steps
                IF SalaryStep.GET("Salary Steps",SalaryStep.Level::"Level 1","Salary Scheme Category") THEN BEGIN
                 "Basic Pay":=SalaryStep."Basic amount";
                "Gross pay":=SalaryStep."Gross pay";
                END;
                // Get first open pay period
                PayPeriod.RESET;
                PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                IF PayPeriod.FIND('-') THEN
                CurrentMonth:=PayPeriod."Starting Date";
                //House all
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."House allowance";
                  AssMatrix.MODIFY;
                END; */
                /*
                //std allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Standard overtime";
                  AssMatrix.MODIFY;
                END;
                //duty allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Duty allowance";
                  AssMatrix.MODIFY;
                END;
                //personal allow
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Personal allowance";
                  AssMatrix.MODIFY;
                END;
                // performance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                  AssMatrix.MODIFY;
                END;
                //Standard Allowance
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Std Allowance";
                  AssMatrix.MODIFY;
                END;
                // Dog handler
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                  AssMatrix.MODIFY;
                END;
                
                // Public holiday
                IF AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                  AssMatrix.MODIFY;
                END;
                
                // Insert
                
                //House all
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."House All. Code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."House All. Code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."House All. Code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."House allowance";
                  IF AssMatrix.Amount<>0 THEN
                    AssMatrix.INSERT;
                END;
                //std allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Standard Overtime code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Standard Overtime code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Standard Overtime code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Standard overtime";
                 IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                //duty allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Duty Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Duty Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Duty Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Duty allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                END;
                //personal allow
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Personal Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Personal Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Personal Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Personal allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                //Standard allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Std Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Std Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Personal Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Std Allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                // Dog handler
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Dog handlers allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Dog handlers allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Dog handlers allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix."Department Code":="Department Code";
                  AssMatrix.Amount:=SalaryStep."Dog handlers allowance";
                  IF AssMatrix.Amount<>0 THEN
                  AssMatrix.INSERT;
                END;
                
                // performance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Performance Allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Performance Allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Performance Allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix.Amount:=SalaryStep."Perfomance allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                END;
                
                // Public holiday allowance
                IF NOT AssMatrix.GET("No.",AssMatrix.Type::Payment,SalaryStep."Public holiday allowance code",CurrentMonth,"Department Code") THEN
                BEGIN
                  //find earnings
                  IF Earn.GET(SalaryStep."Public holiday allowance code") THEN BEGIN
                   AssMatrix.Code:=Earn.Code;
                   AssMatrix.Description:=Earn.Description;
                   AssMatrix.Taxable:=Earn.Taxable;
                   IF Earn."Pay Type"=Earn."Pay Type"::Recurring THEN
                   AssMatrix."Next Period Entry":=TRUE
                   ELSE
                   AssMatrix."Next Period Entry":=FALSE;
                  END;
                  AssMatrix."Employee No":="No.";
                  AssMatrix.Type:=AssMatrix.Type::Payment;
                  AssMatrix.Code:=SalaryStep."Public holiday allowance code";
                  AssMatrix."Payroll Period":=CurrentMonth;
                  AssMatrix.Amount:=SalaryStep."Public holiday allowance";
                  IF AssMatrix.Amount<>0 THEN
                   AssMatrix.INSERT;
                
                
                END;
                END ELSE
                ERROR('Employee not active');  */

            end;
        }
        field(50061; Level; Option)
        {
            OptionMembers = "Level 1","Level 2";
            DataClassification = CustomerContent;
        }
        field(50065; "Share Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Shares = const(true)));
            Caption = 'coop skg fund';
            FieldClass = FlowField;
        }
        field(50066; TRelief; Decimal)
        {
            CalcFormula = lookup("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                     Closed = const(false),
                                                                     Code = const('E002'),
                                                                     "Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(50067; Overtime; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50068; Absence; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50069; "Other allowances"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50070; "Total earnings"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50071; PAYE; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50072; NHIF; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50073; NSSF; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(50074; Advance; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Code = field("Advance Code Filter")));
            FieldClass = FlowField;
        }
        field(50075; Loans; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50076; COOP; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50077; "Other deductions"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Paye = const(false)));
            FieldClass = FlowField;
        }
        field(50079; "Net pay"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50080; "Advance Code Filter"; Code[10])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX.Code;
        }
        field(50081; "Gross pay"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50082; interest; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Interest Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             Type = filter(Deduction)));
            FieldClass = FlowField;
        }
        field(50083; "Working Hours"; Decimal)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Hourly Rate" := "Daily Rate" / "Working Hours";
            end;
        }
        field(50084; "No. Of Days Worked"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50085; "No. of Hours"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50086; "No. Of Hours Weekend"; Decimal)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50087; Basic; Decimal)
        {
            CalcFormula = sum("PR Period Transactions".Amount where(
                                                                  "Employee Code" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Transaction Code" = const('BPAY')));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50088; ECode; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50089; SKey; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50090; Employer; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50091; "Taxable Income"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  Taxable = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50092; "Job ID"; Code[20])
        {
            TableRelation = Positions;
            DataClassification = CustomerContent;
        }
        field(50094; "Home Phone Number"; Text[15])
        {
            DataClassification = CustomerContent;
        }
        field(50095; "Cellular Phone Number"; Text[15])
        {
            DataClassification = CustomerContent;
        }
        field(50096; "Work Phone Number"; Text[15])
        {
            DataClassification = CustomerContent;
        }
        field(50097; "Ext."; Text[7])
        {
            DataClassification = CustomerContent;
        }
        field(50098; "ID Number"; Text[30])
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if DuplicateIDNumberExists > 1 then
                    Error('The ID Number Exists');
            end;
        }
        field(50099; Gender1; Option)
        {
            OptionMembers = Female,Male;
            DataClassification = CustomerContent;
        }
        field(50100; "Fax Number"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50104; "Known As"; Text[30])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*IF (("Known As" <> xRec."Known As") AND  (xRec."Known As" <> ''))  THEN BEGIN
                       CareerEvent.SetMessage('Changing First Name in Career History');
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
                
                           CareerHistory.Reason := CareerEvent.ReturnReason;
                           CareerHistory."Employee No.":= "No.";
                           CareerHistory."Date Of Event":= WORKDATE;
                           CareerHistory."Career Event":= 'Surname Changed';
                           CareerHistory."Last Name":= "Last Name";
                           CareerHistory."Employee First Name":= "Known As";
                           CareerHistory."Employee Last Name":= "Last Name";
                
                           CareerHistory.INSERT;
                        END;
                    END;
                  */

            end;
        }
        field(50105; Position; Code[20])
        {
            TableRelation = "Company Positions"."Position ID";
            DataClassification = CustomerContent;

            trigger OnValidate()
            var
                DesG: Record "Designation Groups";
                PosG: Record "Company Positions";
            begin
                /*IF Jobs.GET(Position) THEN
                    "Job Title":=Jobs."Job Description";
                
                
                    IF ((Position <> xRec.Position) AND (xRec.Position <> '')) THEN BEGIN
                        Jobs.RESET;
                        Jobs.SETRANGE(Jobs."Job ID",Position);
                        IF Jobs.FIND('-') THEN BEGIN
                        "Job Title":=Jobs."Job Description";
                
                            Payroll.RESET;
                            Payroll.SETRANGE(Payroll."No.","No.");
                            IF Payroll.FIND('-') THEN BEGIN
                                Payroll."Salary Scheme Category":=Jobs.Category;
                                Payroll."Salary Steps":=Jobs.Grade;
                                Payroll.VALIDATE(Payroll."Salary Steps");
                                Payroll.MODIFY;
                            END
                        END;
                */

                /*

                  CareerEvent.SetMessage('Job Title Changed');
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
                      CareerHistory."Date Of Event":= WORKDATE;
                      CareerHistory."Career Event":= 'Job Title Changed';
                      CareerHistory."Job Title":= "Job Title";
                      CareerHistory."Employee First Name":= "Known As";
                      CareerHistory."Employee Last Name":= "Last Name";
                      CareerHistory.INSERT;
                   END;
                  */

                // END;

            end;
        }
        field(50106; "Full / Part Time"; Option)
        {
            OptionMembers = "Full Time"," Part Time";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*IF ("Full / Part Time" <> xRec."Full / Part Time") THEN BEGIN
                   CareerEvent.SetMessage('Full / Part Time Changed');
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
                       CareerHistory."Date Of Event":= WORKDATE;
                       CareerHistory."Career Event":= 'Full / Part Time Changed';
                       CareerHistory."Full/Part Time":= "Full / Part Time";
                       CareerHistory."Employee First Name":= "Known As";
                       CareerHistory."Employee Last Name":= "Last Name";
                       CareerHistory.INSERT;
                    END;
                END;
               */

            end;
        }
        field(50107; "Contract Type"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50108; "Contract End Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50109; "Notice Period"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50110; "Marital Status"; Option)
        {
            OptionMembers = " ",Single,Married,Separated,Divorced,"Widow(er)",Other;
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /* IF ("Marital Status" <> xRec."Marital Status") THEN BEGIN
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
                        CareerHistory."Date Of Event":= WORKDATE;
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
        field(50111; "Ethnic Origin"; Text[50])
        {
            DataClassification = CustomerContent;
            // TableRelation = "Ethnic Background"."Ethnic group";
            TableRelation = "Ethnic Group";

        }
        field(50112; "First Language (R/W/S)"; Code[10])
        {
            TableRelation = "ManPower Planning Lines";
            DataClassification = CustomerContent;
        }
        field(50113; "Driving Licence"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50114; "Date Of Birth"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                IF "Date Of Birth" > TODAY THEN
                    ERROR('Date of birth cannot be greater than today');
                if ("Date Of Birth" <> 0D) and (TODAY - "Date Of Birth" < 18) THEN ERROR('An employee cannnot be younger than 18 years');

                Age := Dates.DetermineAge("Date Of Birth", TODAY);
                "Age in Years" := (TODAY - "Date Of Birth") / 365;
            end;
        }
        field(50115; Age; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(50116; "Date Of Join"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*HumanResSetup.GET;               
                DateInt:=DATE2DMY("Date Of Join",1);
                "Pro-Rata on Joining":=HumanResSetup."No. Of Days in Month"-DateInt+1;

                */
                "Employment Date" := "Date Of Join";

            end;
        }
        field(50117; "Length Of Service"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(50118; "End Of Probation Date"; Date)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                if "End Of Probation Date" <> 0D then
                    Validate("Increment Date", "End Of Probation Date");
            end;
        }
        field(50119; "Pension Scheme Join"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                if ("Date Of Leaving" <> 0D) and ("Pension Scheme Join" <> 0D) then
                    "Time Pension Scheme" := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
            end;
        }
        field(50120; "Time Pension Scheme"; Text[70])
        {
            DataClassification = CustomerContent;
        }
        field(50121; "Medical Scheme Join"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*  IF  ("Date Of Leaving" <> 0D) AND ("Medical Scheme Join" <> 0D) THEN
                   "Time Medical Scheme":= Dates.DetermineAge("Medical Scheme Join","Date Of Leaving");
                */

            end;
        }
        field(50122; "Time Medical Scheme"; Text[70])
        {
            DataClassification = CustomerContent;
            //This property is currently not supported
            //TestTableRelation = true;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = true;
        }
        field(50123; "Date Of Leaving"; Date)
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*  IF ("Date Of Join" <> 0D) AND ("Date Of Leaving" <> 0D) THEN
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


                 IF ("Date Of Leaving" <> 0D) AND ("Date Of Leaving" <> xRec."Date Of Leaving") THEN BEGIN
                    CareerEvent.SetMessage('Left The Company');
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
                        CareerHistory."Date Of Event":= "Date Of Leaving";
                        CareerHistory."Career Event":= 'Left The Company';
                        CareerHistory."Employee First Name":= "Known As";
                        CareerHistory."Employee Last Name":= "Last Name";

                        CareerHistory.INSERT;
                     END;
                 END;
               */

            end;
        }
        field(50124; "Second Language (R/W/S)"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50125; "Additional Language"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50126; "Termination Category"; Option)
        {
            OptionMembers = " ",Resignation,"Non-Renewal Of Contract",Dismissal,Retirement,Death,Other;
            DataClassification = CustomerContent;

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
        field(50127; "Department:"; Code[30])
        {
            TableRelation = "Dimension Value".Code where("Dimension Code" = const('DEPARTMENT'));
            DataClassification = CustomerContent;
        }
        field(50129; Citizenship; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(50130; "Passport Number"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(50137; "PIN Number"; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50138; "NSSF No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50139; "NHIF No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(50142; "HELB No"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50143; "Co-Operative No"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50144; "Position To Succeed"; Code[20])
        {
            TableRelation = "ManPower Planning Lines"."Entry No";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                /*SuccessionGap.RESET;
                SuccessionGap.SETRANGE(SuccessionGap."Employee No","No.");
                IF SuccessionGap.FIND('-') THEN
                SuccessionGap.DELETEALL;
                
                JobReq.RESET;
                JobReq.SETRANGE(JobReq."Job Id","Position To Succeed");
                IF JobReq.FIND('-') THEN
                BEGIN
                REPEAT
                IF NOT EmpQualification.GET("No.",JobReq."Qualification Code") THEN
                BEGIN
                SuccessionGap.INIT;
                SuccessionGap."Employee No":="No.";
                SuccessionGap."Job Id":=JobReq."Job Id";
                SuccessionGap."Qualification Type":=JobReq."Qualification Type";
                SuccessionGap."Qualification Code":=JobReq."Qualification Code";
                SuccessionGap.Qualification:=JobReq.Qualification;
                SuccessionGap.Priority:=JobReq.Priority;
                SuccessionGap.INSERT;
                END;
                UNTIL JobReq.NEXT = 0;
                END;
                */

            end;
        }
        field(50145; "Succesion Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50146; "Send Alert to"; Code[80])
        {
            DataClassification = CustomerContent;
        }
        field(50147; Religion; Code[20])
        {
            // TableRelation = Religions.Name;
            DataClassification = CustomerContent;
        }
        field(50149; "Served Notice Period"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50150; "Exit Interview Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50151; "Exit Interview Done by"; Code[100])
        {
            TableRelation = "User Setup";
            DataClassification = CustomerContent;
        }
        field(50152; "Allow Re-Employment In Future"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50153; "Postal Address"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(50154; "Residential Address"; Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(50155; "Postal Address2"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50156; "Postal Address3"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(50157; "Residential Address2"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50158; "Residential Address3"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(50159; "Post Code2"; Code[20])
        {
            TableRelation = "Post Code";
            DataClassification = CustomerContent;
        }
        field(50160; "Incremental Month"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(50161; "Current Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50162; Present; Code[30])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field("Salary Scale"));
            DataClassification = CustomerContent;
            Caption = 'Salary Notch';
            //Editable = Rec."Freeze Basic Pay"= false;


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
                if Rec."Freeze Basic Pay" then begin
                    Message('Salary has been frozen for this employee');
                    Rec.Present := xRec.Present;

                end else begin

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
                                EmpEarnings."Payroll Period" := Begindate;
                                if PayPeriod.Get(Begindate) then begin
                                    EmpEarnings."Period Month" := PayPeriod."Period Month";
                                    EmpEarnings."Period Year" := PayPeriod."Period Year";
                                end;
                                EmpEarnings."Payroll Period" := PRPayrollPeriods."Date Opened";
                                EmpEarnings.Validate("Transaction Code");
                                if ScaleBenefits."Based On" = ScaleBenefits."Based On"::Amount then
                                    EmpEarnings.Amount := ScaleBenefits.Amount
                                else begin
                                    ScaleBenefits.TestField(Percentage);
                                    EmpEarnings.Amount := ScaleBenefits.Percentage / 100 * GrossPay;
                                end;

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
            end;
        }
        field(50163; Previous; Code[30])
        {
            Editable = false;
            TableRelation = "Salary Pointers"."Salary Pointer";
            DataClassification = CustomerContent;

        }
        field(50164; Halt; Code[30])
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(50165; "Salary Scale"; Code[30])
        {
            // f("Posting Group" = filter('CASUAL')) "Resource Price"."Work Type Code" where(Code = filter('CASUAL'))
            // else
            // "Salary Scales".Scale;
            TableRelation = "Salary Scales".Scale;
            DataClassification = CustomerContent;
            Caption = 'Salary Grade';

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
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Deduction),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Insurance Code" = const(true)));
            FieldClass = FlowField;
        }
        field(50167; "days worked"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50168; "Pro-Rata on Joining"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50169; "Pro-rata on Leaving"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50170; "Date OfJoining Payroll"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(50171; "PAYE Diff"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(50172; "Pro-Rata Calculated"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50173; "Half Pay"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50174; "Basic Arrears"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Basic Pay Arrears" = const(true)));
            FieldClass = FlowField;
        }
        field(50175; "Relief Amount"; Decimal)
        {
            CalcFormula = - sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                   "Payroll Period" = field("Pay Period Filter"),
                                                                   "Non-Cash Benefit" = const(true),
                                                                   Type = const(Payment),
                                                                   "Tax Deductible" = const(true),
                                                                   "Tax Relief" = const(false)));
            FieldClass = FlowField;
        }
        field(50176; "Employee Qty"; Integer)
        {
            CalcFormula = count(Employee);
            FieldClass = FlowField;
        }
        field(50177; "Employee Act. Qty"; Integer)
        {
            CalcFormula = count(Employee where(Status = const(Active)));
            FieldClass = FlowField;
        }
        field(50178; "Employee Arc. Qty"; Integer)
        {
            CalcFormula = count(Employee where(Status = filter(Inactive | Terminated)));
            FieldClass = FlowField;
        }
        field(50179; "Other Language Read"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50180; "Other Language Write"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50181; "Other Language Speak"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(50182; "Employee Job Type"; Option)
        {
            OptionCaption = '  ,Driver';
            OptionMembers = "  ",Driver;
            DataClassification = CustomerContent;
        }
        field(50183; cumul; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(50184; Country; Code[20])
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
        field(50185; Region; Code[20])
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
        field(50186; Projects; Code[20])
        {
            CalcFormula = lookup("Default Dimension"."Dimension Value Code" where("Table ID" = const(5200),
                                                                                   "No." = field("No."),
                                                                                   "Dimension Code" = const('PROJECTS')));
            FieldClass = FlowField;

            trigger OnLookup()
            begin
                CalcFields(Branch);
            end;
        }
        field(69000; "Pays SSF?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69001; "Pays tax?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69002; "Section/Location"; Code[10])
        {
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                // IF SalaryGrade.GET("Salary Grade") THEN
                // "Basic Pay":=SalaryGrade."Minimum salary";
                // MaximumPay:=SalaryGrade."Maximum Salary";
            end;
        }
        field(69003; "Basic Pay"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(69004; "Salary Type"; Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(69005; "Paid Overtime?"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69006; "Tax Relief"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69007; "Overtime taxed"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69008; "Agency Car"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69009; "Housed by Employer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69010; "Employee's Bank"; Code[80])
        {
            TableRelation = "Employee Bank AccountX";
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank");
                if EmployeeBank.FindSet() then begin
                    "Bank Name" := EmployeeBank."Bank Name";
                    "Bank Branch Name" := EmployeeBank."Branch Name";
                    "Bank Branch" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(69011; "Paying Bank Code"; Code[10])
        {
            TableRelation = "Bank Account";
            DataClassification = CustomerContent;
        }
        field(69012; "Taxable Allowance"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Taxable = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69013; "Tax Deductible Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Tax Deductible" = const(true),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "Non-Cash Benefit" = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69014; "Employee Type"; Option)
        {
            OptionCaption = 'Primary Employee,Secondary Employee';
            OptionMembers = Primary,Secondary;
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
        field(69016; "Bank Name"; Text[80])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank"),
                                                                             "Bank Branch No." = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69017; "Bank Branch Name"; Text[80])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch"),
                                                                               Code = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69019; "Terminal Dues"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69020; "Normal Working Days"; Integer)
        {
            CalcFormula = count("Employee Absence" where("Cause of Absence Code" = filter('D' | 'N' | 'RD' | 'RN' | 'T' | 'SUP' | 'SB' | 'IND' | 'U'),
                                                          Comment = const(true),
                                                          "Employee No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69021; "Public Holiday Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69022; "Absent Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69023; "Pay Wages"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69024; "Payroll Group"; Option)
        {
            CalcFormula = lookup("Employee Posting GroupX"."Payroll Group" where(Code = field("Posting Group")));
            Editable = false;
            FieldClass = FlowField;
            OptionCaption = ' ,Guards,Admin,Management';
            OptionMembers = " ",Guards,Admin,Management;
        }
        field(69025; "Payroll Period"; Date)
        {
            TableRelation = "Payroll PeriodX"."Starting Date";
            DataClassification = CustomerContent;
        }
        field(69026; "Exempt Job Book OT/LD"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69027; "Night Allowance Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69028; "Unpaid Leave Days"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69029; "Total Statutory"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where("Employee No" = field("No."),
                                                                  Type = const(Deduction),
                                                                  Description = filter('PAYE' | 'NHIF' | 'NSSF'),
                                                                  "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(69030; "Send Payslip By E-mail?"; Boolean)
        {
            DataClassification = CustomerContent;
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
        field(69048; "Basic Salary"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(Basic)));
            FieldClass = FlowField;
        }
        field(69049; Classification; Code[20])
        {
            DataClassification = CustomerContent;
            // TableRelation = Table0;
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
        field(69052; "Directors Fees"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(DirectorsFees)));
            FieldClass = FlowField;
        }
        field(69053; "Lump Sum"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(LumpSum)));
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
        field(69055; "Non Cash Benefit"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(NonCashBenefit)));
            FieldClass = FlowField;
        }
        field(69056; MPR; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(MPR)));
            FieldClass = FlowField;
        }
        field(69057; "Insurance Relief"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where(Type = const(Payment),
                                                                  "Employee No" = field("No."),
                                                                  "Payroll Period" = field("Pay Period Filter"),
                                                                  "KRA Classification" = const(InsuranceRelief)));
            FieldClass = FlowField;
        }
        field(69058; "Days Worked per week"; Integer)
        {
            Editable = false;
            DataClassification = CustomerContent;
        }
        field(69059; "Total Leave Days"; Integer)
        {
            CalcFormula = sum("Employee Leaves"."No. Of Days" where("Employee No" = field("No."),
                                                                     "Posting  Date" = field("Date Filter"),
                                                                     "Leave Code" = filter('ANNUAL' | 'MATERNITY' | 'PATENITY' | 'STUDY' | 'TIMEOFF'),
                                                                     Posted = const(true)));
            FieldClass = FlowField;
        }
        field(69060; "Annual Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Annual),
                                                                             "Staff No." = field("No."),
                                                                             Closed = const(false)));
            FieldClass = FlowField;
        }
        field(69061; "Compassionate Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Compassionate),
                                                                             "Staff No." = field("No.")));
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
        field(69064; "Study Leave Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Study Leave"),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69065; "Unpaid Leave"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Unpaid Leave"),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(69066; "Sick Leave"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const("Sick Leave"),
                                                                             "Staff No." = field("No.")));
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
        field(69069; "Leave Status"; Option)
        {
            OptionCaption = ' ,On Leave,Resumed';
            OptionMembers = " ","On Leave",Resumed;
            DataClassification = CustomerContent;
        }
        field(69070; "User ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;

            //This property is currently not supported
            //TestTableRelation = false;

            // trigger OnLookup()
            // begin
            //     UserMgt.LookupUserID("User ID");
            // end;

            // trigger OnValidate()
            // begin
            //     UserMgt.ValidateUserID("User ID");
            // end;
        }
        field(69071; "Leave Type Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Types".Code;
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
        field(69073; "End of Contract Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(69074; "Leave Period Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "HR Leave Periods".code where(Closed = const(false));
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
        field(69083; "Cash - Leave Earned"; Decimal)
        {
            DecimalPlaces = 2 : 2;
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
        field(69085; "Cash per Leave Day"; Decimal)
        {
            DecimalPlaces = 2 : 2;
            DataClassification = CustomerContent;
        }
        field(69086; "Leave Balance"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(69087; "Leave Outstanding Bal"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             Closed = filter(false),
                                                                             "Posting Date" = field("Date Filter"),
                                                                             "Leave Type" = const('ANNUAL')));
            FieldClass = FlowField;
        }
        field(69088; "Acrued Leave Days"; Integer)
        {
            FieldClass = Normal;
            DataClassification = CustomerContent;
        }
        field(69089; "On Leave"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(69090; "Total Gratuity Amount"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Gratuity Amount" where("Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter"),
                                                                             "Basic Salary Code" = const(true)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69091; "Research Center"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Research Center" where("Research Center?" = const(true));
        }
        field(69600; "Current Position ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Company Positions"."Position ID";
            trigger OnValidate()
            var
                JobId: record "Company Positions";
                DesG: Record "Designation Groups";
            begin
                if JobId.get("Current Position ID") then begin
                    "Job Title2" := JobId."Job Title";
                    Validate("Job Cadre", JobId."Cadre Type");
                    Validate("Designation Group", JobId."Designation Group");
                end;
                //"End Of Probation Date" := Today;
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
                if DutyStation."Hardship Area" and (("Employee Category Type" = "Employee Category Type"::"Judicial Officer") or ("Employee Category Type" = "Employee Category Type"::"Judicial Staff")) then begin
                    EmpEarnings.Init();
                    EmpEarnings."Employee Code" := "No.";
                    EmpEarnings."Transaction Code" := PayrollSetup."Hardship Allowance Code";

                    //EmpEarnings.Amount := 40 / 100 * SalaryCard."Basic Pay";                    
                    EmpEarnings."Payroll Period" := Begindate;
                    EmpEarnings."Period Month" := PayPeriod."Period Month";
                    EmpEarnings."Period Year" := PayPeriod."Period Year";
                    EmpEarnings.Validate("Transaction Code");

                    // EmpEarnings.Insert();
                    if not EmpEarnings.Insert(true) then
                        EmpEarnings.Modify();
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
        field(69602; "Current Job Grade"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Salary Scales";
        }
        field(69603; "Current Terms of Service"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Terms of Service";
        }
        field(69604; "Nationality Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Country/Region";
        }
        field(69605; "Disability Code"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Disability Code";
        }
        field(69606; "Specialization Area"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Domain Area";
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
        field(69613; "Sec Emergency Contact Person"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = Relative;
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
        field(69627; "Off Days Acc."; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Off),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(70000; "Overtime1.5"; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Hours 1.5" where("Employee No" = field("No."),
                                                                          Code = const('E007'),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70001; "Overtime2.0"; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Hours 2.0" where("Employee No" = field("No."),
                                                                          Code = const('E009'),
                                                                          "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
        }
        field(70003; Leave; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X"."Leave Days" where("Employee No" = field("No."),
                                                                           Closed = filter(false),
                                                                           Code = const('E008')));
            FieldClass = FlowField;
        }
        field(70004; LostDays; Integer)
        {
            CalcFormula = lookup("Assignment Matrix-X".Lostdays where("Employee No" = field("No."),
                                                                       Closed = filter(false),
                                                                       Code = const('E014')));
            FieldClass = FlowField;
        }
        field(70005; "Emp F L"; Text[20])
        {
            DataClassification = CustomerContent;
        }
        field(70006; "Payroll Pay Mode"; Code[20])
        {
            TableRelation = "Payroll Pay Mode";
            DataClassification = CustomerContent;
        }
        field(70007; "Pay Mode Filter"; Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Pay Mode";
        }
        field(70008; "Department Name"; Code[70])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70009; "Employement Terms"; Option)
        {
            OptionMembers = Contract,"Permenanent and Pensionable",Seconded;
            DataClassification = CustomerContent;
        }
        field(70010; Position1; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(70011; HOD; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70012; HR; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70013; "Medical Scheme Join Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70014; "Department Code"; Code[30])
        {
            Caption = 'Department Code';
            DataClassification = CustomerContent;
            //  TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Department/Center"),
             "Direct Reports To" = field("Directorate Code"));
        }
        field(70015; "Claim Limit"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70016; "Reason for termination"; Enum "Exit Reasons")
        {
            DataClassification = CustomerContent;
        }
        field(70017; "Exit Interview Conducted"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Yes,No';
            OptionMembers = " ",Yes,No;
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
        field(70019; Division; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Court Station';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Court Stations"));
            //  TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(70020; "Date Joined DC"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70021; "Date Joined DB"; Date)
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
        field(70023; "Job No"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = Job."No.";
        }
        field(70024; "Job Task No"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));
        }
        field(70025; Disabled; Boolean)
        {
            DataClassification = CustomerContent;
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
            trigger OnValidate()
            begin
                if "Disability No." = '' then
                    "Disability Cert Expiry" := 0D;
            end;

        }
        field(70028; "Regional Manager"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70029; "Employee's Bank 2"; Code[80])
        {
            DataClassification = CustomerContent;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank 2");
                if EmployeeBank.FindSet() then begin
                    "Bank Name 2" := EmployeeBank."Bank Name";
                    // "Bank Branch Name 2" := EmployeeBank."Branch Name";
                    // "Bank Branch 2" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(70030; "Bank Branch 2"; Code[100])
        {
            DataClassification = CustomerContent;
            TableRelation = "Employee Bank AccountX"."Bank Branch No." where(Code = field("Employee's Bank 2"));

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank.Code, "Employee's Bank 2");
                EmployeeBank.SetRange(EmployeeBank."Bank Branch No.", "Bank Branch 2");
                if EmployeeBank.FindSet() then begin
                    "Bank Branch Name 2" := EmployeeBank."Branch Name";
                end;
            end;
        }
        field(70031; "Bank Account No. 2"; Text[30])
        {
            Caption = 'Bank Account No.';
            DataClassification = CustomerContent;
        }
        field(70032; "Bank Name 2"; Text[80])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Bank Name" where(Code = field("Employee's Bank 2"),
                                                                             "Bank Branch No." = field("Bank Branch 2")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70033; "Bank Branch Name 2"; Text[80])
        {
            CalcFormula = lookup("Employee Bank AccountX"."Branch Name" where("Bank Branch No." = field("Bank Branch 2"),
                                                                               Code = field("Employee's Bank 2")));
            Editable = false;
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
        field(70036; "Retirement Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70037; "Disciplinary status"; Code[30])
        {
            CalcFormula = max("HR Disciplinary Cases"."Disciplinary status" where("Employee No" = field("No.")));
            FieldClass = FlowField;
        }
        field(70038; "ICT Help Desk Admin"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70039; "Sports Leave Acc"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Leave Posting Type" = const("Sports Leave")));
            FieldClass = FlowField;
        }
        field(70040; "Unpaid Leave Acc"; Decimal)
        {
            DataClassification = CustomerContent;
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
        field(70043; CEO; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70044; "Allow Negative Leave"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70045; "Special Pension"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        // field(70046; "Currency Code"; Code[10])
        // {
        //     Caption = 'Currency Code';
        //     DataClassification = CustomerContent;
        //     TableRelation = Currency;

        //     trigger OnValidate()
        //     begin
        //         //UpdateCurrencyId;
        //     end;
        // }
        field(70047; "Terminal Leave"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Staff No." = field("No."),
                                                                             "Leave Posting Type" = const("Terminal Leave")));
            FieldClass = FlowField;
        }
        field(70048; "Actual Contribution"; Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where(Type = const(Deduction),
                                                                             "Employee No" = field("No."),
                                                                             "Payroll Period" = field("Pay Period Filter")));
            FieldClass = FlowField;
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
        field(70054; "Off Days"; Integer)
        {
            CalcFormula = sum("HR Leave Ledger Entries"."No. of days1" where("Leave Posting Type" = const(Off),
                                                                             "Staff No." = field("No.")));
            FieldClass = FlowField;
        }
        field(70055; "Age in Years"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70056; HODIR; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70057; "Record Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = 'Employee,Intern,Management Trainee';
            OptionMembers = Employee,Intern,"Management Trainee";
        }
        field(70058; "County of Residence"; Code[10])
        {
            DataClassification = CustomerContent;
            TableRelation = County.Code;

            trigger OnValidate()
            begin
                if Countys.Get("County of Residence") then begin

                    "County of Residence Name" := Countys.Description;
                end;
            end;
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
        field(70062; "Previous  Terms of Service"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Terms of Service";
        }
        field(70063; "Responsibility Center"; Code[30])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const(" "));
            DataClassification = CustomerContent;
        }
        field(70064; "Job Title2"; Text[250])
        {
            Caption = 'Designation';
            DataClassification = CustomerContent;
        }
        field(70065; "Court Levels"; Code[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Court Levels';
            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Court Levels"));
        }
        field(70066; "On Suspension"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70067; "On Interdiction"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70068; "Previous Payment System"; Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70069; "Period Year Filter"; Integer)
        {
            FieldClass = FlowFilter;
        }

        field(70070; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods";
        }
        field(70072; "Full Name"; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70073; "Employees Type"; Option)
        {
            OptionCaption = ' ,Permanent,Casual,Part Time,Interns,Contract,UnPaidLeave,Seconded';
            OptionMembers = " ",Permanent,Casual,"Part Time",Interns,Contract,UnPaidLeave,Seconded;
            DataClassification = CustomerContent;
        }
        field(70074; "Employee Contract Type"; Option)
        {
            OptionMembers = "","Permanent and Pensionable","Contract","Probation","Casual","Intern","Seconded";
            DataClassification = CustomerContent;
        }
        field(70075; "On Probation"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70076; "Payment Mode"; Option)
        {
            OptionMembers = "Bank","Sacco";
            DataClassification = CustomerContent;
        }
        field(70077; Inducted; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70078; "Pr Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
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
        field(70083; "Due for Retirement"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70084; "Bonding Amount"; Decimal)
        {
            FieldClass = Flowfield;
            // CalcFormula = sum("Training Participants"."Bond Penalty" where("Employee Code" = field("No."), "Bond End Date" = field("Date Filter")));
        }
        field(70085; "Employee Status 2"; Option)
        {
            caption = 'Employee Status';
            DataClassification = CustomerContent;
            OptionMembers = " ",Suspension,Interdiction,Absence,"Leave of Absence",Dismissal,Resignation,"Contract Expiry","In Service",Retirement,"Retire Mandatory",Death,"Stoppage of Salary",Termination,Probation;
        }
        field(70086; "Is Chief Justice"; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            var
                Emp: Record Employee;
                ErrorExists: Label 'Employee %1 is already set as the Chief Justice, deselect the employee and select another';
            begin
                if "Is Chief Justice" then begin
                    Emp.Reset;
                    Emp.SetRange("Is Chief Justice", true);
                    if Emp.FindFirst() then
                        Error(ErrorExists, Emp."No." + ' ' + Emp.FullName());
                end;


            end;

        }
        field(70087; "Is Part Of Disciplinary Team"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70088; "Head of Station"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70089; "2nd Supervisor"; Code[50])
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
        field(70090; "Org Unit"; Code[50])
        {
            DataClassification = CustomerContent;

            TableRelation = "Responsibility Center" where("Operating Unit Type" = const("Org Unit"));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                RespC.Reset;
                RespC.SetRange(Code, "Org Unit");
                RespC.SetRange("Operating Unit Type", RespC."Operating Unit Type"::"Org Unit");
                if RespC.find('-') then begin
                    "Organisation Unit Name" := RespC.Name;

                end;

            end;
        }
        field(70091; "Organisation Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;



        }
        field(70092; "Implementing Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70093; "Employee Category Type"; Option)
        {
            OptionCaption = '"...",Attachee,Casual,Intern,Judge,Judicial Officer,Judicial Staff,Pupillage,Temporary';
            OptionMembers = "...",Attachee,Casual,"Intern","Judge","Judicial Officer","Judicial Staff","Pupillage","Temporary";
            DataClassification = CustomerContent;
        }
        field(70094; "Police Force Number"; Code[50])
        {
            caption = 'PF No/PJ No/ID Number';
            DataClassification = CustomerContent;
        }
        field(70095; "EMP Transfer Date"; date)
        {
            DataClassification = CustomerContent;
        }
        field(70096; "EMP Reporting Date"; date)
        {
            DataClassification = CustomerContent;
        }
        field(70097; "EMP Actual Reporting Date"; date)
        {
            DataClassification = CustomerContent;
        }
        field(70098; "Changed Password"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70099; "Contract Start Date"; date)
        {
            DataClassification = CustomerContent;
        }
        field(70100; "Last Increment Date"; Date)
        {
        }
        field(70101; "Citizenship Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Resident,"Non-Resident";
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
        field(70103; "Re-Employment Date"; Date)
        {
        }
        field(70104; "Account Type"; Option)
        {
            OptionMembers = " ",Deposit,Recurrent;
            OptionCaption = ' ,Deposit,Recurrent';
        }
        field(70105; "Station Name"; Text[100])
        {
            Caption = 'Duty Station Name';
            Fieldclass = Flowfield;
            Calcformula = lookup("Duty Station".Description where(Code = field("Current Duty Station")));
        }
        field(70106; "Talent 9 Box Code"; code[20])
        {
            // TableRelation = "Talent 9 Box Grid".Code;
            trigger Onvalidate()
            var
                // Talent: Record "Talent 9 Box Grid";
            begin
                // Talent.Reset();
                // Talent.SetRange(Talent.Code, "Talent 9 Box Code");
                // if Talent.find('-') then begin
                //     "Performance Level" := Talent."Performance Level";
                //     "Potential Level" := Talent."Potential Level";
                // end;
            end;
        }
        field(70107; "Performance Level"; Option)
        {
            Caption = 'Performance Level';
            OptionMembers = Low,Medium,High;
        }
        field(70108; "Potential Level"; Option)
        {
            Caption = 'Potential Level';
            OptionMembers = Low,Medium,High;
        }
        field(70109; "Possible Successor"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(70110; "Payslip Sent Date"; Date)
        {
        }
        field(70111; "Presiding Judge"; Code[20])
        {
            TableRelation = Employee."No.";
        }
        field(70112; "Is Supply Chain Officer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70113; "OTP Code"; Code[50])
        {

        }
        field(70114; "OTP Code Expiration"; DateTime)
        {

        }
        field(70115; "Payee Bank Acc Name"; Text[100])
        {

        }
        field(70116; "Job Cadre"; Code[50])
        {
            TableRelation = "Cadre Groups Setup";
            trigger OnValidate()
            var
                Des: Record "Cadre Groups Setup";
            begin
                if Des.Get("Job Cadre") then
                    "Job Cadre Name" := Des.Description;

            end;

        }
        field(70117; "Job Cadre Name"; Text[250])
        {


        }
        field(70118; "Administrative Unit Name"; Code[70])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 2 Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70119; "Terms Of Service"; Text[70])
        {
            CalcFormula = lookup("Employment Contract".Description where(Code = field("Emplymt. Contract Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(70120; "Freeze Basic Pay"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70121; "Designation Group"; Code[30])
        {
            TableRelation = "Designation Groups";
            DataClassification = CustomerContent;
        }
        field(70122; Specialization; Code[20])
        {
            // TableRelation = "Job Specialization"."Specialization ID" where("Position ID" = field("Current Position ID"));
        }
        field(70123; "Specialization Name"; Text[100])
        {
            Editable = false;
            FieldClass = FlowField;
            // CalcFormula = lookup("Job Specialization".Description where("Specialization ID" = field(Specialization), "Position ID" = field("Current Position ID")));
        }
        field(70124; "Director/Registrar"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70125; "Pays tax"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70126; "Acting Scale"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70127; "Acting Present"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(70128;  "Contract Number"; Integer)
        {
            DataClassification = ToBeClassified;
        }
    }

    fieldgroups
    {
        addlast(DropDown; "Police Force Number")
        {

        }
    }
    trigger OnBeforeInsert()
    var
        myInt: Integer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        PurchSetup: Record "Human Resources Setup";
        PurchSetup2: Record "Human Resources Setup";
        payrollPeriods: record "PR Payroll Periods";
    begin
        payrollPeriods.Reset();
        payrollPeriods.SetRange(closed, false);
        payrollPeriods.SetRange("Lock PCA", true);
        if payrollPeriods.FindFirst() then
            Error('Employee creation has been locked by payroll');
        Rec.Status := Rec.Status::Inactive;

        //  if rec."Employee Category Type" = rec."Employee Category Type"::Attachee then begin
        //                                     IF rec."No." = '' THEN BEGIN

        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Attachee Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Attachee Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;

        //                                 end;
        //                                 if rec."Employee Category Type" = rec."Employee Category Type"::Casual then begin
        //                                     IF rec."No." = '' THEN BEGIN

        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Casual Employee Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Casual Employee Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;

        //                                 end;

        //                                 if rec."Employee Category Type" = rec."Employee Category Type"::Intern then begin
        //                                     IF rec."No." = '' THEN BEGIN

        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Intern Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Intern Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;
        //                                 end;


        //                                 if rec."Employee Category Type" = rec."Employee Category Type"::Pupillage then begin
        //                                     IF rec."No." = '' THEN BEGIN
        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Pupillage Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Pupillage Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;
        //                                 end;

        //                                 if rec."Employee Category Type" = rec."Employee Category Type"::"Temporary" then begin
        //                                     IF rec."No." = '' THEN BEGIN
        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Temporary Employee Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Temporary Employee Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;
        //                                 end;
        //                                 if rec."Record Type" = rec."Record Type"::Employee then begin
        //                                     IF rec."No." = '' THEN BEGIN
        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Employee Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Employee Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;
        //                                 end;

        //                                 if rec."Record Type" = rec."Record Type"::Intern then begin
        //                                     IF rec."No." = '' THEN BEGIN
        //                                         PurchSetup.GET;
        //                                         PurchSetup.TESTFIELD("Intern Nos.");
        //                                         EmpNo := NoSeriesMgt.InitSeries(PurchSetup."Intern Nos.", xRec."No.", 0D, rec."No.", "No. Series");

        //                                     END;
        // end;



    end;

    trigger OnModify()
    var
        UserRec: Record "User Setup";
    begin
        if UserRec.get(UserId) then begin
            if UserRec."Can Edit HR" = false then
                Error('You do not have rights to edit Employee Card');

        end else
            Error('You do not have rights to edit Employee Card');

    end;

    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    "Last Modified Date Time" := CURRENTDATETIME;
    IF "No." = '' THEN BEGIN
      HumanResSetup.GET;
    #4..8
      DATABASE::Employee,"No.",
      "Global Dimension 1 Code","Global Dimension 2 Code");
    UpdateSearchName;
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
    #1..11
    TESTFIELD("ID Number");
    TESTFIELD("First Name");
    TESTFIELD("Date Of Birth");
    TESTFIELD("Last Name");
    TESTFIELD(Gender);
    TESTFIELD("Current Position ID");
    TESTFIELD("E-Mail");
    */
    //end;




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

    procedure DuplicateIDNumberExists() mCount: Integer
    var
        EmployeeRec: Record Employee;
    begin
        mCount := 0;

        EmployeeRec.Reset;
        EmployeeRec.SetRange(EmployeeRec."ID Number", "ID Number");
        if EmployeeRec.Find('-') then mCount := EmployeeRec.Count;
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




    //Unsupported feature: Property Modification (Id) on "AlternativeAddr(Variable 1004)".

    //var
    //>>>> ORIGINAL VALUE:
    //AlternativeAddr : 1004;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //AlternativeAddr : 1554;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "BlockedEmplForJnrlPostingErr(Variable 1017)".

    //var
    //>>>> ORIGINAL VALUE:
    //BlockedEmplForJnrlPostingErr : 1017;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //BlockedEmplForJnrlPostingErr : 1517;
    //Variable type has not been exported.


    //Unsupported feature: Property Modification (Id) on "EmployeeLinkedToResourceErr(Variable 1018)".

    //var
    //>>>> ORIGINAL VALUE:
    //EmployeeLinkedToResourceErr : 1018;
    //Variable type has not been exported.
    //>>>> MODIFIED VALUE:
    //EmployeeLinkedToResourceErr : 2018;
    //Variable type has not been exported.

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
        CauseOfAbsence: Record "Cause of Absence";
        SalaryCard: Record "PR Salary Card";
        Dates: Codeunit "HR Dates";
        SalPointer: Record "Salary Pointers";
        Scale: Record "Salary Scales";
        PRSalaryCard: Record "PR Salary Card";
        DateInt: Integer;
        Earnings: Record Earnings;
        AssMatrix: Record "Assignment Matrix-X";
        Ded: Record DeductionsX;
        PayPeriod: Record "PR Payroll Periods";
        ScaleBenefits: Record "Scale Benefits";
        PeriodStartDate: Date;
        Begindate: Date;
        Payroll: Record Employee;
        OK: Boolean;
        "....added by daudi....": Integer;
        UserMgt: Codeunit "User Management";
        GTermination: Record "Grounds for Termination";
        EthnicBackground: Record "Ethnic Background";
        EmployeeBank: Record "Employee Bank AccountX";
        Countys: Record County;
        UserRec: Record "User Setup";
}

