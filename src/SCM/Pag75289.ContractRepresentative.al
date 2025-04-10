

page 75289 "Contract Representative"
{
    PageType = List;
    SourceTable = "Contract Representative";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Representative Name"; Rec."Representative Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Representative Name field.';
                }
                field("Designation/Title"; Rec."Designation/Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Designation/Title field.';
                }
                field("Contract Signing Role"; Rec."Contract Signing Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Signing Role field.';
                }
                field("Executed on behalf of"; Rec."Executed on behalf of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Executed on behalf of field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Execution Date"; Rec."Execution Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Execution Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

