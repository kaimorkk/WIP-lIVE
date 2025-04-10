page 69368 "Consolidated Inteview Lines"
{
    Caption = 'Consolidated Inteview Lines';
    PageType = ListPart;
    SourceTable = "Consolidation Interview Lines";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("Candidate Shortlist Vouch No."; Rec."Candidate Shortlist Vouch No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Vouch No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview End Time"; Rec."Interview End Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview End Time field.';
                }
                field("Interview Invitation No."; Rec."Interview Invitation No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview Invitation No. field.';
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field("Interview Start Time"; Rec."Interview Start Time")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview Start Time field.';
                }
                field("Interview Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Interview Venue field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Member field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Panel Interview Outcome"; Rec."Panel Interview Outcome")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panel Interview Outcome field.';
                }
                field("Panel Interview Score %"; Rec."Panel Interview Score %")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panel Interview Score % field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field("Panelist Interview Remarks"; Rec."Panelist Interview Remarks")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Panelist Interview Remarks field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted On"; Rec."Posted On")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted On field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("Unsuccesful App Reason Code"; Rec."Unsuccesful App Reason Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Unsuccesful App Reason Code field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
            }
        }
        //"Individual Interview Outcome"
    }
    actions
    {
        area(processing)
        {
            action("Individual Interview Outcome")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                RunObject = Page "Individual Interview Outcome";
                RunPageLink = "Document No." = field("Document No."), "Document No." = field("Document No."), "Application No." = field("Application No.");
                ToolTip = 'Executes the Evaluation Sections action.';
            }
        }
    }
}
