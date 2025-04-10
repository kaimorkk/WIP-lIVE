

page 69108 "Matanga Contribution Header"
{
    PageType = Card;
    SourceTable = "Hr Welfare Header";
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Welfare No. field.';
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Welfare Type field.';
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raisee Name field.';
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Welfare Category"; Rec."Welfare Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Welfare Category field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control16; "Welfare Lines")
            {
                SubPageLink = "Welfare Header No." = field("Welfare No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Contributions")
            {
                ApplicationArea = Basic;
                Image = ImportExcel;
                ToolTip = 'Executes the Import Contributions action.';
                // trigger OnAction()
                // begin
                //     SetRange("Welfare No.", "Welfare No.");
                //     WelfareImport.GetVariables(Rec);
                //     WelfareImport.Run();
                // end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin
                    // ApprovalEntries.SetRecordFilters(Database::"Purchase Header", 14, Rec."Welfare No.");
                    ApprovalEntries.Run;
                end;
            }
            action("Co&mments")
            {
                ApplicationArea = Basic;
                Caption = 'Co&mments';
                Image = ViewComments;
                RunObject = Page "Purch. Comment Sheet";
                ToolTip = 'Executes the Co&mments action.';
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Dimensions_Promoted; Dimensions)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Import Contributions_Promoted"; "Import Contributions")
                {
                }
            }
            group(Category_Category9)
            {
                actionref(Approvals_Promoted; Approvals)
                {
                }
            }
        }
        // Codeunit "Release Purchase Document"Codeunit "Release Purchase Document"Codeunit "Approvals Mgmt."Codeunit "Approvals Mgmt."Report "Deactive Contract Employees";

        //     trigger OnAction()
        //     begin
        //         SetRange("Welfare No.", "Welfare No.");
        //         Report.Run(69026, true, true, Rec);
        //     end;
        // XmlPort ""Welfare ;
        //     ""

    }
}
#pragma implicitwith restore
