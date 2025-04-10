TableExtension 52193503 tableextension52193503 extends "Bank Account Ledger Entry" 
{
    fields
    {

        //Unsupported feature: Property Modification (Data type) on "Description(Field 7)".


        //Unsupported feature: Property Deletion (DataClassification) on ""User ID"(Field 27)".

        field(50001;"Pay Mode";Code[20])
        {
        }
        field(50002;"Cheque Date";Date)
        {
        }
        field(50003;Remarks;Text[50])
        {
        }
        field(50020;"Received From";Code[40])
        {
        }
        field(50021;"On Behalf Of";Text[100])
        {
        }
        field(50022;"Allocated Receipt";Boolean)
        {
        }
    }
    keys
    {

        //Unsupported feature: Property Insertion (KeyGroups) on ""Bank Account No.","Global Dimension 1 Code","Global Dimension 2 Code","Posting Date"(Key)".

    }
}

