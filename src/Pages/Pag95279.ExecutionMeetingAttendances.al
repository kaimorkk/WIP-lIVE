

page 95279 "Execution Meeting Attendances"
{
    PageType = List;
    SourceTable = "Execution Meeting Attendance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("e-Notify Attendees")
            {
                ApplicationArea = Basic;
                Image = Note;
                ToolTip = 'Executes the e-Notify Attendees action.';
                trigger OnAction()
                begin
                    AuditAssuranceSetup.Get();
                    if AuditAssuranceSetup."e_Notify Audit Mobilization" = true then begin
                        Message('Attendees notified successfully');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("e-Notify Attendees_Promoted"; "e-Notify Attendees")
                {
                }
            }
        }
    }

    var
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
}

#pragma implicitwith restore

