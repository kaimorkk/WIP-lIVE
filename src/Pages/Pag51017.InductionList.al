page 51017 "Induction List"
{
    ApplicationArea = All;
    Caption = 'Induction List';
    PageType = List;
    Editable = false;
    CardPageId = "Induction Card";
    SourceTable = "Induction Header";
    UsageCategory = Lists;
    SourceTableView = where("Approval Status" = filter(Open | "Pending Approval"));
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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    Caption = 'Induction Start Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    Caption = 'Induction End Date';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Venue; Rec.Venue)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Venue field.';
                }

            }
        }
    }
}
