PageExtension 52193466 pageextension52193466 extends "General Ledger Setup"
{
    layout
    {
        addafter("Inv. Rounding Type (LCY)")
        {
            field("Tax Rounding Precision (LCY)"; Rec."Tax Rounding Precision (LCY)")
            {
                ApplicationArea = Basic;
            }
            field("Tax Rounding Type (LCY)"; Rec."Tax Rounding Type (LCY)")
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Application)
        {
            group("Customized Number Series")
            {
                field("File Movement Nos"; Rec."File Movement Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Reallocation Nos."; Rec."Budget Reallocation Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Reallocation Consolidation Nos"; Rec."Reallocation Consolidation Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reallocation Consolidation Nos field.', Comment = '%';
                }
                field("Supplementary Budget Nos"; Rec."Supplementary Budget Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supplementary Budget Nos field.', Comment = '%';
                }
                field("Imprest Nos"; "Imprest Nos")
                {
                    ApplicationArea = all;
                }
                field("Claim Nos"; "Claim Nos")
                {
                    ApplicationArea = all;
                }
                field("Petty Cash Nos"; "Petty Cash Nos")
                {
                    ApplicationArea = all;
                }
                field("Posted Receipts No"; "Posted Receipts No")
                {
                    ApplicationArea = all;
                }
                field("Payment Vouchers No"; "Payment Vouchers No")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

#pragma implicitwith restore

