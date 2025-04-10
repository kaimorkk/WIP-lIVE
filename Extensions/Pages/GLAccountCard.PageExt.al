PageExtension 52193429 pageextension52193429 extends "G/L Account Card" 
{
    layout
    {
        modify(Totaling)
        {
            Visible = false;
        }
        modify("Omit Default Descr. in Jnl.")
        {
            Visible = false;
        }
        addafter(Totaling)
        {
            field(Type;Type)
            {
                ApplicationArea = Basic;
                Caption = 'Account Category';
            }
        }
        addafter("Direct Posting")
        {
            field("Block Budget Transfer";"Block Budget Transfer")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Last Date Modified")
        {
            field("Effective Date";"Effective Date")
            {
                ApplicationArea = Basic;
            }
            field("Requested By";"Requested By")
            {
                ApplicationArea = Basic;
            }
            field("Employee Code Mandatory";"Employee Code Mandatory")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

