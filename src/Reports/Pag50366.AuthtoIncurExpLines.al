page 50366 "Auth to Incur Exp. Lines"
{
    Caption = 'AIE Lines';
    PageType = ListPart;
    SourceTable = "Auth. Inc Expend. Line";
    AutoSplitKey = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Shortcut Dimension 6 Code"; Rec."Shortcut Dimension 6 Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 6 Code field.';
                }
                field("Shortcut Dimension 7 Code"; Rec."Shortcut Dimension 7 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 7 Code field.';
                }
                field("Shortcut Dimension 8 Code"; Rec."Shortcut Dimension 8 Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 8 Code field.';
                }
                field("Planned Amount"; Rec."Planned Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Planned Amount field.';
                }
                field("Amount to Authorize"; Rec."Amount to Authorize")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount to Authorize field.';
                    Editable = AmountEditable;
                }
                field("Utilized Amounts"; Rec."Utilized Amounts")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Utilized Amounts field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        AmountEditable := false;
        CMS.Get;
        AmountEditable := CMS."Allow AIE Edit";

    end;

    trigger OnAfterGetCurrRecord()
    begin
        AmountEditable := false;
        CMS.Get;
        AmountEditable := CMS."Allow AIE Edit";
    end;

    var
        AmountEditable: Boolean;
        CMS: Record "Cash Management Setup";
}
