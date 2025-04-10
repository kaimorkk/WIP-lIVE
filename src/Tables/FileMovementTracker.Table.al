Table 52193487 "File Movement Tracker"
{
    DrillDownPageID = "File Movement Tracker";
    LookupPageID = "File Movement Tracker";

    fields
    {
        field(1;"Member No.";Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2;"Approval Type";Option)
        {
            OptionCaption = 'Loans,Special Loans,Personal Loans,Refunds,Funeral Expenses,Withdrawals - Resignation,Withdrawals - Death,Branch Loans,Journals,File Movement,Appeal Loans,Personal Loans SPL,Branch Funeral Expenses,Sitting Allowance,Postage Imprest,Transport and Subsistence Allowance,Branch Funds Transfer,Inter-Company,Surcharge,Staff & Committee Expenses,Staff Salary,Staff Deductions,Payroll Journals,Appeal Loans SPL,Payment Voucher,Personal Loans - Appeal';
            OptionMembers = Loans,"Special Loans","Personal Loans",Refunds,"Funeral Expenses","Withdrawals - Resignation","Withdrawals - Death","Branch Loans",Journals,"File Movement","Appeal Loans","Personal Loans SPL","Branch Funeral Expenses","Sitting Allowance","Postage Imprest","Transport and Subsistence Allowance","Branch Funds Transfer","Inter-Company",Surcharge,"Staff & Committee Expenses","Staff Salary","Staff Deductions","Payroll Journals","Appeal Loans SPL","Payment Voucher","Personal Loans - Appeal";
        }
        field(3;Stage;Integer)
        {
        }
        field(4;Remarks;Text[250])
        {
        }
        field(5;Status;Option)
        {
            OptionCaption = 'Being Processed,Approved,Rejected';
            OptionMembers = "Being Processed",Approved,Rejected;
        }
        field(6;"Current Location";Boolean)
        {
        }
        field(7;"Date/Time In";DateTime)
        {
        }
        field(8;"Date/Time Out";DateTime)
        {
        }
        field(9;"USER ID";Code[20])
        {
        }
        field(10;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(11;Description;Text[50])
        {
        }
        field(12;Station;Code[50])
        {
        }
        field(13;"File Type";Option)
        {
            OptionMembers = " ",Member,ELD,DHB;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"Member No.","Approval Type","Entry No.",Stage)
        {
            Clustered = true;
        }
        key(Key3;"Member No.","Current Location")
        {
        }
    }

    fieldgroups
    {
    }
}

