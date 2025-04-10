PageExtension 52193437 pageextension52193437 extends "Vendor Ledger Entries" 
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Remaining Amt. (LCY)"(Control 49)".

        modify("Message to Recipient")
        {
            Visible = false;
        }
        modify("Payment Method Code")
        {
            Visible = false;
        }
        modify("Payment Reference")
        {
            Visible = false;
        }
        modify("Creditor No.")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Editable) on "Reversed(Control 35)".


        //Unsupported feature: Property Deletion (Editable) on ""Reversed by Entry No."(Control 74)".


        //Unsupported feature: Property Deletion (Editable) on ""Reversed Entry No."(Control 76)".

        modify("Exported to Payment File")
        {
            Visible = false;
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "ReverseTransaction(Action 69)".


        //Unsupported feature: Property Insertion (Visible) on "ReverseTransaction(Action 69)".


        //Unsupported feature: Property Deletion (Scope) on ""Applied E&ntries"(Action 72)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 55)".


        //Unsupported feature: Property Deletion (Scope) on "Dimensions(Action 55)".


        //Unsupported feature: Property Deletion (Scope) on ""Detailed &Ledger Entries"(Action 54)".


        //Unsupported feature: Code Modification on "ActionApplyEntries(Action 36).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            VendLedgEntry.COPY(Rec);
            VendEntryApplyPostEntries.ApplyVendEntryFormEntry(VendLedgEntry);
            Rec := VendLedgEntry;
            CurrPage.UPDATE;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            VendEntryApplyPostEntries.ApplyVendEntryFormEntry(Rec);
            */
        //end;

        //Unsupported feature: Property Deletion (Scope) on "ActionApplyEntries(Action 36)".


        //Unsupported feature: Property Deletion (Scope) on "UnapplyEntries(Action 67)".


        //Unsupported feature: Property Deletion (Scope) on "ReverseTransaction(Action 69)".


        //Unsupported feature: Property Deletion (Scope) on ""&Navigate"(Action 37)".

        
    }
}

