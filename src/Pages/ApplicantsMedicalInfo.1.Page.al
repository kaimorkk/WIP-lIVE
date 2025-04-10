Page 52194207 "Applicants Medical Info.1"
{
    PageType = List;
    SourceTable = "Applicants Medical Info.1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ApplicantNo;"Applicant No")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Results;Results)
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

