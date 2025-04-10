

page 59134 "Blocked Vehicle Insurance"
{
    CardPageID = "Vehicle Insurance Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = Insurance;
    SourceTableView = where(Blocked = const(true));
    UsageCategory = History;
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
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date from which the insurance policy is valid.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date to which the insurance policy is valid.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the insurance policy number as stated on the actual insurance policy.';
                }
                field("Annual Premium"; Rec."Annual Premium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount of the annual insurance premium.';
                }
                field("Total Value Insured"; Rec."Total Value Insured")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the total value of fixed assets linked to this insurance policy. This is the value of fixed assets for which insurance is required.';
                }
                field("Insurance Type"; Rec."Insurance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type of insurance (for example, theft or fire) that is covered by this insurance policy.';
                }
                // field("Registration No."; Rec."Registration No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Registration No. field.';
                // }
                // field("FA No."; Rec."FA No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

