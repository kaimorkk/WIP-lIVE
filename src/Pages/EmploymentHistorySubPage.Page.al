Page 52194051 "Employment History SubPage"
{
    PageType = ListPart;
    SourceTable = "Employment History1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(CompanyName;"Company Name")
                {
                    ApplicationArea = Basic;
                }
                field(JobTitle;"Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(From;From)
                {
                    ApplicationArea = Basic;
                }
                field("To";"To")
                {
                    ApplicationArea = Basic;
                }
                field(KeyExperience;"Key Experience")
                {
                    ApplicationArea = Basic;
                }
                field(Grade;Grade)
                {
                    ApplicationArea = Basic;
                }
                field(SalaryOnLeaving;"Salary On Leaving")
                {
                    ApplicationArea = Basic;
                }
                field(PostalAddress;"Postal Address")
                {
                    ApplicationArea = Basic;
                }
                field(Address2;"Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonForLeaving;"Reason For Leaving")
                {
                    ApplicationArea = Basic;
                }
                field(Comment;Comment)
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

