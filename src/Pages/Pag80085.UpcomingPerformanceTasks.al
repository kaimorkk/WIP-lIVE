

page 80085 "Upcoming Performance Tasks"
{
    CardPageID = "Performance Plan Task";
    PageType = List;
    SourceTable = "Performance Plan Task";
    SourceTableView = where("Closed?" = const(false),
                            "Published?" = const(true));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Task Code"; Rec."Task Code")
                {
                    ApplicationArea = Basic;
                }
                field("Task Category"; Rec."Task Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle Start Date"; Rec."Performance Cycle Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle End Date"; Rec."Performance Cycle End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Start Date"; Rec."Processing Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Due Date"; Rec."Processing Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Published?"; Rec."Published?")
                {
                    ApplicationArea = Basic;
                }
                field("Closed?"; Rec."Closed?")
                {
                    ApplicationArea = Basic;
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                }
                field("No of Evaluations/Appeals"; Rec."No of Evaluations/Appeals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

