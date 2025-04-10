PageExtension 52193582 pageextension52193582 extends "FA Ledger Entries" 
{
    layout
    {
        addafter("G/L Entry No.")
        {
            field("FA Posting Group";"FA Posting Group")
            {
                ApplicationArea = Basic;
            }
            
        }
    }
}

