

page 56078 "ICT Helpdesk Attend"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Pending));

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = false;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Assigned Time"; Rec."Assigned Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                    ToolTip = 'Specifies the value of the Time field.';
                }
            }
            group("Part 1: User Information")
            {
                Editable = false;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue No. field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Part 2.1: Hardware Issues")
            {
                Editable = false;
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
            }
            group("Part 2.2: Software Issues")
            {
                Editable = false;
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
                    Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
                    ToolTip = 'Specifies the value of the Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc) field.';
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
            }
            group(Control6)
            {
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Attended By field.';
                }
                field("Attended Date"; Rec."Attended Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Close)
            {
                ApplicationArea = Basic;
                Image = Close;
                ToolTip = 'Executes the Close action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        Rec."Attended Date" := Today;
                        Rec."Attended By" := UpperCase(UserId);
                        Rec."Attended Time" := Time;
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify;
                    end;

                    //Notify the requester that the issue has been closed
                    // ObjComInfo.GET;
                    // SenderEmailAddress:=ObjComInfo."Administrator Email";
                    // SenderName:=COMPANYNAME;
                    // MESSAGE(COMPANYNAME);
                    // IF UserSetup.GET("Requesting Officer") THEN
                    // Recipient:=UserSetup."E-Mail";
                    // Subject:='ISSUE CLOSURE'+ ' '+"Job No.";
                    // Body:='Please note that the issue on the subject above has been resoved by'+ '  '+"Attended By";
                    // ObjNotify.FnSendEmail(SenderEmailAddress,SenderName,Recipient,Subject,Body);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin

                    Rec.SetFilter("Job No.", Rec."Job No.");
                    Report.Run(56238, true, true, Rec);
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                ToolTip = 'Executes the Escalate action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to escalate the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Escalated By" := UpperCase(UserId);
                        Rec."Escalated Date" := Today;
                        Rec."Escalated Time" := Time;
                        if UserSetup.Get(Rec."Escalated By") then
                            Rec."Escalated To" := UserSetup."Approver ID";
                        Rec.Status := Rec.Status::Escalated;
                        Rec.Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    //MESSAGE(COMPANYNAME);
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE ESCALATION' + ' ' + Rec."Job No.";
                    // Body := 'Please note that the issue on the subject above has been escalatd to ' + '  ' + Rec."Escalated To";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Close_Promoted; Close)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
                actionref(Escalate_Promoted; Escalate)
                {
                }
            }
        }
    }

    var
        // ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

