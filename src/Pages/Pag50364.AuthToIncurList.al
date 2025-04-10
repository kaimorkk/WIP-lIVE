page 50364 "Auth. To Incur List"
{
    Caption = 'AIE List';
    PageType = List;
    SourceTable = "Auth. Inc. Expend. Header";
    UsageCategory = None;
    SourceTableView = where(Type = const(Default));
    Editable = false;
    //DeleteAllowed = false;
    CardPageId = "Auth. to Incur Header";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; "No.")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic, Suite;
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
                field("Amount to Authorize"; Rec."Amount to Authorize")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount to Authorize field.';
                }

                field("Reporting Period"; Rec."Reporting Period")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Workplan; Rec.Workplan)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Budget Code"; Rec."Budget Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Quarter"; Rec.Quarter)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
}
