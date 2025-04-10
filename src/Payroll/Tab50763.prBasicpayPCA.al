table 52194107 "prBasic pay PCA"
{
    DrillDownPageId = "prPCA list";
    LookupPageId = "prPCA list";
    DataClassification = CustomerContent;
    fields
    {
        field(1; "Employee Code"; Code[50])
        {
            TableRelation = "Employee"."No.";

            trigger OnValidate()
            var
                RespCenter: Record "Responsibility Center";
                DutyStation: Record "Duty Station";
            begin
                objEmp.Reset;
                objEmp.SetRange(objEmp."No.", "Employee Code");
                if objEmp.Find('-') then begin
                    "Employee Name" := objEmp."First Name" + ' ' + objEmp."Middle Name" + ' ' + objEmp."Last Name";
                    "Global Dimension 1 Code" := objEmp."Global Dimension 1 Code";
                    "Implementing Unit" := objEmp."Implementing Unit Name";
                    "Salary Scale" := objEmp."Salary Scale";
                    "Incremental Month" := objEmp."Incremental Month";
                    Designation := objEmp."Job Title2";
                    Present := objEmp.Present;

                    if DutyStation.Get(objEmp."Current Duty Station") then
                        "Duty Station" := DutyStation.Description;
                    if (objEmp.Status <> objEmp.Status::Active) and (objEmp."Exit Status" <> objEmp."Exit Status"::"Pending Gratuity") then Error('This employee is not an ACTIVE employee contact HR');


                    objSalCard.Reset;
                    objSalCard.SetRange(objSalCard."Employee Code", objEmp."No.");
                    if objSalCard.Find('-') then begin
                        "Basic Pay" := objSalCard."Basic Pay";
                        "Pays NSSF" := objSalCard."Pays NSSF";
                        "Pays NHIF" := objSalCard."Pays NHIF";
                        "Pays PAYE" := objSalCard."Pays PAYE";


                        /*-------------
                          //----Insert from employee transactions----------------------------------------------
                          objPayrollPeriod.RESET;
                          objPayrollPeriod.SETRANGE(objPayrollPeriod.Closed,FALSE);
                          IF objPayrollPeriod.FIND('-') THEN BEGIN
                            empTransPCA.RESET;
                            empTransPCA.SETRANGE(empTransPCA."Change Advice Serial No.","Change Advice Serial No.");
                            IF empTransPCA.FIND('-') THEN empTransPCA.DELETEALL;

                           empTrans.RESET;
                           empTrans.SETRANGE(empTrans."Employee Code",objEmp."No.");
                           empTrans.SETRANGE(empTrans."Payroll Period",objPayrollPeriod."Date Opened");
                           IF empTrans.FIND('-') THEN REPEAT
                            empTransPCA.INIT;
                            empTransPCA."Change Advice Serial No.":="Change Advice Serial No.";
                            empTransPCA."Employee Code":=empTrans."Employee Code";
                            empTransPCA."Transaction Code":=empTrans."Transaction Code";
                            empTransPCA."Payroll Period":=empTrans."Payroll Period";
                            empTransPCA."Transaction Name":=empTrans."Transaction Name";
                            empTransPCA.Amount:=empTrans.Amount;
                            empTransPCA.Balance:=empTrans.Balance;
                            empTransPCA.INSERT;
                           UNTIL empTrans.NEXT=0;
                          //-----------------------------------------------------------------------------------
                          END;
                        ------------------*/

                    end;
                end;

            end;
        }
        field(2; "Employee Name"; Text[100])
        {
        }
        field(3; "Basic Pay"; Decimal)
        {
        }
        field(4; Comments; Text[200])
        {
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Posted,Cancelled';
            OptionMembers = Open,"Pending Approval",Approved,Posted,Cancelled;
            trigger OnValidate()
            begin
                // CalcFields("Final Approver Status");
                // CalcFields("Open Approver Count");
                // CalcFields("Cancelled Approver Count");
                // if ("Final Approver Status" = "Final Approver Status"::Approved) and ("Open Approver Count" = 0) then
                //     Status := Status::Approved;
                // if "Cancelled Approver Count" > 0 then
                //     Status := Status::Open;
            end;
        }
        field(6; "Period Month"; Integer)
        {
        }
        field(7; "Period Year"; Integer)
        {
        }
        field(8; "Payroll Period"; Date)
        {
            TableRelation = "pr Payroll Periods"."Date Opened" where(Closed = const(false));
            trigger OnValidate()
            var

            begin
                Lines.Reset();
                Lines.SetRange("Change Advice Serial No.", Rec."Change Advice Serial No.");
                Lines.SetRange("Employee Code", "Employee Code");
                if Lines.FindSet() then
                    repeat
                        Lines.Rename(Lines."Change Advice Serial No.", Lines."Employee Code", Lines."Transaction Code", "Payroll Period");
                    until Lines.Next() = 0;
            end;
        }
        field(9; "Change Advice Serial No."; Code[50])
        {
            Editable = false;
            trigger OnValidate()
            begin
                if "Change Advice Serial No." <> xRec."Change Advice Serial No." then begin
                    HrSetup.Get;
                    NoSeriesMgt.TestManual(HrSetup."Pay-change No.");
                    "No. Series" := '';
                end;
            end;
        }
        field(10; "No. Series"; Code[10])
        {
            Editable = false;
            TableRelation = "No. Series";
        }
        field(11; Effected; Boolean)
        {
        }
        field(20; "Currency Code"; Code[10])
        {
        }
        field(21; "User ID"; Code[50])
        {
        }
        field(22; "Pays NSSF"; Boolean)
        {
        }
        field(23; "Pays NHIF"; Boolean)
        {
        }
        field(24; "Pays PAYE"; Boolean)
        {
        }
        field(25; "Responsibility Center"; Code[10])
        {
            TableRelation = "Responsibility Center".Code;
        }
        field(26; PAyrollCode; Code[50])
        {
            TableRelation = "PR Employee Posting Groups";
        }
        field(27; "Campus Code"; Code[50])
        {
            CalcFormula = lookup("Employee"."Global Dimension 1 Code" where("No." = field("Employee Code")));
            FieldClass = FlowField;
        }
        field(28; "Department Code"; Code[50])
        {
            CalcFormula = lookup("Employee"."Department Code" where("No." = field("Employee Code")));
            FieldClass = FlowField;
        }
        field(29; "Pays NITA"; Boolean)
        {
        }

        field(31; Multipay; Boolean)
        {
        }
        field(32; "Document No"; Code[50])
        {
            //TableRelation = if ("Source Document" = const(Disciplinary)) "HR Disciplinary Cases" where(Status = const(Closed), Type = const(Disciplinary), "Employee No" = field("Employee Code"));
        }
        field(33; "Campus Name"; Text[250])
        {
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Campus Code")));
            FieldClass = FlowField;
        }
        field(34; "Department Name"; Text[250])
        {
            CalcFormula = lookup("Responsibility Center".Name where(Code = field("Department Code")));
            FieldClass = FlowField;
        }
        field(35; "Source Document"; Enum "PayChange Source Document")
        {
        }
        field(36; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(37; "Cost Center Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code"), "Global Dimension No." = const(1)));
        }
        field(38; "Change Bank Details"; Boolean)
        {

        }
        field(39; Description; Text[2000])
        {
        }
        field(40; "Implementing Unit"; Text[150])
        {
            Editable = false;
        }
        field(41; "Duty Station"; Text[150])
        {
            Editable = false;
        }
        field(50021; "Bank Account Number"; Code[100])
        {
        }
        field(50022; "Bank Branch"; Code[100])
        {
            TableRelation = "PR Bank Branches"."Branch Code" where("Bank Code" = field("Employee's Bank"));

        }
        field(69010; "Employee's Bank"; Code[80])
        {
            TableRelation = "PR Bank Accounts";

            trigger OnValidate()
            begin
                EmployeeBank.Reset;
                EmployeeBank.SetRange(EmployeeBank."Bank Code", "Employee's Bank");
                if EmployeeBank.FindSet() then begin
                    "Bank Name" := EmployeeBank."Bank Name";
                    // "Bank Branch Name" := EmployeeBank."Branch Name";
                    // "Bank Branch" := EmployeeBank."Bank Branch No.";
                end;
            end;
        }
        field(69016; "Bank Name"; Text[100])
        {
            CalcFormula = lookup("PR Bank Accounts"."Bank Name" where("Bank Code" = field("Employee's Bank")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69017; "Bank Branch Name"; Text[100])
        {
            CalcFormula = lookup("PR Bank Branches"."Branch Name" where("Branch Code" = field("Bank Branch")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69018; "Effective Date"; Date)
        {
        }
        field(69019; "Document Type"; Option)
        {
            OptionMembers = PCA,"Payroll Data";
        }
        field(70082; "Increment Date"; Date)
        {
        }
        field(50160; "Incremental Month"; Text[30])
        {
        }
        field(69602; "Current Job Grade"; Code[30])
        {
            TableRelation = "Salary Scales";
        }
        field(50162; Present; Code[30])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field("Salary Scale"));

        }
        field(50165; "Salary Scale"; Code[30])
        {
            TableRelation = "Salary Scales".Scale;
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
                ScaleBenefits: Record "Scale Benefits";
            begin
                if SalPointer.Get("Salary Scale", Present) then begin

                    PayrollSetup.get();

                    ScaleBenefits.Reset;
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Scale", "Salary Scale");
                    ScaleBenefits.SetRange(ScaleBenefits."Salary Pointer", Present);
                    ScaleBenefits.SetRange(ScaleBenefits."Basic Salary", true);
                    if ScaleBenefits.Find('-') then begin
                        if ScaleBenefits."Based On" = ScaleBenefits."Based On"::Amount then
                            "Basic Pay" := ScaleBenefits.Amount
                        else begin
                            "Basic Pay" := ScaleBenefits.Percentage / 100 * GrossPay;
                        end;

                    end;
                end;
            end;


        }
        field(50166; "Employee Status"; Enum "Employee Status")
        {

        }
        field(50167; "Cause of Inactivity"; Code[30])
        {
            TableRelation = "Cause of Inactivity";
        }
        field(70080; "Exit Status"; Option)
        {
            OptionMembers = "","Exit Processing","Pending Gratuity",Exited;

        }
        field(70081; Designation; Text[100])
        {
        }
        field(70134778; "Final Approver Status"; Enum "Approval Status")
        {
            FieldClass = FlowField;
            CalcFormula = max("Approval Entry".Status where("Document No." = field("Change Advice Serial No.")));
        }
        field(70134789; "Open Approver Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Document No." = field("Change Advice Serial No."), Status = filter(Open)));
        }
        field(70134779; "Final Approver Seq No"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = max("Approval Entry"."Sequence No." where("Document No." = field("Change Advice Serial No.")));
        }
        field(70134790; "Cancelled Approver Count"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Approval Entry" where("Document No." = field("Change Advice Serial No."), Status = filter(Rejected)));
        }
        field(70083; "Posted By"; Code[50])
        {
            TableRelation = "User Setup";
            trigger OnValidate()
            var
                UserRec: Record "User Setup";
            begin
                if UserRec.Get("Posted By") then
                    "Posted By Name" := UserRec."Employee Name";
            end;

        }
        field(70084; "Posted By Name"; Code[50])
        {
        }
        field(70085; "Posted Date"; DateTime)
        {
        }
        field(70086; "Employee Status II"; Option)
        {
            caption = 'Payroll Status';
            DataClassification = CustomerContent;
            OptionMembers = " ",Suspension,Interdiction,Absence,"Leave of Absence",Dismissal,Resignation,"Contract Expiry","In Service",Retirement,"Retire Mandatory",Death,"Stoppage of Salary",Termination;
        }
        field(70087; "Final Approver"; Code[50])
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Change Advice Serial No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        Payperiods: Record "PR Payroll Periods";
    begin
        Payperiods.Reset();
        Payperiods.SetRange(Payperiods.Closed, false);
        if Payperiods.Find('-') then
            if Payperiods."Lock PCA" then Error('PCAs and payroll data forms creation has been locked until the next payroll period');
        if "Change Advice Serial No." = '' then begin
            HrSetup.Get;
            // HrSetup.TestField("Pay-change No.");
            NoSeriesMgt.InitSeries(HrSetup."Pay-change No.", xRec."No. Series", 0D, "Change Advice Serial No.", "No. Series");
            "Change Advice Serial No." += Format(Today, 0, '.<Year4>');
        end;


        Usetup.Reset;
        Usetup.SetRange(Usetup."User ID", UserId);
        if Usetup.Find('-') then begin
            // PAyrollCode:=Usetup."Payroll Code";
        end else
            Error('Please contact your admin to be setup to raise PCAs');

        fnCheckEmployeeStatus;
    end;

    trigger OnModify()
    begin
        // if xRec.Status <> xRec.Status::Open then
        //     if xRec.Status = Rec.Status then

        //         Error('You can not edit this document due to its approval status');

    end;

    var
        HrSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        objEmp: Record "Employee";
        objSalCard: Record "pr Salary Card";
        empTrans: Record "pr Employee Transactions";
        //empTransPCA: Record prPeriodLumpSummedItems;
        objPayrollPeriod: Record "pr Payroll Periods";
        Usetup: Record "User Setup";
        Lines: Record "prEmployee Trans PCA";
        EmployeeBank: Record "PR Bank Accounts";

    procedure fnCheckEmployeeStatus()
    var
        objEmp: Record "Employee";
    begin
        objEmp.Reset;
        objEmp.SetRange(objEmp."No.", "Employee Code");
        objEmp.SetFilter(objEmp.Status, '<>%1', objEmp.Status::Active);
        if objEmp.Find('-') then begin
            Error('You cannot raise a PCA for someone who is not Active');
            "Employee Code" := '';
            Modify;
        end;
    end;
}

