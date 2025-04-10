

page 75152 "Bid Insurance"
{
    PageType = List;
    SourceTable = "Bid Insurance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Type field.';
                }
                field("Policy Cover Type"; Rec."Policy Cover Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Cover Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Policy Start Date"; Rec."Policy Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Start Date field.';
                }
                field("Policy Expiry Date"; Rec."Policy Expiry Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Expiry Date field.';
                }
                field("Issuer Insurance Name"; Rec."Issuer Insurance Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuer Insurance Name field.';
                }
                field("Insurance Address"; Rec."Insurance Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Address field.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy No. field.';
                }
                field("Policy Coverage (LCY)"; Rec."Policy Coverage (LCY)")
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

