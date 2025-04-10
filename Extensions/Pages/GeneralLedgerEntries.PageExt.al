PageExtension 52193431 pageextension52193431 extends "General Ledger Entries" 
{
    layout
    {
        modify(Quantity)
        {

            //Unsupported feature: Property Modification (SourceExpr) on "Quantity(Control 5)".


            //Unsupported feature: Property Modification (Name) on "Quantity(Control 5)".

            Caption = 'Cheque No.';
        }

        //Unsupported feature: Property Deletion (Visible) on "Quantity(Control 5)".

        addafter("Bal. Account Type")
        {
            field("Prior-Year Entry";"Prior-Year Entry")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Document No.";Quantity)
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "ReverseTransaction(Action 63)".


        //Unsupported feature: Property Insertion (Visible) on "ReverseTransaction(Action 63)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 49)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "GLDimensionOverview(Action 50)".


        //Unsupported feature: Property Deletion (AccessByPermission) on ""Value Entries"(Action 65)".

        
    }
}

