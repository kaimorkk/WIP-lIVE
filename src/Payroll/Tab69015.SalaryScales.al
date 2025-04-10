
table 69015 "Salary Scales"
{
    DrillDownPageID = "Salary Scale List";
    LookupPageID = "Salary Scale List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Scale; Code[10])
        {
        }
        field(2; "Minimum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
        }
        field(3; "Maximum Pointer"; Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where("Salary Scale" = field(Scale));
        }
        field(4; "Responsibility Allowance"; Decimal)
        {
        }
        field(5; "Commuter Allowance"; Decimal)
        {
        }
        field(6; "In Patient Limit"; Decimal)
        {
        }
        field(7; "Out Patient Limit"; Decimal)
        {
        }
        field(8; Description; Text[500])
        {
        }
        field(9; "Maximum Cover"; Decimal)
        {
        }
        field(69600; "Appointment Authority"; Code[30])
        {
            TableRelation = "Responsibility Center" where("Blocked?" = filter(false), "Operating Unit Type" = filter(Authority));
        }
        field(69601; "Seniority Level"; Option)
        {
            OptionCaption = ',Entry-Level,Mid-Entry-Level,Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Entry-Level",Level,"Senior Level",Executive;
        }
        field(69602; "Valid Positions"; Integer)
        {
            CalcFormula = count("Company Positions" where("Job Grade ID" = field(Scale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69603; "Active Employees"; Integer)
        {
        }
        field(69604; Blocked; Boolean)
        {
        }
        field(69605; "Maximum Car Loan"; Decimal)
        {
        }
        field(69606; "Maximum Mortage Loan"; Decimal)
        {
        }
        field(69607; "Bed Limit"; Decimal)
        {
        }
        field(69608; "Maternity Limit"; Decimal)
        {
        }
        field(69609; "Dental Limit"; Decimal)
        {
        }
        field(69610; "Optical Limit"; Decimal)
        {
        }
        field(69611; "Employee Category"; Code[20])
        {
            TableRelation = "Employee Posting GroupX";
        }
        field(69612; Status; Option)
        {
            OptionMembers = New,"Pending Approval",Approved,"Under Review";
        }
        field(69613; "Mobility Transfer Rate"; Decimal)
        {
        }
        field(43; "Number of Staff Per Scale"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count(Employee where(Status = filter(Active), "Salary Scale" = field("Scale")));
        }
        field(44; "Basic Pay Per Scale"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('BPAY'), "Salary Scale" = field("Scale")));
        }
        field(45; "Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(46; "Commuter"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0013'), "Salary Scale" = field("Scale")));
        }
        field(47; "Non-Practising"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0018'), "Salary Scale" = field("Scale")));
        }
        field(48; "Special Responsibility"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0034'), "Salary Scale" = field("Scale")));
        }
        field(49; "Market Salary"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0043'), "Salary Scale" = field("Scale")));
        }
        field(50; "Risk Allowance"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0049'), "Salary Scale" = field("Scale")));
        }
        field(51; "Responsibility Allowance Total"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0012'), "Salary Scale" = field("Scale")));
        }
        field(52; "Extraneous Duty Allowance"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0016'), "Salary Scale" = field("Scale")));
        }
        field(53; "Special Judicial Duty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0032'), "Salary Scale" = field("Scale")));
        }
        field(54; "Extra Duty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0021'), "Salary Scale" = field("Scale")));
        }
        field(55; "Special Duty"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0010'), "Salary Scale" = field("Scale")));
        }
        field(56; "Gross Pay"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('GPAY'), "Salary Scale" = field("Scale")));
        }
        field(57; "Rental House"; Decimal)
        {
            FieldClass = FlowField;
            CalcFormula = Sum("PR Period Transactions".Amount where("Payroll Period" = field("Period Filter"), "Transaction Code" = filter('ALW-0004'), "Salary Scale" = field("Scale")));
        }
        field(58; "Leave Allowance"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Scale)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

