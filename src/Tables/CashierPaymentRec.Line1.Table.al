Table 52193600 "Cashier Payment Rec. Line1"
{

    fields
    {
        field(1; No; Code[20])
        {
            TableRelation = Receipts.No;
        }
        field(2; "Transaction Type"; Option)
        {
            OptionCaption = ' ,Registration Fee,Loan,Repayment,Withdrawal,Interest Due,Interest Paid,Insurance Contribution,Shares Contribution,Loan Penalty,Application Fee,Appraisal Fee,Investment,Unallocated Funds,IESA Contribution,IESA Interest,Deposit Contribution';
            OptionMembers = " ","Registration Fee",Loan,Repayment,Withdrawal,"Interest Due","Interest Paid","Insurance Contribution","Shares Contribution","Loan Penalty","Application Fee","Appraisal Fee",Investment,"Unallocated Funds","IESA Contribution","IESA Interest","Deposit Contribution";
        }
        field(3; Amount; Decimal)
        {
        }
        field(4; "Loan No."; Code[20])
        {
            // //TableRelation = Loans."Loan No." where ("Member No."=field("Member No."));
        }
        field(5; "Member No."; Code[20])
        {
            TableRelation = if ("Account Type" = const("G/L Account")) "G/L Account"
            else if ("Account Type" = const(Customer)) Customer
            else if ("Account Type" = const(Vendor)) Vendor;
        }
        field(6; "Account Type"; Option)
        {
            OptionCaption = ' ,Customer,G/L Account,Vendor';
            OptionMembers = " ",Customer,"G/L Account",Vendor;
        }
        field(7; numberfilter; Code[20])
        {
            FieldClass = FlowFilter;
        }
        field(8; "Loan Type"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        cashierr: Record Receipts;
    // LOAN: Record Loans;
    // type: Record "Loan Repayment Schedule";
}

