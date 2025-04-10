
table 69685 "Recruitment Selection Ledger"
{
    Caption = 'Pre-Employment Checks  Report ID';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Vacancy No."; Code[30])
        {

            trigger OnValidate()
            begin
                VacancyAnnouncementLine.Reset;
                VacancyAnnouncementLine.SetRange("Vacancy ID", "Vacancy No.");
                if VacancyAnnouncementLine.FindSet then begin
                    repeat
                        VacancyAnnouncement.Reset;
                        VacancyAnnouncement.SetRange("Announcement No.", VacancyAnnouncementLine."Announcement No.");
                        if VacancyAnnouncement.FindFirst then begin
                            if VacancyAnnouncement."Posting Type" = VacancyAnnouncement."posting type"::"Career Fair" then begin
                                "Career Fair ID" := VacancyAnnouncement."Announcement No.";
                            end;
                            if VacancyAnnouncement."Posting Type" = VacancyAnnouncement."posting type"::"Recruitment Agency Posting" then begin
                                "Recruitment Agency Posting ID" := VacancyAnnouncement."Announcement No.";
                            end;
                            if VacancyAnnouncement."Posting Type" = VacancyAnnouncement."posting type"::"Direct Hire Announcement" then begin
                                "Direct Hire Announcement ID" := VacancyAnnouncement."Announcement No.";
                            end;
                        end
                    until VacancyAnnouncementLine.Next = 0;
                end
            end;
        }
        field(2; "Application No."; Code[30])
        {

            trigger OnValidate()
            begin
                JobApplications.Reset;
                JobApplications.SetRange("Application No.", "Application No.");
                if JobApplications.FindFirst then begin
                    "Candidate No." := JobApplications."Candidate No.";
                    "First Name" := JobApplications."First Name";
                    "Middle Name" := JobApplications."Middle Name";
                    "Last Name" := JobApplications."Last Name";
                    "Employee No." := JobApplications."Employee No.";
                    "Vacancy No." := JobApplications."Vacancy Id";
                    Validate("Vacancy No.");

                end
            end;
        }
        field(3; "Candidate No."; Code[30])
        {
        }
        field(4; "Employee No."; Code[30])
        {
        }
        field(5; "First Name"; Text[50])
        {
        }
        field(6; "Middle Name"; Text[50])
        {
        }
        field(7; "Last Name"; Text[50])
        {
        }
        field(8; "Direct Hire Announcement ID"; Code[30])
        {
        }
        field(9; "Recruitment Agency Posting ID"; Code[30])
        {
        }
        field(10; "Career Fair ID"; Code[30])
        {
        }
        field(11; "Candidate Shortlisting No."; Code[30])
        {
        }
        field(12; "Shortlisting Date"; Date)
        {
        }
        field(13; "Shortlisting Outcome"; Option)
        {
            OptionCaption = ' ,Non-Responsive,Invite for First Interview';
            OptionMembers = " ","Non-Responsive","Invite for First Interview";
        }
        field(14; "Shortlisting Committee Remarks"; Text[150])
        {
        }
        field(15; "First Interview Invitation No."; Code[30])
        {
        }
        field(16; "First Interview Report ID"; Code[30])
        {
        }
        field(17; "First Interview Date"; Date)
        {
        }
        field(18; "Minimum Weigh 1st Score %"; Decimal)
        {
            Caption = 'Minimum Weighted 1st Interview Pass Score %';
        }
        field(19; "Weighted 1st Interview  Scor"; Decimal)
        {
            Caption = 'Weighted 1st Interview  Score %';
        }
        field(20; "First Interview Outcome"; Option)
        {
            OptionCaption = ' ,Non-Responsive,Invite for Final Interview';
            OptionMembers = " ","Non-Responsive","Invite for Final Interview";
        }
        field(21; "Panel Remarks (Fist Interview)"; Text[100])
        {
        }
        field(22; "Final Interview Invitation No."; Code[30])
        {
        }
        field(23; "Final Interview Report ID"; Code[30])
        {
        }
        field(24; "Final Interview Date"; Date)
        {
        }
        field(25; "Min Weighted Final  Score"; Decimal)
        {
            Caption = 'Minimum Weighted Final Interview Pass Score %';
        }
        field(26; "Weighted Final Score %"; Decimal)
        {
            Caption = 'Weighted Final Interview  Score %';
        }
        field(27; "Final Interview Outcome"; Text[100])
        {
        }
        field(28; "Final Panel Remarks"; Text[350])
        {
            Caption = 'Panel Remarks (Final Interview)';
        }
        field(29; "Pre-Employment Checks  Report"; Code[30])
        {
            Caption = 'Pre-Employment Checks  Report ID';
        }
        field(30; "Pre-Employment Check Date"; Date)
        {
        }
        field(31; "Pre-Employment Check Outcome"; Text[350])
        {
        }
        field(32; "Appointment Offer No."; Code[30])
        {
        }
        field(33; "Employment Contract No."; Code[30])
        {
        }
        field(34; "Induction Plan No."; Code[30])
        {
        }
        field(35; "Entry No."; Integer)
        {
            AutoIncrement = true;
        }
    }

    keys
    {
        key(Key1; "Vacancy No.", "Application No.", "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        JobApplications: Record "Job Applications";
        VacancyAnnouncement: Record "Vacancy Announcement";
        VacancyAnnouncementLine: Record "Vacancy Announcement Line";
}

