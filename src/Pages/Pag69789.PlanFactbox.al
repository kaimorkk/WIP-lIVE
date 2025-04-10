

page 69789 "Plan Factbox"
{
    PageType = CardPart;
    SourceTable = "Recruitment Plan";

    layout
    {
        area(content)
        {
            field("External Document No"; Rec."External Document No")
            {
                ApplicationArea = Basic;
            }
            field("No. of Open Requisitions"; NoOfOpenRequisitions)
            {
                ApplicationArea = Basic;
            }
            field("No. of Closed Requisitions"; NoOfClosedRequisitions)
            {
                ApplicationArea = Basic;
            }
            field("No. of Job Applicants"; NoOfJobApplicants)
            {
                ApplicationArea = Basic;
            }
            field("No. of Job Vacancies"; NoOfJobVacancies)
            {
                ApplicationArea = Basic;
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
        RequisitionHeader.SetRange("Approval Status", RequisitionHeader."approval status"::Open);
        RequisitionHeader.SetRange("Recruitment Plan ID", Rec."Document No.");
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfOpenRequisitions += 1;
            until RequisitionHeader.Next = 0;
        end;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Recruitment Requisition");
        RequisitionHeader.SetRange("Recruitment Plan ID", Rec."Document No.");
        RequisitionHeader.SetRange("Vacancy Status", RequisitionHeader."vacancy status"::Closed);
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfClosedRequisitions += 1;
            until RequisitionHeader.Next = 0;
        end;

        RequisitionHeader.Reset;
        RequisitionHeader.SetRange("Document Type", RequisitionHeader."document type"::"Job Vacancy");
        RequisitionHeader.SetRange("Recruitment Plan ID", Rec."Document No.");
        if RequisitionHeader.FindSet then begin
            repeat
                NoOfJobVacancies += 1;
            until RequisitionHeader.Next = 0;
        end;
    end;

    var
        NoOfOpenRequisitions: Integer;
        NoOfClosedRequisitions: Integer;
        NoOfJobApplicants: Integer;
        RequisitionHeader: Record "Recruitment Requisition Header";
        NoOfJobVacancies: Integer;
}

#pragma implicitwith restore

