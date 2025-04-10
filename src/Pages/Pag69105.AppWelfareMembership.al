
page 69105 "App Welfare  Membership"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Hr Welfare Header";

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
                    ToolTip = 'Specifies the value of the Raisee Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
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
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Add Member")
            {
                ApplicationArea = Basic;
                Image = Add;
                ToolTip = 'Executes the Add Member action.';
                trigger OnAction()
                begin
                    Employee.Reset;
                    Employee.SetRange("No.", Rec."Raised By");
                    // Employee.SetRange("Welfare Member", false);
                    if Employee.FindSet then begin
                        // Employee."Welfare Member" := true;
                        Employee.Modify;
                        Message(TXT001, Employee."No.");
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify;
                    end else begin
                        Error('The Employee %1,is already a welfare member,kindly check', Rec."Raised By");
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Add Member_Promoted"; "Add Member")
                {
                }
            }
        }
    }

    var
        Employee: Record Employee;
        TXT001: label 'The Employee %1, has been succesfully added';
}

