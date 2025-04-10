

page 56121 "MyHeldeskRequests"
{
    PageType = List;
    SourceTable = "ICT Helpdesk";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
                field("Assigned Time"; Rec."Assigned Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Time field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical Station field.';
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Service field.';
                }
                field(EXT; Rec.EXT)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EXT field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Ascalation Details"; Rec."Ascalation Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ascalation Details field.';
                }
                field("Assigned To EmpNo"; Rec."Assigned To EmpNo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To EmpNo field.';
                }
                field("Escalated To EmpNo"; Rec."Escalated To EmpNo")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated To EmpNo field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Time field.';
                }
                field("Computer not Starting up"; Rec."Computer not Starting up")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer not Starting up field.';
                }
                field("Keyboard, Mouse Failure"; Rec."Keyboard, Mouse Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Keyboard, Mouse Failure field.';
                }
                field("Printer Failure"; Rec."Printer Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Printer Failure field.';
                }
                field("UPS Failure"; Rec."UPS Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UPS Failure field.';
                }
                field("LCD /Monitor Failure"; Rec."LCD /Monitor Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LCD /Monitor Failure field.';
                }
                field("Storage Device Failure"; Rec."Storage Device Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Storage Device Failure field.';
                }
                field("Hardware Installation"; Rec."Hardware Installation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hardware Installation field.';
                }
                field("Others, specify HW"; Rec."Others, specify HW")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Others, specify HW field.';
                }
                field("Computer Running /Loading Slow"; Rec."Computer Running /Loading Slow")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer Running /Loading Slow field.';
                }
                field("Network Access Problems"; Rec."Network Access Problems")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Network Access Problems field.';
                }
                field("Antivirus Inefficiency"; Rec."Antivirus Inefficiency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Antivirus Inefficiency field.';
                }
                field(Applications; Rec.Applications)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications field.';
                }
                field("Software Installation"; Rec."Software Installation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Software Installation field.';
                }
                field("Others, specify SW"; Rec."Others, specify SW")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Others, specify SW field.';
                }
                field(Diagnosis; Rec.Diagnosis)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Diagnosis field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
                field("Attended By"; Rec."Attended By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended By field.';
                }
                field("Attended Date"; Rec."Attended Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended Date field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended Time field.';
                }
                field("Technical Staff Remarks"; Rec."Technical Staff Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Technical Staff Remarks field.';
                }
                field("Requesting Officer Remarks"; Rec."Requesting Officer Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer Remarks field.';
                }
                field("Attended by Name"; Rec."Attended by Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attended by Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Issue Category field.';
                }
                field("Escalated To"; Rec."Escalated To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated To field.';
                }
                field("Escalated By"; Rec."Escalated By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated By field.';
                }
                field("Escalated Date"; Rec."Escalated Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated Date field.';
                }
                field("Escalated Time"; Rec."Escalated Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated Time field.';
                }
                field("Requester Feedback"; Rec."Requester Feedback")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester Feedback field.';
                }
                field(Reopened; Rec.Reopened)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reopened field.';
                }
                field("Reopened By"; Rec."Reopened By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reopened By field.';
                }
                field("Feed Back Given"; Rec."Feed Back Given")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feed Back Given field.';
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
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

