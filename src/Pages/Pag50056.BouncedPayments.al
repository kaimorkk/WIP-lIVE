namespace ALProjectLIWPA.ALProjectLIWPA;


page 50056 "Bounced Payments"
{
    ApplicationArea = All;
    Caption = 'Bounced Payments';
    PageType = List;
    SourceTable = payments;
    SourceTableView = where("Document Type" = filter("Bounced Payment Voucher"));

    UsageCategory = Lists;
    CardPageId = "Bounced Payment";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field("PV Type"; Rec."PV Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PV Type field.', Comment = '%';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.', Comment = '%';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }

                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }
}
