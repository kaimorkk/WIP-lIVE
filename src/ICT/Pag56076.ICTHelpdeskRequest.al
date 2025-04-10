

page 56076 "ICT Helpdesk Request"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    // SourceTableView = where(Status = filter(<> " "));

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
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Brach Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Brach Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division/Unit';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Division/Unit field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Department Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
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
                field("ICT Issue Category"; Rec."ICT Issue Category")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the ICT Issue Category field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
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
                field("HelpDesk Category"; Rec."HelpDesk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HelpDesk Category field.';
                }
                field("Helpdesk subcategory"; Rec."Helpdesk subcategory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Helpdesk subcategory field.';
                }
                // field("ICT Inventory"; Rec."ICT Inventory")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Asset Involved';
                //     ToolTip = 'Specifies the value of the Asset Involved field.';
                // }
                // field("ICT Inventory Name"; Rec."ICT Inventory Name")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the ICT Inventory Name field.';
                // }
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
                field("Expected Resolution"; Rec."Expected Resolution")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Expected Resolution field.';
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
                    Rec.TestField("HelpDesk Category");
                    Rec.TestField("Description of the issue");
                    if Confirm('Are you sure you want to send ICT helpdesk issue?') = true then begin
                        Rec."Request Date" := Today;
                        Rec."Request Time" := Time;
                        Rec.Status := Rec.Status::Pending;
                        Rec.Modify;

                        Employee.Reset;
                        Employee.SetRange("No.", Rec."Assigned To EmpNo");
                        if Employee.Find('-') then begin
                            Employee.TestField("Company E-Mail");
                            Email2 := Employee."Company E-Mail";


                            CInfo.Get;


                            SetUp.Get();

                            Rec.Email := SetUp."ICT Email";
                            Body := '<br>Kindly login to the ERP System and attend to the ICT Issue ' + Rec."Description of the issue" + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                            Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                            Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                            // //SMTP.Create(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                            // Message(Email);
                            // //SMTP.AddCC(Email);
                            // //SMTP.Send();
                            Message('ICT Issue notification sent successfully.');
                        end;

                        Employee.Reset;
                        Employee.SetRange(Employee."User ID", Rec."Requesting Officer");
                        if Employee.Find('-') then begin
                            //MESSAGE("Assigned To");
                            Rec.Email := Employee."E-Mail";
                            Rec."Requesting Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;
                        Email2 := CInfo."Administrator Email";
                        Body := '<br>Your issue has been received by ICT department Issue No. ' + Rec."Job No." + ' from ' + Rec."Requesting Officer Name" + '.' + '</br>';
                        Body := '<br>' + Body + ' ' + 'Best Regards,' + '</br>';
                        Body := Body + ' ' + 'ERP AUTOMATIC MAILS';
                        // //SMTP.Create(COMPANYNAME, Email2, Email, 'ICT Heldesk Notification', Body, true);
                        // Message(Email);
                        // //SMTP.Send();
                        Message('ICT Issue notification sent successfully.');
                    end;

                    CurrPage.Close;
                end;
            }
        }
        area(Promoted)
        {
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
        SetUp: Record "ICT Helpdesk Global Parameters";
}

#pragma implicitwith restore

