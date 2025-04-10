Table 52193480 "Approvals Set Up"
{
    DrillDownPageID = "Departments List";
    LookupPageID = "Departments List";

    fields
    {
        field(1;"Approval Type";Option)
        {
            OptionCaption = 'Loans,Special Loans,Personal Loans,Refunds,Funeral Expenses,Withdrawals - Resignation,Withdrawals - Death,Branch Loans,Journals,File Movement,Appeal Loans,Personal Loans SPL,Branch Funeral Expenses,Sitting Allowance,Branch Imprest,Transport and Subsistence Allowance,Branch Funds Transfer,Inter-Company,Surcharge,Staff & Committee Expenses,Staff Salary,Staff Deductions,Payroll Journals,Appeal Loans SPL,Payment Voucher,Personal Loans - Appeal,Branch AirTime,Investment Refunds,MFI Refunds,Fosa Personal,Fosa Personal SPL';
            OptionMembers = Loans,"Special Loans","Personal Loans",Refunds,"Funeral Expenses","Withdrawals - Resignation","Withdrawals - Death","Branch Loans",Journals,"File Movement","Appeal Loans","Personal Loans SPL","Branch Funeral Expenses","Sitting Allowance","Branch Imprest","Transport and Subsistence Allowance","Branch Funds Transfer","Inter-Company",Surcharge,"Staff & Committee Expenses","Staff Salary","Staff Deductions","Payroll Journals","Appeal Loans SPL","Payment Voucher","Personal Loans - Appeal","Branch AirTime","Investment Refunds","MFI Refunds","Fosa Personal","Fosa Personal SPL";
        }
        field(2;Stage;Integer)
        {
        }
        field(3;Description;Text[50])
        {
        }
        field(4;Station;Code[50])
        {
        }
        field(5;"Duration (Hr)";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Approval Type",Stage)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

