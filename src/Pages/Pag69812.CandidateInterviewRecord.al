

page 69812 "Candidate Interview Record"
{
    PageType = Card;
    SourceTable = "Candidate Interview Record";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Interview Invitation No."; Rec."Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Candidate Shortlist Vouch No."; Rec."Candidate Shortlist Vouch No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Vouch No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Interview Type"; Rec."Interview Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Type field.';
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview Start Time"; Rec."Interview Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Start Time field.';
                }
                field("Interview End Time"; Rec."Interview End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview End Time field.';
                }
                field("Interview Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Venue field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
            part(Control32; "Interview Questions")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Interview Scoresheet Template" = field("Interview Scoresheet Template");
                ApplicationArea = Basic;
            }
            group("Salary Details")
            {
                Caption = 'Salary Details';
                field("Gross/Net"; Rec."Gross/Net")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross/Net field.';
                }
                field("Negotiated Amount"; Rec."Negotiated Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Negotiated Salary field.';
                }
            }
            group("Interview Outcome/Results")
            {
                Caption = 'Interview Outcome/Results';
                field("Panel Interview Outcome"; Rec."Panel Interview Outcome")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Panel Interview Outcome field.';
                }
                field("Oral Interview Score %"; Rec."Oral Interview Score %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Oral Interview Score % field.';
                }
                field("Technical Interview Score %"; Rec."Technical Interview Score %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Technical Interview Score % field.';
                }
                field("Panel Interview Score %"; Rec."Panel Interview Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Interview Score % field.';
                }
                field("Panelist Interview Remarks"; Rec."Panelist Interview Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panelist Interview Remarks field.';
                }
                field("Unsuccesful App Reason Code"; Rec."Unsuccesful App Reason Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Rejection';
                    ToolTip = 'Specifies the value of the Unsuccesful App Reason Code field.';
                }
            }
        }
        area(factboxes)
        {
            part(Attachment; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(Database::"Candidate Interview Record"),
                              "No." = field("Document No.");
            }
            systempart(Control28; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control31; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Question Categories";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Evaluation Sections action.';
            }
            action("Panelist Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                ToolTip = 'Executes the Panelist Evaluation Report action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69625, true, false, Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the evaluation?';
                    JobApp: Record "Job Applications";
                begin
                    if Confirm(TXT001) = true then begin
                        JobApp.Reset();
                        JobApp.SetRange("Application No.", Rec."Application No.");
                        if JobApp.FindSet() then
                            JobApp."Attended Interview" := true;
                        JobApp.Modify(true);
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify(true);
                    end
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Post_Promoted; Post)
                {
                }
            }
            group(Category_Report)
            {
                actionref("Panelist Evaluation Report_Promoted"; "Panelist Evaluation Report")
                {
                }
            }
            group(Category_Category4)
            {
                actionref("Evaluation Sections_Promoted"; "Evaluation Sections")
                {
                }
            }
        }
    }
    trigger OnNewRecord(myBoolean: Boolean)
    var
        myInt: Integer;
    begin
        Rec."Document Type" := Rec."Document Type"::Individual;
    end;
}

#pragma implicitwith restore

