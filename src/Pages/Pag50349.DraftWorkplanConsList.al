page 50349 "Draft Workplan Cons. List"
{
    ApplicationArea = Basic;
    Caption = 'Consolidation List';
    CardPageID = "Draft Workplan Cons. Card";
    PageType = List;
    SourceTable = "Budget Consolidation Header";
    SourceTableView = where("Planning Budget Type" = filter(Supplementary | "Supplementary 2"));
    UsageCategory = History;
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Caption = 'No.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Corporate Strategy"; "Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}
