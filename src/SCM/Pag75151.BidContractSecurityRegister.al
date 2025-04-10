

page 75151 "Bid_Contract Security Register"
{
    PageType = List;
    SourceTable = "Bid_Contract Security Register";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form of Security field.';
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor No. field.';
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Type field.';
                }
                field("Issuer Institution Type"; Rec."Issuer Institution Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Institution Type field.';
                }
                field("Issuer/Guarantor Name"; Rec."Issuer/Guarantor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer/Guarantor Name field.';
                }
                field("Issuer Registered Offices"; Rec."Issuer Registered Offices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Registered Offices field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Security Amount (LCY)"; Rec."Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Amount (LCY) field.';
                }
                field("Bid Security Effective Date"; Rec."Bid Security Effective Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bid Security Effective Date';
                    Description = 'Bid Security Effective Date';
                    ToolTip = 'Specifies the value of the Bid Security Effective Date field.';
                }
                field("Bid Security Validity Expiry"; Rec."Bid Security Validity Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Security Validity Expiry Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

