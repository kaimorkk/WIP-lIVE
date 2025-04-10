

page 59132 "Vehicle Insurance Due Expiry"
{
    CardPageID = "Vehicle Insurance Card";
    PageType = List;
    SourceTable = Insurance;
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Premium"; Rec."Annual Premium")
                {
                    ApplicationArea = Basic;
                }
                field("Total Value Insured"; Rec."Total Value Insured")
                {
                    ApplicationArea = Basic;
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                }
                // field("Registration No."; Rec."Registration No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("FA No."; Rec."FA No.")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

