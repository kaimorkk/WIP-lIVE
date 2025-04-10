page 50362 "Batch Auth To Incur Exp Lines"
{
    Caption = 'Batch AIE Lines';
    PageType = ListPart;
    SourceTable = "Auth. Inc. Expend. Header";
    SourceTableView = where("Approval Status" = const(Released));
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Corporate Strategy"; Rec."Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Period"; Rec."Reporting Period")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Budget Code field.';
                }
                field(Quarter; Rec.Quarter)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quarter field.';
                }
                field(Workplan; Rec.Workplan)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workplan field.';
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

                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Amount to Authorize"; Rec."Amount to Authorize")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount to Authorize field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            group(Lines)
            {
                action("Open Card")
                {
                    ApplicationArea = Basic, Suite;
                    Image = Open;
                    RunObject = Page "Auth. to Incur Header";
                    RunPageLink = "No." = field("No.");
                }
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Default;
    end;
}
