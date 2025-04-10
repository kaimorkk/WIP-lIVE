table 52193430 "prEmployee Trans PCA"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee Code"; Code[30])
        {
            TableRelation = "Employee"."No.";
        }
        field(2; "Transaction Code"; Code[30])
        {
            TableRelation = "pr Transaction Codes"."Transaction Code" where("Non Assignable" = const(false));

            trigger OnValidate()
            begin
                objPeriod.Reset;
                objPeriod.SetRange(objPeriod.Closed, false);
                if objPeriod.Find('-') then begin
                    CurrentYr := objPeriod."Period Year";
                end;
                PCACard.Get("Change Advice Serial No.", "Document Type");

                if Transcode.Get("Transaction Code") then begin
                    "Transaction Name" := Transcode."Transaction Name";
                    EmployeeTrans.Reset;
                    EmployeeTrans.SetRange(EmployeeTrans."Employee Code", "Employee Code");
                    EmployeeTrans.SetRange(EmployeeTrans."Transaction Code", "Transaction Code");
                    if EmployeeTrans.Find('-') then begin
                        "Has Insurance Certificate" := EmployeeTrans."Has Insurance Certificate";
                    end;

                    if Transcode."Transaction Code" = 'LEAVE' then begin
                        EmployeeTrans.Reset;
                        EmployeeTrans.SetRange(EmployeeTrans."Employee Code", "Employee Code");
                        EmployeeTrans.SetRange(EmployeeTrans."Transaction Code", "Transaction Code");
                        if EmployeeTrans.Find('-') then begin

                            repeat
                                if EmployeeTrans."Period Year" = CurrentYr then begin
                                    MonthName := Format(EmployeeTrans."Payroll Period", 0, '<Month Text>');
                                    //ERROR(MonthName);
                                    Error('Employee has already been paid leave allowance in the period of %1.- %2', EmployeeTrans."Payroll Period",
                                           EmployeeTrans."Employee Code");
                                end;
                            until EmployeeTrans.Next = 0;
                        end;
                    end;
                    if Transcode."Calculation Method" = Transcode."Calculation Method"::"Basic Pay" then
                        Amount := PCACard."Basic Pay" * Transcode."Formula %" / 100;
                end;

                // if "Transaction Code" = 'D0047' then begin
                //     if PCACard.Get("Change Advice Serial No.") then begin
                //         Amount := PCACard."Basic Pay" * 0.05;
                //         Balance := PCACard."Basic Pay" * 0.05;
                //     end;
                // end;

                CalculateGratuity(Rec);
            end;
        }
        field(3; "Transaction Name"; Text[100])
        {
        }
        field(4; Amount; Decimal)
        {
            trigger onvalidate()
            begin
                if "Duration" <> 0 then begin

                    Payable := Amount * Duration / 30;
                    Difference := Payable - Paid;
                    SubTotal := Difference;
                    // if "Document Type" = "Document Type"::"Payroll Data" then
                    //     SubTotal := Difference * Duration / 30;
                end else begin
                    Payable := Amount;
                    Difference := Payable - Paid;
                    SubTotal := Difference;
                    // if "Document Type" = "Document Type"::"Payroll Data" then
                    //     SubTotal := Difference * Duration / 30;
                end;
                if Transcode.Get("Transaction Code") then
                    if Transcode."Balance Type" = Transcode."Balance Type"::Reducing then
                        Balance := SubTotal;
            end;


        }
        field(5; Balance; Decimal)
        {
        }
        field(6; "Period Month"; Integer)
        {
        }
        field(7; "Period Year"; Integer)
        {
        }
        field(8; "Payroll Period"; Date)
        {
            TableRelation = "pr Payroll Periods"."Date Opened";
        }
        field(9; Comments; Text[250])
        {
        }
        field(10; "Change Advice Serial No."; Code[50])
        {
            TableRelation = "prBasic pay PCA"."Change Advice Serial No.";
        }
        field(11; "Employer Amount"; Decimal)
        {
        }
        field(12; "Start Date"; Date)
        {
        }
        field(13; "End Date"; Date)
        {
        }
        field(14; "From Date"; Date)
        {
        }
        field(15; "To Date"; Date)
        {
            trigger OnValidate()
            var

            begin
                TestField("From Date");
                Duration := Abs("To Date" - "From Date") + 1;
                // if "To Date" <> 0D then begin
                //     if Date2DMY("To Date", 3) <> Date2DMY("From Date", 3) then begin
                //         if 
                //         Duration := (Date2DMY("To Date", 3) - Date2DMY("From Date", 3)) * 12 + (Date2DMY("To Date", 1) - Date2DMY("From Date", 1) + 1);

                //     end else
                //         Duration := Date2DMY("To Date", 1) - Date2DMY("From Date", 1) + 1;
                // end else
                //     Duration := 0;

                //Duration := Date2DMY("To Date", 1) - Date2DMY("From Date", 1) + 1;

                if "Duration" <> 0 then begin
                    PRPeriodTransactions.Reset();
                    PRPeriodTransactions.SetRange("Employee Code", "Employee Code");
                    PRPeriodTransactions.SetFilter("Transaction Code", '=%1|%2', "Transaction Code", Transcode."Transaction Code");
                    PRPeriodTransactions.SetRange("Payroll Period", "From Date", "To Date");
                    if PRPeriodTransactions.FindSet() then begin
                        PRPeriodTransactions.CalcSums(Amount);
                        Paid := PRPeriodTransactions.Amount;
                    end;

                    Payable := Amount * Duration / 30;
                    Difference := Payable - Paid;
                    SubTotal := Difference;
                    if "Document Type" = "Document Type"::"Payroll Data" then
                        SubTotal := Difference * Duration / 30;
                end else begin
                    Payable := Amount;
                    Difference := Payable - Paid;
                    SubTotal := Difference;
                    if "Document Type" = "Document Type"::"Payroll Data" then
                        SubTotal := Difference * Duration / 30;
                end;
            end;
        }
        field(16; "Duration"; Integer)
        {

        }
        field(17; Paid; Decimal)
        {
            trigger onvalidate()
            begin
                if "Document Type" = "Document Type"::PCA then begin
                    if "Duration" <> 0 then begin
                        Payable := Amount * Duration / 30;
                        Difference := Payable - Paid;
                        SubTotal := Difference;
                    end else begin
                        Payable := Amount;
                        Difference := Payable - Paid;
                        SubTotal := Difference;
                    end;
                end else
                    if "Document Type" = "Document Type"::"Payroll Data" then begin
                        Difference := Payable - Paid;
                        SubTotal := Difference * Duration / 30;
                    end;
            end;
        }
        field(18; Payable; Decimal)
        {
            trigger OnValidate()
            begin
                Difference := Payable - Paid;
                // Amount := Difference;
                if "Document Type" = "Document Type"::"Payroll Data" then
                    SubTotal := Difference * Duration / 30;

            end;
        }
        field(19; Difference; Decimal)
        {
        }
        field(20; "Change Type"; Option)
        {
            OptionMembers = ,Increment,Addition,Reduction,Stoppage;
        }
        field(21; SubTotal; Decimal)
        {
        }

        field(39003900; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(39003901; "Global Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(39003902; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(3));
        }
        field(39003903; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(4));
        }
        field(22; "Transaction Type"; Option)
        {
            OptionMembers = Income,Deduction,Benefit;
            FieldClass = FlowField;
            CalcFormula = lookup("PR Transaction Codes"."Transaction Type" Where("Transaction Code" = field("Transaction Code")));
        }
        field(23; "Document Type"; Option)
        {
            OptionMembers = PCA,"Payroll Data";
        }
        field(24; Rate; Decimal)
        {
        }
        field(25; "No of Days"; Decimal)
        {
            trigger OnValidate()
            begin
                PRSetup.get();
                if PRSetup."Baggage Allowance Code" = "Transaction Code" then Begin
                    if HREmp.Get("Employee Code") then
                        if SalaryNotches.get(HREmp."Salary Scale") then
                            Rate := SalaryNotches."Mobility Transfer Rate";
                    Validate(Amount, SalaryNotches."Mobility Transfer Rate");
                    if Rate <> 0 then
                        Payable := Rate * "No of Days";
                    SubTotal := Payable;
                End;
            end;
        }
        field(26; Kilometers; Decimal)
        {
            trigger OnValidate()
            begin
                PRSetup.get();
                if PRSetup."Baggage Allowance Code" = "Transaction Code" then Begin
                    if HREmp.Get("Employee Code") then
                        if SalaryNotches.get(HREmp."Salary Scale") then
                            Rate := SalaryNotches."Mobility Transfer Rate";
                    Validate(Amount, SalaryNotches."Mobility Transfer Rate");
                    if Rate <> 0 then
                        Payable := Rate * Kilometers;
                    SubTotal := Payable;
                end;
            end;
        }
        field(27; "Has Insurance Certificate"; enum "Has Insurance Certificate")
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

    }

    keys
    {
        key(Key1; "Change Advice Serial No.", "Employee Code", "Transaction Code", "Payroll Period", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
    trigger OnInsert()
    begin
        PCACard.Reset();
        PCACard.SetRange("Employee Code", "Employee Code");
        PCACard.SetRange("Change Advice Serial No.", "Change Advice Serial No.");
        PCACard.SetRange("Payroll Period", "Payroll Period");
        if PCACard.FindFirst() then begin
            Rec."Global Dimension 1 Code" := PCACard."Global Dimension 1 Code";

        end;
    end;

    var
        Transcode: Record "pr Transaction Codes";
        EmployeeTrans: Record "pr Employee Transactions";
        PRPeriodTransactions: Record "PR Period Transactions";
        MonthName: Text[100];
        SalCard: Record "pr Salary Card";
        SalaryNotches: Record "Salary Scales";
        CurrentYr: Integer;
        objPeriod: Record "pr Payroll Periods";
        PCACard: Record "prBasic pay PCA";
        HREmp: Record Employee;

        PRSetup: Record "PR Vital Setup Info";

        Inaonekana: Boolean;


    procedure CalculateGratuity(var Lines: Record "prEmployee Trans PCA")
    var
        PayChange: Record "prBasic pay PCA";
        Employee: Record Employee;
        TransactionCode: Record "PR Transaction Codes";
        NoOfMonths: Integer;
        SalaryCard: Record "PR Salary Card";
    begin
        if TransactionCode.Get(Lines."Transaction Code") then
            if TransactionCode."Transaction Category" <> TransactionCode."Transaction Category"::Gratuity then
                exit;
        Employee.get(Lines."Employee Code");
        SalaryCard.Get(Lines."Employee Code");
        NoOfMonths := 1 + DATE2DMY(CalcDate('CM', Today), 2) - DATE2DMY(CalcDate('CM', Employee."Employment Date"), 2)
          + 12 * (DATE2DMY(CalcDate('CM', Today), 3) - DATE2DMY(CalcDate('CM', Employee."Employment Date"), 3));
        Lines.Amount := (NoOfMonths * 31 / 100 * SalaryCard."Basic Pay");
    end;
}

