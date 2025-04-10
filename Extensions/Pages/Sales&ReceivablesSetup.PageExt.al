PageExtension 52193503 pageextension52193503 extends "Sales & Receivables Setup" 
{
    layout
    {
        modify("Allow Document Deletion Before")
        {
            Visible = false;
        }
        addafter("Customer Nos.")
        {
            field("ICT Helpdesk Nos."; Rec."ICT Helpdesk Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Disposal No."; Rec."Disposal No.")
            {
                ApplicationArea = Basic;
            }
            field("Claim Nos.";"Claim Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Accounting Nos.";"Imprest Accounting Nos.")
            {
                ApplicationArea = Basic;
            }
            field("Imprest Nos.";"Imprest Nos.")
            {
                ApplicationArea = Basic;
            }
        }
    }
}

