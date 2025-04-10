Table 52193522 "Receipts and Payments Types"
{
    DrillDownPageID = "Receipts and Payments Typex";
    LookupPageID = "Receipts and Payments Typex";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Type;Option)
        {
            OptionMembers = Receipts,Payments;
        }
        field(3;Description;Text[100])
        {
        }
        field(4;"Transaction Type";Option)
        {
            OptionCaption = ' ,Registration Fee,Deposit Contribution,Share Contribution,Loan,Loan Repayment,Withdrawal,Interest Due,Interest Paid,Investment,Dividend Paid,Processing Fee,Withholding Tax,BBF Contribution';
            OptionMembers = " ","Registration Fee","Deposit Contribution","Share Contribution",Loan,"Loan Repayment",Withdrawal,"Interest Due","Interest Paid",Investment,"Dividend Paid","Processing Fee","Withholding Tax","BBF Contribution";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        CustPost: Record "Customer Posting Group";
        GLAcc: Record "G/L Account";
        DimMgt: Codeunit DimensionManagement;


    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        DimMgt.ValidateDimValueCode(FieldNumber,ShortcutDimCode);
        //DimMgt.SaveDefaultDim(DATABASE::Customer,"No.",FieldNumber,ShortcutDimCode);
        Modify;
    end;
}

