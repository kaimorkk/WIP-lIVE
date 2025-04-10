

page 69276 "Hr Asset Transfer Lines"
{
    DeleteAllowed = false;
    PageType = ListPart;
    SourceTable = "HR Asset Transfer Lines";

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
                field("Asset No."; Rec."Asset No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset No. field.';
                }
                field("Asset Bar Code"; Rec."Asset Bar Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Bar Code field.';
                }
                field("Asset Description"; Rec."Asset Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Description field.';
                }
                field("FA Location"; Rec."FA Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Location field.';
                }
                field("Asset Serial No"; Rec."Asset Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Serial No field.';
                }
                field("Responsible Employee Code"; Rec."Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Employee Code field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("New Responsible Employee Code"; Rec."New Responsible Employee Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Responsible Employee Code field.';
                }
                field("New Employee Name"; Rec."New Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Employee Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Project Code field.';
                }
                field("Dimension 1 Name"; Rec."Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Project Name field.';
                }
                field("New Global Dimension 1 Code"; Rec."New Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Project Code field.';
                }
                field("New  Dimension 1 Name"; Rec."New  Dimension 1 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Project Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Department Code field.';
                }
                field("Dimension 2 Name"; Rec."Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Department Name field.';
                }
                field("New Global Dimension 2 Code"; Rec."New Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Department Code field.';
                }
                field("New  Dimension 2 Name"; Rec."New  Dimension 2 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Department Name field.';
                }
                field("Global Dimension 3 Code"; Rec."Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Station Code field.';
                }
                field("Dimension 3 Name"; Rec."Dimension 3 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Station Name field.';
                }
                field("New Global Dimension 3 Code"; Rec."New Global Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Station Code field.';
                }
                field("New  Dimension 3 Name"; Rec."New  Dimension 3 Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Station Name field.';
                }
                field("Is Asset Expected Back?"; Rec."Is Asset Expected Back?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Is Asset Expected Back? field.';
                }
                field("New Asset Location"; Rec."New Asset Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Asset Location field.';
                }
                field("Reason for Transfer"; Rec."Reason for Transfer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Transfer field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

