

page 69788 "Establishment Factbox"
{
    PageType = CardPart;
    SourceTable = "Staff Establishment Plan";

    layout
    {
        area(content)
        {
            field("External Document No."; Rec."External Document No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the External Document No. field.';
            }
            field("No. of Recruitment Requisitions"; NoOfRequisitions)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfRequisitions field.';
            }
            field("No. of Job Vacancies"; NoofVacancies)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoofVacancies field.';
            }
            field("No. of Direct Hire Vouchers"; NoOfDirectHire)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfDirectHire field.';
            }
            field("No. of Career Fairs"; NoOfCareerFairs)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfCareerFairs field.';
            }
            field("No. of Job Applications"; NoOfApplications)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfApplications field.';
            }
            field("No. of Candidate Shortlisitng"; NoOfShortlisting)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfShortlisting field.';
            }
            field("No. of Interview Invitations"; NoOfInterviewInvitations)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfInterviewInvitations field.';
            }
            field("No. of Employment Offers"; NoOfOffers)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfOffers field.';
            }
            field("No. of Rejected Offers"; NoOfRejections)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfRejections field.';
            }
            field("No. of Background Checks"; NoOfBackgroundChecks)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfBackgroundChecks field.';
            }
            field("No. of Interview Reports"; NoOfInterviewReports)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfInterviewReports field.';
            }
            field("No. of Medical Reports"; NoOfMedicalReport)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfMedicalReport field.';
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Recruitment Requisition");
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfRequisitions += 1;
            until RequisitionHeader.Next = 0;
        end;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Job Vacancy");
        if RequisitionHeader.FindSet then begin
            repeat
                NoofVacancies += 1;
            until RequisitionHeader.Next = 0;
        end;

        VacancyAnnouncement.Reset;
        VacancyAnnouncement.SetRange("Posting Type", VacancyAnnouncement."posting type"::"Direct Hire Announcement");
        if VacancyAnnouncement.FindSet then begin
            repeat
                NoOfDirectHire += 1;
            until VacancyAnnouncement.Next = 0;
        end;

        VacancyAnnouncement.Reset;
        VacancyAnnouncement.SetRange("Posting Type", VacancyAnnouncement."posting type"::"Career Fair");
        if VacancyAnnouncement.FindSet then begin
            repeat
                NoOfCareerFairs += 1;
            until VacancyAnnouncement.Next = 0;
        end;

        JobApplications.Reset;
        JobApplications.SetFilter("Application Status", '<>%1', JobApplications."application status"::Closed);
        if JobApplications.FindSet then begin
            repeat
                NoOfApplications += 1;
            until JobApplications.Next = 0;
        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type", SelectionHeader."document type"::"Candidate Shortlisting");
        if SelectionHeader.FindSet then begin
            repeat
                NoOfShortlisting += 1;
            until SelectionHeader.Next = 0;

        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type", SelectionHeader."document type"::"Interview Invitation");
        if SelectionHeader.FindSet then begin
            repeat
                NoOfInterviewInvitations += 1;
            until SelectionHeader.Next = 0;

        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type", SelectionHeader."document type"::"Consolidated Interview Report");
        if SelectionHeader.FindSet then begin
            repeat
                NoOfInterviewReports += 1;
            until SelectionHeader.Next = 0;

        end;
        BackgroundChecksHeader.Reset;
        BackgroundChecksHeader.SetRange("Document Status", BackgroundChecksHeader."document status"::Active);
        if BackgroundChecksHeader.FindSet then begin
            repeat
                NoOfBackgroundChecks += 1;
            until BackgroundChecksHeader.Next = 0;
        end;

        PreHireMedicalReport.Reset;
        PreHireMedicalReport.SetRange("Application No.", '<>%1', '');
        if PreHireMedicalReport.FindSet then begin
            repeat
                NoOfMedicalReport += 1;
            until PreHireMedicalReport.Next = 0
        end;

        EmploymentOffer.Reset;
        EmploymentOffer.SetRange("Offer Acceptance Status", EmploymentOffer."offer acceptance status"::Accepted);
        if EmploymentOffer.FindSet then begin
            repeat
                NoOfOffers += 1;
            until EmploymentOffer.Next = 0;
        end;
        EmploymentOffer.Reset;
        EmploymentOffer.SetRange("Offer Acceptance Status", EmploymentOffer."offer acceptance status"::Rejected);
        if EmploymentOffer.FindSet then begin
            repeat
                NoOfRejections += 1;
            until EmploymentOffer.Next = 0;
        end
    end;

    var
        NoOfRequisitions: Integer;
        NoofVacancies: Integer;
        NoOfDirectHire: Integer;
        NoOfCareerFairs: Integer;
        NoOfApplications: Integer;
        NoOfShortlisting: Integer;
        NoOfInterviewInvitations: Integer;
        NoOfOffers: Integer;
        NoOfRejections: Integer;
        NoOfBackgroundChecks: Integer;
        NoOfInterviewReports: Integer;
        NoOfMedicalReport: Integer;
        RequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        JobApplications: Record "Job Applications";
        SelectionHeader: Record "Candidate Selection Header";
        BackgroundChecksHeader: Record "Background Checks Header";
        PreHireMedicalReport: Record "PreHire Medical Report";
        EmploymentOffer: Record "Employment Offer";
}

#pragma implicitwith restore

