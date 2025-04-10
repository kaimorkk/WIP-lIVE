Table 52193520 "Transactions Type"
{
    DrillDownPageID = "Transactions Type";
    LookupPageID = "Transactions Type";

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;Description;Text[100])
        {
        }
        field(4;Type;Option)
        {
            OptionCaption = ',Contribution,Loan,Repayment,Other';
            OptionMembers = ,Contribution,Loan,Repayment,Other;
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
        fieldgroup(DropDown;Description)
        {
        }
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

