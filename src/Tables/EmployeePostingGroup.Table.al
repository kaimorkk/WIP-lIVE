Table 52193541 "Employee Posting Groups"
{
    DataCaptionFields = "Code",Description;
    DrillDownPageID = "Employee Posting Group111";
    LookupPageID = "Employee Posting Group111";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Salary Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(4;"Income Tax Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(5;"SSF Employer Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(6;"SSF Employee Account";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(7;"Net Salary Payable";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(8;"Operating Overtime";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(9;"Tax Relief";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(10;"Employee Provident Fund Acc.";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(11;"Pay Period Filter";Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll Period";
        }
        field(12;"Pension Employer Acc";Code[20])
        {
        }
        field(13;"Pension Employee Acc";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(14;"Earnings and deductions";Code[20])
        {
        }
        field(15;"Staff Benevolent";Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(16;SalaryExpenseAC;Code[20])
        {
            TableRelation = "G/L Account";
        }
        field(17;DirectorsFeeGL;Code[20])
        {
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
        key(Key2;"Earnings and deductions")
        {
        }
    }

    fieldgroups
    {
    }
}

