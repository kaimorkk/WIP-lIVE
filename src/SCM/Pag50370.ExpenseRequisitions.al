page 50370 "Expense Requisitions"
{
    Caption = 'Expense Requisitions';
    PageType = List;
    SourceTable = "Expense Requisition";
    UsageCategory = None;
    Editable = false;
    //CardPageId = "Expense Requisition Card";

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
                field("Corporate Strategy"; Rec."Corporate Strategy")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Reporting Year"; Rec."Reporting Period")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Workplan; Rec.Workplan)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic, Suite;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic, Suite;
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
        }
    }
}
