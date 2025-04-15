namespace ALProjectLIWPA.ALProjectLIWPA;
page 50008 "Receipts and Payment Types"
{
    PageType = List;
    SourceTable = "Receipts and Payment Types1";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account no"; Rec."Account no")
                {
                    ApplicationArea = Basic;
                }
                field("Refund Policy"; Rec."Refund Policy")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Refund Policy field.', Comment = '%';
                }
                field("VAT Withheld Code"; Rec."VAT Withheld Code")
                {
                    ApplicationArea = Basic;
                }
                field("Retention Code"; Rec."Retention Code")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("VAT Chargeable"; Rec."VAT Chargeable")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Chargeable"; Rec."Withholding Tax Chargeable")
                {
                    ApplicationArea = Basic;
                }
                field("VAT Code"; Rec."VAT Code")
                {
                    ApplicationArea = Basic;
                }
                field("Withholding Tax Code"; Rec."Withholding Tax Code")
                {
                    ApplicationArea = Basic;
                }
                field("Default Grouping"; Rec."Default Grouping")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }

                field("Pending Voucher"; Rec."Pending Voucher")
                {
                    ApplicationArea = Basic;
                }
                field("Transation Remarks"; Rec."Transation Remarks")
                {
                    ApplicationArea = Basic;
                }
                field("Appear on Imprest?"; Rec."Appear on Imprest?")
                {
                    ApplicationArea = Basic;
                }

                field(Forfeiture; Rec.Forfeiture)
                {
                    ApplicationArea = Basic;
                }

                field("Full Refund"; Rec."Full Refund")
                {
                    ApplicationArea = Basic;
                }

                field("Full Utilization"; Rec."Full Utilization")
                {
                    ApplicationArea = Basic;
                }
                field("Partial Utilization"; Rec."Partial Utilization")
                {
                    ApplicationArea = Basic;
                }
                field("Deposit Account No."; Rec."Deposit Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

