PageExtension 52193466 pageextension52193466 extends "General Ledger Setup" 
{
    layout
    {

       
        addafter("Bank Account Nos.")
        {
            field("Receipt No";"Receipt No")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Nos";"Imprest Nos")
            {
                ApplicationArea = Basic;
            }
            field("PV Nos";"PV Nos")
            {
                ApplicationArea = Basic;
            }
            field("Claim Nos";"Claim Nos")
            {
                ApplicationArea = Basic;
            }
            field("Payments No";"Payments No")
            {
                ApplicationArea = Basic;
            }
        }
      
    }
}

