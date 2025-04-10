Page 50131 "Applicants Document Link1"
{
    PageType = List;
    SourceTable = "Applicants Document Link1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ApplicantNo; "Applicant No")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDescription; "Document Description")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentLink; "Document Link")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

