TableExtension 52193555 tableextension52193555 extends "Detailed Vendor Ledg. Entry" 
{
    fields
    {

        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 11)".


        //Unsupported feature: Deletion (FieldCollection) on ""Ledger Entry Amount"(Field 43)".

        field(50000;"Group Code";Code[20])
        {
        }
        field(50001;"Group Account";Code[20])
        {
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // 
        // //Unsupported feature: Property Insertion (SumIndexFields) on ""Entry No."(Key)".
        // 
        // 
        // //Unsupported feature: Property Modification (SumIndexFields) on ""Vendor Ledger Entry No.","Entry Type","Posting Date"(Key)".
        // 
        // 
        // //Unsupported feature: Property Insertion (MaintainSIFTIndex) on ""Vendor Ledger Entry No.","Entry Type","Posting Date"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Ledger Entry Amount","Vendor Ledger Entry No.","Posting Date"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Initial Document Type","Entry Type","Vendor No.","Currency Code","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Posting Date"(Key)".
        // 
        // 
        // //Unsupported feature: Deletion (KeyCollection) on ""Vendor No.","Currency Code","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Initial Entry Due Date","Posting Date"(Key)".
        // 
        // key(Key1;"Vendor No.","Initial Entry Due Date","Posting Date","Currency Code")
        // {
        // MaintainSIFTIndex = false;
        // SumIndexFields = Amount,"Amount (LCY)","Debit Amount","Credit Amount","Debit Amount (LCY)","Credit Amount (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key2;"Vendor No.","Initial Entry Due Date","Posting Date")
        // {
        // MaintainSQLIndex = false;
        // SumIndexFields = Amount,"Amount (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key3;"Vendor No.","Posting Date","Entry Type","Currency Code")
        // {
        // SumIndexFields = Amount,"Amount (LCY)","Debit Amount","Debit Amount (LCY)","Credit Amount","Credit Amount (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key4;"Vendor No.","Initial Document Type","Document Type","Entry Type","Posting Date")
        // {
        // SumIndexFields = Amount,"Amount (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key5;"Vendor No.","Initial Entry Due Date","Posting Date","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Currency Code")
        // {
        // Enabled = false;
        // SumIndexFields = Amount,"Amount (LCY)","Debit Amount","Credit Amount","Debit Amount (LCY)","Credit Amount (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key6;"Vendor No.","Posting Date","Entry Type","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2","Currency Code")
        // {
        // Enabled = false;
        // SumIndexFields = Amount,"Amount (LCY)";
        // }
        // Unsupported feature: Key containing base fields
        // key(Key7;"Vendor No.","Initial Document Type","Document Type","Entry Type","Initial Entry Global Dim. 1","Initial Entry Global Dim. 2")
        // {
        // Enabled = false;
        // SumIndexFields = Amount,"Amount (LCY)";
        // }
    }
}

