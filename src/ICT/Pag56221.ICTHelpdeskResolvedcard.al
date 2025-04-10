

page 56221 "ICT Helpdesk Resolved card"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ICT Helpdesk";

    layout
    {
        area(content)
        {
            group("Part 1: User Information.")
            {
                Editable = true;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Code';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Branch Code field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division/Unit';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Division/Unit field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Request Time field.';
                }
                field("Attended Time"; Rec."Attended Time")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    ToolTip = 'Specifies the value of the Attended Time field.';
                }
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ICT Issue Category field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Requester Feedback"; Rec."Requester Feedback")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Requester Feedback field.';
                }
            }
            group("Part 2:1 Hardware Issues")
            {
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
            group("Part 2:2 Software Issues")
            {
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
            group("Please describe the issue here:")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
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
            group(Diagnosis)
            {
                Caption = 'Diagnosis';
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                Editable = false;
                field("Escalated To"; Rec."Escalated To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated To field.';
                }
                field("Escalated By"; Rec."Escalated By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalated By field.';
                }
                field("Escalated Date"; Rec."Escalated Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalated Date field.';
                }
                field("Escalated Time"; Rec."Escalated Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Escalated Time field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send Request action.';
                trigger OnAction()
                begin
                    Rec.TestField("ICT Issue Category");
                    Rec.TestField("Description of the issue");
                    if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin
                        Rec."Request Date" := Today;
                        Rec."Request Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;

                        Category.Reset;
                        Category.SetRange(Category.Code, Rec."ICT Issue Category");
                        if Category.FindSet then begin
                            Mapping.Reset;
                            Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                            if Mapping.FindSet then begin
                                Rec."Assigned To" := Mapping.UserName;
                                Rec."Assigned Date" := Today;
                                Rec."Assigned Time" := Time;
                                Rec.Modify;
                            end;
                        end;

                        /*
                          Employee.RESET;
                          Employee.SETRANGE(Employee.Position,'JOB002');
                          IF Employee.FIND('-')THEN
                          BEGIN
                            Email2:=Employee."Company E-Mail";
                          END;
                          */
                        CInfo.Get;
                        Employee.Reset;
                        Employee.SetRange(Employee."User ID", Rec."Assigned To");
                        if Employee.Find('-') then begin
                            //MESSAGE("Assigned To");
                            Rec.Email := Employee."E-Mail";
                            Rec."Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;


                        Email2 := CInfo."Administrator Email";
                        Body := '<br>Kindly login to the ERP System and attend to the ICT Issue No. ' + Rec."Job No." + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                        Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        //SMTP.Create(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                        //SMTP.Send();
                        Message('ICT Issue notification sent successfully.');
                    end;

                    CurrPage.Close;

                end;
            }
            action(Ascertain)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                ToolTip = 'Executes the Ascertain action.';
                trigger OnAction()
                begin
                    if not Confirm('Are you ascertaining that your request' + ' ' + Rec."Job No." + ' ' + 'has been resolved?') then
                        exit;
                    //TESTFIELD("Requester Feedback");
                    Rec.Status := Rec.Status::Closed;
                    Rec.Modify(true);

                    //Release the Officer
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, Rec."Assigned To");
                    Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                    //End Release the Officer
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = OpenJournal;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    if not Confirm('Are you quoke sure you want to reopen this ICT Helpdesk issue?' + ' ' + Rec."Job No.") then
                        exit;
                    Rec.TestField("Requester Feedback");
                    Rec.Status := Rec.Status::Open;
                    Rec.Reopened := true;
                    Rec."Reopened By" := UpperCase(UserId);
                    Rec."Assigned To" := '';
                    Rec."Attended By" := '';
                    Rec."Assigned Date" := 0D;
                    Rec."Assigned Time" := 0T;
                    Rec."Attended by Name" := '';
                    Rec."Attended Date" := 0D;
                    Rec."Attended Time" := 0T;
                    Rec.Modify;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref(Ascertain_Promoted; Ascertain)
                {
                }
                actionref(Reopen_Promoted; Reopen)
                {
                }
            }
            group(Category_Process)
            {
                actionref("Send Request_Promoted"; "Send Request")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec.Validate("Job No.");
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Status := Rec.Status::Open;
    end;

    var
        Employee: Record Employee;
        Body: Text[250];
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CInfo: Record "Company Information";
        Category: Record "ICT Helpdesk Category";
        Mapping: Record "ICT Officers Category Mapping";
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

