

page 56218 "ICT HelpdeskAllocation"
{
    Caption = 'ICT Helpdesk Allocation';
    PageType = Card;
    SourceTable = "ICT Helpdesk";

    layout
    {
        area(content)
        {
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
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Physical Station field.';
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Nature of Service field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division/Unit';
                    ToolTip = 'Specifies the value of the Division/Unit field.';
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
                Visible = false;
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
                Visible = false;
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
            group("Please describe the issue here")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = true;
                Enabled = true;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
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
            action("Assign Task")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                ToolTip = 'Executes the Assign Task action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to assign the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Escalated By" := UpperCase(UserId);
                        Rec."Escalated Date" := Today;
                        Rec."Escalated Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE ESCALATION' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been assigned to ' + '  ' + Rec."Assigned To";
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Assigned To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ASSIGNMENT' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been assigned to you';
                    // ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);

                    CurrPage.Close;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Print_Promoted; Print)
                {
                }
                actionref("Assign Task_Promoted"; "Assign Task")
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
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
}

#pragma implicitwith restore

