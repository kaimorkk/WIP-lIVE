

page 56080 "ICT Helpdesk Historyyy"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Card;
    SourceTable = "ICT Helpdesk";
    SourceTableView = where(Status = filter(Closed));

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
                    Caption = 'Constituency Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
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
                field(EXT; Rec.EXT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Extension No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Extension No field.';
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
                    ShowMandatory = false;
                    Visible = false;
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
                field("HelpDesk Category"; Rec."HelpDesk Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HelpDesk Category field.';
                }
                field("ICT Inventory"; Rec."ICT Inventory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory field.';
                }
                field("ICT Inventory Name"; Rec."ICT Inventory Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Inventory Name field.';
                }
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

