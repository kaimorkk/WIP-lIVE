

page 80175 "Policy Management Setup"
{
    PageType = Card;
    SourceTable = "Policy Management Setup";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Internal Policy Development"; Rec."Internal Policy Development")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Policy No. Series"; Rec."Internal Policy No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("External Policy No. Series"; Rec."External Policy No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Revision No. Series"; Rec."Policy Revision No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Attestation No. Series"; Rec."Policy Attestation No. Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy circulation No. Series';
                }
                field("Policy Compliance Audit Nos"; Rec."Policy Compliance Audit Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Enable Email Alerts"; Rec."Enable Email Alerts")
                {
                    ApplicationArea = Basic;
                }
                field("Notification Email"; Rec."Notification Email")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

