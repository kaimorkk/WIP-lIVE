table 52194012 "PR Employee Posting Groups"
{
    DataCaptionFields = "Code", Description;
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
        }
        field(2; Description; Text[50])
        {
        }
        field(3; "Salary Account"; Code[100])
        {
            TableRelation = "G/L Account";
        }
        field(4; "Income Tax Account"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(5; "SSF Employer Account"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(6; "SSF Employee Account"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(7; "Net Salary Payable"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(8; "Operating Overtime"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(9; "Tax Relief"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(10; "Employee Provident Fund Acc."; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(11; "Pay Period Filter"; Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "PR Payroll Periods"."Date Opened";
        }
        field(12; "Pension Employer Acc"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(13; "Pension Employee Acc"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(14; "Earnings and deductions"; Code[50])
        {
        }
        field(15; "Staff Benevolent"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(16; SalaryExpenseAC; Code[100])
        {
            TableRelation = "G/L Account";
        }
        field(17; DirectorsFeeGL; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(18; StaffGratuity; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(19; "NHIF Employee Account"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(21; "Payslip Report"; Integer)
        {
        }
        field(22; "Tax Code"; Code[20])
        {
        }
        field(23; "Employment Tax Debit"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(24; "Employment Tax Credit"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(25; "Housing Levy Employer Account"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(26; "Housing Levy Employee Account"; Code[50])
        {
            TableRelation = "G/L Account";
        }
        field(70093; "Employee Category Type"; Option)
        {
            OptionCaption = '"...",Attachee,Casual,Intern,Judge,Judicial Officer,Judicial Staff,Pupillage,Temporary';
            OptionMembers = "...",Attachee,Casual,"Intern","Judge","Judicial Officer","Judicial Staff","Pupillage","Temporary";
        }
        field(70094; "Retirement Age"; DateFormula)
        {
        }
        field(70095; "PWD Retirement Age"; DateFormula)
        {
        }
        field(70096; "Pays NSSF"; Boolean)
        {
        }
        field(70097; "Pays NHIF"; Boolean)
        {
        }
        field(70098; "Pays PAYE"; Boolean)
        {
        }
        field(70099; "PAYE Relief?"; Boolean)
        {
        }
        field(70100; "De-Activate Personal Relief?"; Boolean)
        {
        }
        field(70101; "Gratuity Perc."; Decimal)
        {
        }

        field(70102; "PWD Certificate?"; Boolean)
        {

        }
        field(69021; "Has Insurance Relief"; Boolean)
        {
            InitValue = true;
        }
        field(69022; "Pays NITA"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
        key(Key2; "Earnings and deductions")
        {
        }
    }

    fieldgroups
    {
    }
}

