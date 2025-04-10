page 50448 "Supplementary Cons List"
{
    Caption = 'Supplementary Consolidated List';
    CardPageID = "Supplementary Cons Card";
    PageType = List;
    SourceTable = "Budget Consolidation Header";
    SourceTableView = where("Planning Budget Type" = const("Supplementary 2"));


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

