

page 69791 "Candidate Statistics"
{
    PageType = CardPart;
    SourceTable = Applicant;

    layout
    {
        area(content)
        {
            field("Candidate No."; Rec."Candidate No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the No. field.';
            }
            field("No. of Job Applications"; NoOfJobApplications)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoOfJobApplications field.';
            }
            field("No. of Ability Test Invitations"; NoAbilityTestInvitations)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoAbilityTestInvitations field.';
            }
            field("No. of Phone Screen Invitations"; NoPhoneScreenInvitations)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoPhoneScreenInvitations field.';
            }
            field("No. of Interview Invitations"; NoInterviewInvitations)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoInterviewInvitations field.';
            }
            field("No. of Employment Offers"; NoEmploymentOffers)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the NoEmploymentOffers field.';
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin

        JobApplications.Reset;
        JobApplications.SetFilter("Application Status", '<>%1', JobApplications."application status"::Closed);
        if JobApplications.FindSet then begin
            repeat
                NoOfJobApplications += 1;
            until JobApplications.Next = 0;
        end;

        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type", SelectionHeader."document type"::"Interview Invitation");
        if SelectionHeader.FindSet then begin
            repeat
                NoAbilityTestInvitations += 1;
            until SelectionHeader.Next = 0;

        end;
        SelectionHeader.Reset;
        SelectionHeader.SetRange("Document Type", SelectionHeader."interview mode"::"Phone Interview");
        if SelectionHeader.FindSet then begin
            repeat
                NoPhoneScreenInvitations += 1;
            until SelectionHeader.Next = 0;

        end;


        EmploymentOffer.Reset;
        EmploymentOffer.SetRange("Offer Acceptance Status", EmploymentOffer."offer acceptance status"::Accepted);
        EmploymentOffer.SetRange("Candidate No.", Rec."Candidate No.");
        if EmploymentOffer.FindSet then begin
            repeat
                NoEmploymentOffers += 1;
            until EmploymentOffer.Next = 0;
        end;
    end;

    var
        NoOfJobApplications: Integer;
        NoAbilityTestInvitations: Integer;
        NoPhoneScreenInvitations: Integer;
        NoInterviewInvitations: Integer;
        NoEmploymentOffers: Integer;
        RequisitionHeader: Record "Recruitment Requisition Header";
        VacancyAnnouncement: Record "Vacancy Announcement";
        JobApplications: Record "Job Applications";
        SelectionHeader: Record "Candidate Selection Header";
        BackgroundChecksHeader: Record "Background Checks Header";
        PreHireMedicalReport: Record "PreHire Medical Report";
        EmploymentOffer: Record "Employment Offer";
}

#pragma implicitwith restore

