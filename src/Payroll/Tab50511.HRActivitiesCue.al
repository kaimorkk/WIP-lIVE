table 52193458 "HR Activities Cue"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[30])
        {
        }

        field(2; "Active Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = Count("Employee" where(Status = filter(Active), "Employees Type" = filter(<> Interns)));
        }

        field(3; "In-Active Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = Count("Employee" WHERE(Status = CONST(InActive), "Employees Type" = filter(<> Interns)));
        }

        field(4; "All Jobs"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = count("Company Positions");

        }

        field(5; "Male Employees"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = count("Employee" where(Gender = const(Male)));
        }

        field(6; "Female Employees"; Integer)
        {
            BlankZero = true;
            MaxValue = 100000;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where(Gender = const(Female)));
        }

        field(7; "Current Payroll Period"; Date)
        {
            FieldClass = FlowField;
            CalcFormula = lookup("PR Payroll Periods"."Date Opened" where(Closed = const(false)));
        }

        field(8; "Net Pay"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NPAY'), "Payroll Period" = field("PayPeriod Filter")));
            DecimalPlaces = 0 : 0;
        }

        field(9; "Basic Pay"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('BPAY'), "Payroll Period" = field("PayPeriod Filter")));

            DecimalPlaces = 0 : 0;
        }


        field(10; "Contract Staff"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = Count("Employee" WHERE("Employees Type" = filter(Contract)));
        }
        field(11; "Permanent Staff"; Integer)
        {
            BlankZero = true;
            MaxValue = 100000;
            CalcFormula = count("Employee" where(Status = filter(Active),
                                                     "Employees Type" = filter(Permanent)));

            FieldClass = FlowField;
        }

        field(12; "Seconded Staff"; Integer)
        {
            BlankZero = true;
            MaxValue = 100000;
            CalcFormula = count("Employee" where(Status = filter(Active),
                                                     "Employees Type" = filter(Seconded)));

            FieldClass = FlowField;
        }

        field(13; "Staff on Leave"; Integer)
        {

        }
        field(114; "Staff on Leave Count"; Integer)
        {
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = count("Employee" where("On Leave" = filter(true), "Directorate Code" = field("Implementing Unit Filter")));
        }

        field(14; "Contracts Due"; Integer)
        {

        }

        field(15; "Retirement Report"; Integer)
        {

        }

        field(16; "Allowances"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Group Order" = const(3), "Payroll Period" = field("PayPeriod Filter")));
            DecimalPlaces = 0 : 0;
        }
        // field(17; "Deductions"; Decimal)
        // {
        //     BlankZero = true;
        //     FieldClass = FlowField;
        //     CalcFormula = sum("PR Period Transactions".Amount where("Group Text" = const('DEDUCTIONS'),
        //                     "Period Closed" = const(false)));
        //     DecimalPlaces = 0 : 0;
        // }

        field(18; "NHIF"; Decimal)
        {
            BlankZero = true;
            Caption = 'SHIF/NHIF';
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NHIF'), "Payroll Period" = field("PayPeriod Filter")));

            DecimalPlaces = 0 : 0;
        }

        field(19; "NSSF"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = filter('NSSF TIER 1' | 'NSSF TIER 2'), "Payroll Period" = field("PayPeriod Filter")));

            DecimalPlaces = 0 : 0;
        }

        field(20; "PAYE"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('PAYE'), "Payroll Period" = field("PayPeriod Filter")));
            DecimalPlaces = 0 : 0;
        }

        field(21; "Pension-Employee"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = filter('DED-0003' | 'DED-0240'), "Payroll Period" = field("PayPeriod Filter")));

            DecimalPlaces = 0 : 0;
        }

        field(22; "Pension-Employer"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Employer Deductions".Amount where("Transaction Code" = const('ED005'), "Payroll Period" = field("PayPeriod Filter")));

        }

        field(23; "Voluntary NSSF"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('NSSFVOL'), "Payroll Period" = field("PayPeriod Filter")));

            DecimalPlaces = 0 : 0;
        }

        field(24; "Voluntary Pension"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('PENVL'), "Payroll Period" = field("PayPeriod Filter")));

            DecimalPlaces = 0 : 0;
        }

        field(25; "Probation Report"; Integer)
        {
            BlankZero = true;
        }
        field(26; "Registered Male"; integer)
        {
            BlankZero = true;
            MaxValue = 100000;
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Gender" = const(Male), Status = const(Active)));

        }
        field(27; "Registered Female"; integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = count("Employee" where("Gender" = const(Female), Status = const(Active)));

        }
        field(28; "Registered Disabled"; integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = count("Employee" where("Disabled" = const(true), Status = const(Active)));
        }

        field(29; "Ending Probations"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            MaxValue = 100000;
            CalcFormula = count("Employee" where("Employment Date" = field(Probationend), Inducted = const(true)));
        }
        field(30; Probationend; Date)
        {

            FieldClass = FlowFilter;

        }
        field(31; "Payroll Actuals"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = Sum("G/L Entry".Amount WHERE("G/L Account No." = const('2110103')));
        }
        field(32; "Budgeted Amount"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("G/L Budget Entry".Amount WHERE("G/L Account No." = const('2110103')));
        }
        field(33; "Housing Fund"; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Period Transactions".Amount where("Transaction Code" = const('HELVY'), "Payroll Period" = field("PayPeriod Filter")));
        }
        field(34; NITA; Decimal)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = sum("PR Employer Deductions".Amount where("Transaction Code" = field("NITA Code"), "Payroll Period" = field("PayPeriod Filter")));
        }
        //Departments\Centers PCs (80366, List)

        field(35; "Directors PAS"; Integer)
        {
            Caption = 'PMMU';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Perfomance Contract Header"
            where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental)));
        }
        field(36; "Deputy Directors PAS"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental),
            // "Target Type" = const(Director)));
        }
        field(37; "Assistant Directors PAS"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental),
            // "Target Type" = const("Assistant Director")));
        }
        field(38; "Head of Section PAS"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Departmental),
            // "Target Type" = const("Head of Section")));
        }
        field(39; "Individual Targets PAS"; Integer)
        {
            Caption = 'Performance Appraisal System';
            BlankZero = true;
            FieldClass = FlowField;
            // CalcFormula = count("Perfomance Contract Header"
            // where("Document Type" = const("Individual Scorecard"), "Score Card Type" = const(Staff),
            // "Target Type" = const("Individual Targets")));
        }
        field(40; "Suspended Employees"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Employee Status 2" = const(Suspension)));
        }
        field(41; "Interdicted Employees"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Employee Status 2" = const(Interdiction)));
        }
        field(42; "Dismissed Employees"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee" where("Employee Status 2" = const(Dismissal)));
        }
        field(43; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = const(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(44; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
        field(45; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }
        field(46; "Open Appraisal"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Perfomance Evaluation" where("Created By" = field("User ID Filter"),
            "Approval Status" = filter(<> Released)));
        }
        field(47; "Released Appraisal"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Perfomance Evaluation" where("Created By" = field("User ID Filter"),
            "Approval Status" = filter(Released)));
        }
        field(48; Directorates; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Responsibility Center" where("Operating Unit Type" = filter(Directorate)));
        }
        field(49; Departments; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Responsibility Center" where("Operating Unit Type" = filter("Department/Center")));
        }
        field(50; Offices; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Responsibility Center" where("Operating Unit Type" = filter(Office)));
        }
        field(51; "Court Stations"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Responsibility Center" where("Operating Unit Type" = filter("Court Stations")));
        }
        field(52; "Duty Stations"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Duty Station" where("Blocked" = filter(false)));
        }
        field(53; "Organization Units"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Responsibility Center" where("Operating Unit Type" = filter("Org Unit")));
        }
        field(54; "Approved Leave"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("HR Leave Application" where(Status = filter(Released), Posted = filter(false)));
        }
        field(55; "Posted Leave"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("HR Leave Application" where(Status = filter(Released), Posted = filter(true)));
        }
        field(56; "Posted Leave Recall"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Leave Application Recall" where(Status = filter(Released), Posted = filter(true)));
        }
        field(57; "Posted Leave Reimbursements"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("HR Leave Allocation Request" where("Application Type" = filter("Re-Imbursement"), Status = filter(Approved), Posted = filter(true)));
        }
        field(58; "PayPeriod Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(59; "Approved Self Initiated"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee Transfers" where(Type = const("Self initiated"), "Document Type" = const(Application),
                            "Status" = filter(Released)));
        }
        field(60; "Approved Management Initiated"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee Transfers" where(Type = const("Management initiated"), "Document Type" = const(Application),
                            "Status" = filter(Released)));
        }
        field(61; "Closed Transfers"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Employee Transfers" where("Document Type" = const(Application),
                            "Status" = filter("HOS Confirmed")));
        }
        field(62; "All Properties"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Fixed Asset" where("Asset Type" = filter(Property)));
        }
        field(63; "Reservation Requests"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Resource Booking Header" where(Status = filter(<> Open)));
        }
        field(64; "Nita Code"; Code[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("PR Vital Setup Info".NITA);
        }
        field(65; "Training Domains"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Training Domains");
        }
        field(66; "Training Courses"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Training Courses Setup" where(Blocked = const(false)));
        }
        field(67; "App Training Applications"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("Training Requests" where(Status = filter(Approved)));
        }
        field(68; "Implementing Unit Filter"; Code[20])
        {
            FieldClass = FlowFilter;
        }

    }

    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    fieldgroups
    {
    }
}

