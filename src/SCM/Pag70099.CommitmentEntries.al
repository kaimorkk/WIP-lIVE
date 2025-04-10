page 70099 "Commitment Entries List"
{
    ApplicationArea = All;
    Caption = 'Commitment Entries';
    PageType = List;
    Editable = false;
    SourceTable = "Commitment Entries";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Commitment Date"; Rec."Commitment Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commitment Date field.', Comment = '%';
                }
                field("Commitment Type"; Rec."Commitment Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Commitment Type field.', Comment = '%';
                }
                field(Account; Rec.Account)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account field.', Comment = '%';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.', Comment = '%';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.', Comment = '%';
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Code field.', Comment = '%';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.', Comment = '%';
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Account No. field.', Comment = '%';
                }
            }
        }
    }
}
