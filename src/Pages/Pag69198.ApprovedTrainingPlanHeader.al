

page 69198 "Approved Training Plan Header"
{
    Editable = false;
    PageType = Card;
    SourceTable = "Training Plan Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Global; Rec.Global)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Global field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department  Name"; Rec."Department  Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department  Name field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field("Approved Status"; Rec."Approved Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Status field.';
                }
                field("Total Estimated Cost"; Rec."Total Estimated Cost")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Estimated Cost field.';
                }
                field("Internal Training"; Rec."Internal Training")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Internal Training field.';
                }
                field("External Training"; Rec."External Training")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the External Training field.';
                }
                field("Bugdet Available"; Rec."Bugdet Available")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Allocation';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Allocation field.';
                }
                field("Budget Allocation"; Rec."Budget Allocation")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Available';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Available field.';
                }
                field("Budget Utilized"; Rec."Budget Utilized")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Budget Utilized field.';
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
                field("Corporate Strategic Plan Code"; Rec."Corporate Strategic Plan Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Corporate Strategic Plan Code field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
            part(Control16; "Training Plan Lines")
            {
                Editable = false;
                SubPageLink = "Training Plan Code" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Training Plan")
            {
                ApplicationArea = Basic;
                Image = Planning;
                ToolTip = 'Executes the Training Plan action.';
                trigger OnAction()
                begin
                    Rec.SetRange(No, Rec.No);
                    Report.Run(69145, true, false, Rec);
                end;
            }
            action(Calendar)
            {
                ApplicationArea = Basic;
                Image = Calendar;

                trigger OnAction()
                begin
                    // Rec.SetRange(No, Rec.No);
                    // Report.Run(Report::"Training Calendar", true, false, Rec);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Report)
            {
                actionref("Training Plan_Promoted"; "Training Plan")
                {
                }
                actionref(Calendar_Promoted; Calendar)
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

