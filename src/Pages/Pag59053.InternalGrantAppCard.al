

page 59053 "Internal Grant App Card"
{
    PageType = Card;
    SourceTable = "Internal Grants Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Fund Opportunity"; Rec."Fund Opportunity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Opportunity field.';
                }
                field("Fund Name"; Rec."Fund Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Fund Name field.';
                }
                field("PI No"; Rec."PI No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI No field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the PI Name field.';
                }
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Applied field.';
                }
                field("Application Send"; Rec."Application Send")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Send field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

