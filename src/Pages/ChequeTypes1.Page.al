Page 52193551 "Cheque Types1"
{
    ApplicationArea = Basic;
    Caption = 'Cheque Types';
    PageType = List;
    SourceTable = "Cheque Types";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ClearingDays;"Clearing Days")
                {
                    ApplicationArea = Basic;
                }
                field(Control1000000005;"Clearing  Days")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingCharges;"Clearing Charges")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingChargesGLAccount;"Clearing Charges GL Account")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingChargeCode;"Clearing Charge Code")
                {
                    ApplicationArea = Basic;
                }
                field(ClearingBankAccount;"Clearing Bank Account")
                {
                    ApplicationArea = Basic;
                }
                field(BankName;"Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field(ExpressChequeCharges;"Express Cheque Charges")
                {
                    ApplicationArea = Basic;
                }
                field(SpecialClearingDays;"Special Clearing Days")
                {
                    ApplicationArea = Basic;
                }
                field(SpecialClearingCharges;"Special Clearing Charges")
                {
                    ApplicationArea = Basic;
                }
                field(BouncedCharges;"Bounced Charges")
                {
                    ApplicationArea = Basic;
                }
                field(BouncedChargesGLAccount;"Bounced Charges GL Account")
                {
                    ApplicationArea = Basic;
                }
                field(Percentage;Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Use;"Use %")
                {
                    ApplicationArea = Basic;
                }
                field(OfAmount;"% Of Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000022;Notes)
            {
            }
            systempart(Control1000000021;MyNotes)
            {
            }
            systempart(Control1000000020;Links)
            {
            }
        }
    }

    actions
    {
    }
}

