page 57054 "Tariff Codes1"
{
    Editable = true;
    PageType = List;
    SourceTable = "Tariff Codes1";
    Caption = 'Tariff Codes';

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
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Vendor Posting Group"; Rec."Vendor Posting Group")
                {
                    ApplicationArea = Basic, Suite;
                    Tooltip = 'Stores the posting group to post the retention amount to.';
                }
                field("Tax Obligation"; Rec."Tax Obligation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Tax Obligation field.', Comment = '%';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000009; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000010; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

