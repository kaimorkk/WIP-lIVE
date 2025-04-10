PageExtension 52193489 pageextension52193489 extends "Bank Account Ledger Entries" 
{
    layout
    {
        addafter("Document No.")
        {
            field("Cheque No.";"External Document No.")
            {
                ApplicationArea = Basic;
                Caption = 'Cheque No.';
                Visible = false;
            }
        }
    }
}

