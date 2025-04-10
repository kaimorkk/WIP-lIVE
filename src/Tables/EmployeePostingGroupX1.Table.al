Table 52193840 "Employee Posting GroupX1"
{
    DataCaptionFields = "Code",Description;
    DrillDownPageID = "Employee Posting Group";
    LookupPageID = "Employee Posting Group";

    fields
    {
        field(1;"Code";Code[10])
        {
            NotBlank = true;
        }
        field(2;Description;Text[50])
        {
        }
        field(3;"Salary Account";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(4;"Income Tax Account";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(5;"SSF Employer Account";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(6;"SSF Employee Account";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(7;"Net Salary Payable";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(8;"Operating Overtime";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(9;"Tax Relief";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(10;"Employee Provident Fund Acc.";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(11;"Pay Period Filter";Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX1";
        }
        field(12;"Pension Employer Acc";Code[10])
        {
        }
        field(13;"Pension Employee Acc";Code[10])
        {
        }
        field(14;"Earnings and deductions";Code[10])
        {
        }
        field(15;"Daily Salary";Decimal)
        {
            FieldClass = Normal;
        }
        field(16;"Normal Overtime";Decimal)
        {
            FieldClass = Normal;
        }
        field(17;"Weekend Overtime";Decimal)
        {
            FieldClass = Normal;
        }
        field(18;"Enterprise Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(19;"Activity Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(20;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(21;Seasonals;Boolean)
        {
        }
        field(50000;"Employee Type";Option)
        {
            OptionCaption = ' ,Parmanent,Seconded,Temporary,Contract,Intern';
            OptionMembers = " ",Parmanent,Seconded,"Temporary",Contract,Intern;
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

