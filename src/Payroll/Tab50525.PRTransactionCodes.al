table 52193800 "PR Transaction Codes"
{
    DrillDownPageID = "PR Transaction Codes List";
    LookupPageID = "PR Transaction Codes List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transaction Code"; Code[20])
        {
        }
        field(3; "Transaction Name"; Text[100])
        {
        }
        field(4; "Balance Type"; Option)
        {
            OptionMembers = "None",Increasing,Reducing;
        }
        field(5; "Transaction Type"; Option)
        {
            OptionMembers = Income,Deduction,Benefit;
        }
        field(6; Frequency; Option)
        {
            OptionMembers = "Fixed",Varied;
        }
        field(7; "Is Cash"; Boolean)
        {
        }
        field(8; Taxable; Boolean)
        {

            trigger OnValidate()
            begin

                if "Transaction Type" = "Transaction Type"::Deduction then
                    Error('You cannot tax a deduction');
            end;
        }
        field(9; "Is Formula"; Boolean)
        {
        }
        field(10; Formula; Text[200])
        {
        }
        field(16; "Amount Preference"; Option)
        {
            OptionMembers = "Posted Amount","Take Higher","Take Lower ";
        }
        field(18; "Special Trans Deductions"; Option)
        {
            OptionMembers = "None","Defined Contribution","Home Ownership Savings Plan","Life Insurance","Owner Occupier Interest","Prescribed Benefit","Salary Arrears","Staff Loan (Interest Varies)","Value of Quarters",Mortgage,"Voluntary Pension","Mortgage Relief","Sacco Loan";
        }
        field(21; "Deduct Premium"; Boolean)
        {
        }
        field(26; "Interest Rate"; Decimal)
        {
        }


        field(28; "Repayment Method"; Option)
        {
            OptionMembers = Reducing,"Straight line",Amortized;
        }
        field(29; "Fringe Benefit"; Boolean)
        {
        }
        field(30; "Employer Deduction"; Boolean)
        {
        }
        field(31; isHouseAllowance; Boolean)
        {
        }
        field(32; "Include Employer Deduction"; Boolean)
        {
        }
        field(33; "Is Formula for employer"; Text[200])
        {
        }
        field(34; "Transaction Code old"; Code[50])
        {
        }
        field(35; "GL Account"; Code[50])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(36; "GL Employee Account"; Code[50])
        {
        }
        field(37; "coop parameters"; Option)
        {
            Caption = 'Other Categorization';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime,"Voluntary NSSF","Voluntary Pension";
        }
        field(38; "IsCoop/LnRep"; Boolean)
        {
        }
        field(39; "Deduct Mortgage"; Boolean)
        {
        }
        field(40; Subledger; Option)
        {
            OptionMembers = " ",Employee,Vendor;
        }
        field(41; Welfare; Boolean)
        {
        }
        field(42; CustomerPostingGroup; Code[20])
        {
            TableRelation = "Customer Posting Group".Code;
        }
        field(210; "Previous Month Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(211; "Current Month Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(212; "Prev. Amount"; Decimal)
        {
        }
        field(213; "Curr. Amount"; Decimal)
        {
        }
        field(219; "Transaction Category"; Option)
        {
            OptionMembers = " ",Housing,Transport,"Other Allowances",NHF,Pension,"Company Loan","Housing Deduction","Personal Loan",Inconvinience,"Bonus Special","Other Deductions",Overtime,Entertainment,Leave,Utility,"Other Co-deductions","Car Loan","Call Duty","Co-op",Lunch,"Compassionate Loan",Gratuity,"Acting Allowance";
        }
        field(220; "Employee Code"; Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee"."No.";
        }
        field(221; Suspended; Boolean)
        {
        }
        field(222; "Include in Net"; Boolean)
        {
        }
        field(223; "Taxable Percentage"; Decimal)
        {
        }
        field(224; "No. Series"; Code[20])
        {
        }
        field(225; "Is Formula Per Directorate"; Boolean)
        {
        }
        field(226; "Special Trans Incomes"; Option)
        {
            OptionMembers = "None","Salary Arrears","Leave Allowance","Transfer Allowance","Acting Allowance";
        }
        field(227; "G/L Account Name"; Text[150])
        {
            CalcFormula = lookup("G/L Account".Name where("No." = field("GL Account")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(228; "Group Code"; Code[20])
        {
            TableRelation = "PR Trans Codes Groups";

            trigger OnValidate()
            begin
                "Group Description" := '';

                PRTransCodesGroups.Reset;
                if PRTransCodesGroups.Get("Group Code") then begin
                    "Group Description" := UpperCase(PRTransCodesGroups."Group Description");
                end;
            end;
        }
        field(229; "Group Description"; Text[100])
        {
            Editable = false;
        }

        field(2320; "Non Assignable"; Boolean)
        {
        }

        field(230; "Mandatory"; Boolean)
        {
            Editable = true;
        }
        field(39003932; "Group Order"; Option)
        {
            OptionMembers = " ","1","2","3","4","5","6","7","8","9","10","11","12";
        }
        field(39003936; "Disable Proration"; Boolean)
        {
            Caption = 'Prorated';
            InitValue = true;
        }

        field(39003937; "Skip Transfer in Next Period"; Boolean)
        {
        }

        field(39003938; "IPPD Transaction Code"; Code[50])
        {
        }
        field(39003939; "Transaction Charge Code"; Code[50])
        {
            tablerelation = "PR Third Party Charges".Code;
        }
        field(50014; "Imprest Surrender"; Boolean)
        {

        }
        field(50015; "Intrest Transaction Code"; Code[50])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50016; "Formula %"; Decimal)
        {
            DecimalPlaces = 2;
        }
        field(50017; "Is Leave Allowance"; Boolean)
        {

        }
        field(50018; "Include In Payroll Transfer?"; Boolean)
        {

        }
        field(50019; "Exempt Housing Levy"; Boolean)
        {

        }
        field(50020; "Calculation Method"; Option)
        {
            OptionMembers = "","Basic Pay","Gross Pay","Taxable Pay",Flat,Formula;
            OptionCaption = ',% of Basic Pay,% of Gross Pay,% of Taxable Pay,Flat Amount,Formula';
        }
        field(50021; "Applies to All"; Boolean)
        {

        }
        field(50022; "Employer Rate"; Decimal)
        {
        }
        field(50023; Status; Option)
        {
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(50024; "Tax Exempt Amount"; Decimal)
        {
        }
        field(50025; "Commission"; Decimal)
        {
            Caption = 'Commission';
            DataClassification = CustomerContent;
        }
        field(50026; "Arrears Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes"."Transaction Code";
        }
        field(50027; "Not Included Third"; Boolean)
        {
            Caption = 'Not included in a Third Rule';
        }
        field(50028; "Basic Salary Arrears"; Boolean)
        {

        }
        field(50029; "Commission Type"; option)
        {
            OptionMembers = "Flat Amount",Percentage;
        }
        field(50030; "Pay Code"; Code[20])
        {

        }
        field(50031; "Transaction Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = field("Transaction Code")));
        }
        field(50032; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods";
        }
        field(50033; "Group Code Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = field("Transaction Code"), "Group Code" = field("Group Code")));
        }
        field(50034; "Balance Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Balance where("Payroll Period" = field("Period Filter"), "Transaction Code" = field("Transaction Code")));
        }
        field(50035; "Vendor"; Code[20])
        {
            TableRelation = Vendor."No.";
            trigger OnValidate()
            var
                Vend: Record Vendor;
            begin
                If Vend.Get(Vendor) then
                    "Vendor Name" := Vend.Name;
            end;
        }
        field(50036; "Vendor Name"; Text[250])
        {

        }
        field(50037; "Recalculate Basic Changes"; Boolean)
        {

        }
        field(50038; "Employer Limit"; Decimal)
        {

        }
        field(50039; "Is Acting Allowance"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50040; "Acting Transaction Code"; Code[20])
        {
            TableRelation = "PR Transaction Codes";

            trigger OnValidate()
            var
                PRTransCodes: Record "PR Transaction Codes";
            begin
                PRTransCodes.Reset();
                PRTransCodes.SetRange("Acting Transaction Code", "Acting Transaction Code");
                if PRTransCodes.FindFirst() then
                    Error('Acting Transaction Code already exists for %1.', PRTransCodes."Transaction Name");
            end;
        }
        field(50041; "Deduct From Taxable Pay"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50042; "Deduction Limit"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

    }

    keys
    {
        key(Key1; "Transaction Code")
        {
            Clustered = true;
        }
        key(Key2; "Transaction Name")
        {
        }
        key(Key3; "Transaction Type")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Transaction Code", "Transaction Name")
        {
        }
    }

    trigger OnDelete()
    begin
        //Disable Deletion if Used
        PRPeriodTrans.Reset;
        PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", "Transaction Code");
        if PRPeriodTrans.FindFirst() then begin
            Error('Cannot delete Transaction Code because it was posted in [ %1 - %2 ]', PRPeriodTrans."Payroll Period", PRPeriodTrans."Employee Code");
        end;

        PREmpTrans.Reset;
        PREmpTrans.SetRange(PREmpTrans."Transaction Code", "Transaction Code");
        if PREmpTrans.FindFirst() then begin
            Error('Cannot delete Transaction Code because it was assigned to [ %1 - %2 ]', PREmpTrans."Employee Code", PREmpTrans."Payroll Period");
        end;
    end;

    trigger OnInsert()
    begin

        if "Transaction Type" = "transaction type"::Deduction then begin
            if "Transaction Code" = '' then begin
                HRSetup.Get;
                HRSetup.TestField(HRSetup."PR Deduction Nos.");
                NoSeriesMgt.InitSeries(HRSetup."PR Deduction Nos.", xRec."No. Series", 0D, "Transaction Code", "No. Series");
            end;
        end;

        if "Transaction Type" = "transaction type"::Income then begin
            if "Transaction Code" = '' then begin
                HRSetup.Get;
                HRSetup.TestField(HRSetup."PR Allowance Nos.");
                NoSeriesMgt.InitSeries(HRSetup."PR Allowance Nos.", xRec."No. Series", 0D, "Transaction Code", "No. Series");
            end;
        end;
        if "Transaction Type" = "transaction type"::Benefit then begin
            if "Transaction Code" = '' then begin
                HRSetup.Get;
                HRSetup.TestField(HRSetup."PR Benefit Nos");
                NoSeriesMgt.InitSeries(HRSetup."PR Benefit Nos", xRec."No. Series", 0D, "Transaction Code", "No. Series");
            end;
        end;
    end;

    var
        PRTransCodes: Record "PR Transaction Codes";
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DimensionValue: Record "Dimension Value";
        PRPeriodTrans: Record "PR Period Transactions";
        PREmpTrans: Record "PR Employee Transactions";
        PRTransCodesGroups: Record "PR Trans Codes Groups";
}

