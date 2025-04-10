

page 75189 "Departmental Procurement Plan"
{
    CardPageID = "Dept Procurement Plan Card";
    Editable = false;
    PageType = List;
    SourceTable = "Procurement Plan";
    SourceTableView = where("Plan Type" = const(Functional), "Document Type" = const("Procurement Plan"),
       "Approval Status" = filter(<> "Released"));
    UsageCategory = Tasks;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                // field("Corporate Strategic Plan ID"; Rec."Corporate Strategic Plan ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Corporate Strategic Plan ID field.';
                // }
                field("Financial Budget ID"; Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Budget ID field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
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
            }
        }
        area(factboxes)
        {
            systempart(Control28; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control31; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }
    trigger OnOpenPage()
    var
        myInt: Integer;
        Employee: Record Employee;
        UserSetup: Record "User Setup";
    begin
        if UserSetup.get(UserId) then begin
            if not UserSetup."Procurement Manager" then begin
                Employee.Reset();
                Employee.SetRange("Global Dimension 1 Code", UserSetup."Global Dimension 1 Code");
                Employee.SetRange("User ID", UserSetup."User ID");
                Employee.SetRange("Global Dimension 2 Code", UserSetup."Shortcut Dimension 2 Code");
                if Employee.FindFirst() then begin
                    Rec.FilterGroup(2);
                    Rec.SetRange(rec."Global Dimension 1 Code", Employee."Global Dimension 1 Code");
                    Rec.SetRange(rec."Global Dimension 2 Code", Employee."Global Dimension 2 Code");
                    // Employee.SetRange("Global Dimension 1 Code", Rec."Global Dimension 1 Code");
                    // Employee.SetRange("Global Dimension 2 Code", Rec."Global Dimension 2 Code");
                    Rec.FilterGroup(0)
                end;
            end;
        end;
    end;
}

#pragma implicitwith restore

