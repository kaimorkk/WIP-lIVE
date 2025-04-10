

page 69104 "Approved Welfare Memberships"
{
    CardPageID = "App Welfare  Membership";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Hr Welfare Header";
    SourceTableView = where("Welfare Type" = filter(Application),
                            Status = const(Released));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Welfare No. field.';
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Welfare Type field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raisee Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Welfare Category"; Rec."Welfare Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Welfare Category field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

