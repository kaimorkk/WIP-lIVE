page 50450 "AIE Consolidations"
{
    Caption = 'AIE Consolidations';
    PageType = List;
    SourceTable = "Batch. Auth to Incur Expend";
    UsageCategory = None;
    Editable = false;
    DeleteAllowed = false;
    CardPageID = "AIE Consolidation";
    SourceTableView = where("Document Type" = const(Consolidated));


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
                field(Description; Description)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Corporate Strategy"; "Corporate Strategy")
                {

                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Period"; "Reporting Period")
                {

                    ApplicationArea = Basic, Suite;
                }
                field("Budget Code"; "Budget Code")
                {

                    ApplicationArea = Basic, Suite;
                }
                field("Posted"; "Posted")
                {

                    ApplicationArea = Basic, Suite;
                }
                field("Amount to Authorize"; Rec."Amount to Authorize")
                {

                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
}
