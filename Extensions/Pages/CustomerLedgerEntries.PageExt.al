PageExtension 52193434 pageextension52193434 extends "Customer Ledger Entries" 
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on ""Remaining Amt. (LCY)"(Control 49)".

        modify("Payment Method Code")
        {

            //Unsupported feature: Property Modification (SourceExpr) on ""Payment Method Code"(Control 3)".


            //Unsupported feature: Property Modification (Name) on ""Payment Method Code"(Control 3)".

            Caption = 'Cheque No.';
        }
        modify("Message to Recipient")
        {
            Visible = false;
        }

        //Unsupported feature: Property Deletion (Editable) on "Reversed(Control 35)".


        //Unsupported feature: Property Deletion (Editable) on ""Reversed by Entry No."(Control 71)".


        //Unsupported feature: Property Deletion (Editable) on ""Reversed Entry No."(Control 75)".

        modify("Exported to Payment File")
        {
            Visible = false;
        }
        modify("Direct Debit Mandate ID")
        {
            Visible = false;
        }
        addafter("Entry No.")
        {
            field("Transaction Type";"Transaction Type")
            {
                ApplicationArea = Basic;
            }
        }
        moveafter("Document No.";"Payment Method Code")
    }
    actions
    {

        //Unsupported feature: Property Modification (Name) on "ReverseTransaction(Action 66)".


        //Unsupported feature: Property Insertion (Visible) on "ReverseTransaction(Action 66)".


        //Unsupported feature: Property Deletion (Scope) on ""Reminder/Fin. Charge Entries"(Action 25)".


        //Unsupported feature: Property Deletion (Scope) on ""Applied E&ntries"(Action 69)".


        //Unsupported feature: Property Deletion (AccessByPermission) on "Dimensions(Action 51)".


        //Unsupported feature: Property Deletion (Scope) on "Dimensions(Action 51)".


        //Unsupported feature: Property Deletion (Scope) on ""Detailed &Ledger Entries"(Action 52)".



        //Unsupported feature: Code Modification on ""Apply Entries"(Action 36).OnAction".

        //trigger OnAction()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            CustLedgEntry.COPY(Rec);
            CustEntryApplyPostEntries.ApplyCustEntryFormEntry(CustLedgEntry);
            Rec := CustLedgEntry;
            CurrPage.UPDATE;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            CustEntryApplyPostEntries.ApplyCustEntryFormEntry(Rec);
            */
        //end;

        //Unsupported feature: Property Deletion (Scope) on ""Apply Entries"(Action 36)".


        //Unsupported feature: Property Deletion (Scope) on "UnapplyEntries(Action 64)".


        //Unsupported feature: Property Deletion (Scope) on "ReverseTransaction(Action 66)".


        //Unsupported feature: Property Deletion (Scope) on ""&Navigate"(Action 37)".

        
    }
}

