TableExtension 52193435 tableextension52193435 extends "Vendor Ledger Entry" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on "Amount(Field 13)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Amount (LCY)"(Field 17)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Debit Amount"(Field 58)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Credit Amount"(Field 59)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Debit Amount (LCY)"(Field 60)".


        //Unsupported feature: Property Modification (CalcFormula) on ""Credit Amount (LCY)"(Field 61)".


        //Unsupported feature: Property Insertion (Numeric) on ""Creditor No."(Field 170)".


        //Unsupported feature: Property Modification (Data type) on ""Message to Recipient"(Field 289)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 27)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Closed by Currency Amount"(Field 66)".


        //Unsupported feature: Deletion on ""Payment Method Code"(Field 172).OnValidate".

        field(50000;"Group Code";Code[20])
        {
        }
    }
    keys
    {

        //Unsupported feature: Property Insertion (SIFTLevelsToMaintain) on ""Vendor No.","Posting Date","Currency Code"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""Vendor No.","Currency Code","Posting Date"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""Vendor No.","Global Dimension 1 Code","Global Dimension 2 Code","Posting Date","Currency Code"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""Vendor No.",Open,"Global Dimension 1 Code","Global Dimension 2 Code",Positive,"Due Date","Currency Code"(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""Open,""Global Dimension 1 Code"",""Global Dimension 2 Code"",""Due Date"""(Key)".


        //Unsupported feature: Property Insertion (KeyGroups) on ""Document Type","Vendor No.","Global Dimension 1 Code","Global Dimension 2 Code","Posting Date","Currency Code"(Key)".

    }

    var
        Text000: label 'must have the same sign as %1';
        Text001: label 'must not be larger than %1';
}

