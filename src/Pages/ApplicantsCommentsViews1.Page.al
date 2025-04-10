Page 52194209 "Applicants Comments/Views1"
{
    PageType = List;
    SourceTable = "Applicants Comments/Views1";

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
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(ViewsComments;"Views/Comments")
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

