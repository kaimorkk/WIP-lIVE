#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 80528 "Budget Rev Consolidation List"
{
    ApplicationArea = Basic;
    Caption = 'Budget Revision Consolidation List';
    CardPageID = "Budget RevConsolidation Header";
    Editable = false;
    PageType = List;
    SourceTable = "Budget Consolidation Header";
    SourceTableView = where("Planning Budget Type" = const(Supplementary),
                            "Document Status" = const(Draft));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Code)
                {
                    ApplicationArea = Basic;
                }
                field("Financial Year"; "Financial Year")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                }
                field("Annual Workplan"; "Annual Workplan")
                {
                    ApplicationArea = Basic;
                }
                field("Current Job"; "Current Job")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Date"; "Creation Date")
                {
                    ApplicationArea = Basic;
                }
                field("Creation Time"; "Creation Time")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; "Created By")
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

