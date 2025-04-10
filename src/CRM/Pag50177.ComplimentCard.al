page 50177 "Compliment Card"
{
    ApplicationArea = All;
    Caption = 'Compliment Card';
    PageType = Card;
    SourceTable = "Cases Management";

    layout
    {
        area(content)
        {
            group(General)
            {

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
                    Caption = 'Compliment Description';
                    trigger OnValidate()
                    begin
                        Rec.SaveRichText(RichText);
                    end;
                }
            }

            group("Member Information")
            {
                Caption = 'Employee Information';

                field("Assigned Officer"; Rec."Assigned Officer")
                {
                    ApplicationArea = Basic;
                    Caption = 'Complimented Employee';
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
                    Caption = 'Employee Name';
                    ToolTip = 'Specifies the value of the Assigned Officer Name field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
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
                Caption = 'Relay Compliment';
                Image = SendTo;
                ToolTip = 'Executes the Escalate Complaint action.';
                trigger OnAction()
                begin
                    Rec.TestField("Assigned Officer");

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
        Rec."Interaction Type" := Rec."Interaction Type"::Compliment;
    end;

    var
        RichText: Text;
        CustCare: Record "General Equiries.";
        AssignedReas: Record "Cases Management";
}
