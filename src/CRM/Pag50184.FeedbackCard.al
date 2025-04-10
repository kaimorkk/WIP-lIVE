page 50184 "Feedback Card"
{
    ApplicationArea = All;
    Caption = 'Feedback Card';
    PageType = Card;
    SourceTable = "Cases Management";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Type of cases"; Rec."Interaction Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Nature of Enquiry field.';
                }
                field("Enquiry Number"; Rec."Enquiry Number")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complaints No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Complaints No field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Is Customer"; Rec."Is Customer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Is Customer field.', Comment = '%';
                }
                field("Contact No"; Rec."Contact No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Contact No field.', Comment = '%';
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received From field.';
                }
                field(Telephone; Rec.Telephone)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Telephone field.', Comment = '%';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Receiving Officer"; Rec."Receiving Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receiving Officer field.';
                }
                field("Mode of Lodging Complaints Cod"; Rec."Mode of Lodging Complaints Cod")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mode of Lodging Complaints Code field.';
                }

            }
            group(Interaction)
            {
                field("Case Description"; RichText)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ExtendedDatatype = RichContent;
                    Caption = 'Issue Description';
                    trigger OnValidate()
                    begin
                        Rec.SaveRichText(RichText);
                    end;
                }
            }
            group("Case Information")
            {
                Caption = 'Comments';

                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Caption = 'Root Cause';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Root Cause field.';
                }
                field(Implications; Rec.Implications)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Implications field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Follow up Action"; Rec."Follow up Action")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Follow up Action field.';
                }
                field(Recomendations; Rec.Recomendations)
                {
                    ApplicationArea = Basic;
                    Caption = 'Recommendation';
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Recommendation field.';
                }
                field("Support Documents"; Rec."Support Documents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Support Documents field.';
                }
                field("Loan No"; Rec."Loan No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
            }
            group("Member Information")
            {
                Caption = 'Assigned Details';
                Visible = true;
                field("Assigned Officer"; Rec."Assigned Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer field.';
                }
                field("Assigned Officer Email"; Rec."Assigned Officer Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Email field.';
                }
                field("Assigned Officer Name"; Rec."Assigned Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Date of Escalation"; Rec."Date of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date of Escalation field.';
                }
                field("Time of Escalation"; Rec."Time of Escalation")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time of Escalation field.';
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                    Caption = 'Due Date';
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field(Priority; Rec.Priority)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Priority field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Mark Resolved")
            {
                ApplicationArea = Basic;
                Image = Close;
                ToolTip = 'Executes the Mark Resolved action.';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Resolved then begin
                        Error('Case already resolved');
                    end;

                    if Confirm('Are you sure you want to mark this case as resolved?', false) = true then begin
                        Rec.Status := Rec.Status::Resolved;
                        Rec."Date Resolved" := CurrentDateTime;
                        Rec."Time Resolved" := Time;
                        Rec."Case Solved" := true;
                    end;
                end;
            }

            action("Escalate Complaint")
            {
                ApplicationArea = Basic;
                Caption = 'Relay Feedback';
                Image = SendTo;
                ToolTip = 'Executes the Escalate Complaint action.';
                trigger OnAction()
                begin
                    Rec.TestField("Assigned Officer");
                    //TESTFIELD("Action Taken");
                    //TESTFIELD("Date To Settle Case");
                    //TESTFIELD("solution Remarks");
                    Rec."Date Sent" := WorkDate;
                    Rec."Time Sent" := Time;
                    Rec."Sent By" := UserId;

                    Rec.Status := Rec.Status::Assigned;
                    Rec.Modify;
                    Rec.Sendtouser();
                    Rec.SendEmailuser();
                    Rec.sms();
                    Message('Case has been Assigned to %1', AssignedReas."Resource Assigned");
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Mark Resolved_Promoted"; "Mark Resolved")
                {
                }
                actionref("Escalate Complaint_Promoted"; "Escalate Complaint")
                {
                }
            }
        }
    }
    trigger OnAfterGetCurrRecord()
    begin
        RichText := Rec.GetRichText();
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Interaction Type" := Rec."Interaction Type"::Feedback;
    end;

    var
        RichText: Text;
        CustCare: Record "General Equiries.";
        AssignedReas: Record "Cases Management";
}