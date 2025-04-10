

page 69297 "Hr Sub Discplinary List"
{
    CardPageID = "HR Disciplinary Cases SF";
    DeleteAllowed = false;
    ModifyAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "HR Disciplinary Cases";
    SourceTableView = where(Status = const(Submitted),
                            Type = const(Disciplinary));


    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Case Number"; Rec."Case Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Number field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Type of Disciplinary Case"; Rec."Type of Disciplinary Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Disciplinary Case field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Description field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    var
        Emp: Record Employee;
        UserSetup: Record "User Setup";
    begin
        UserSetup.Get(UserId);
        Rec.SetRange(Rec."Disciplinary Officer In Charge", UserSetup."Employee No.");
    end;
}

#pragma implicitwith restore

