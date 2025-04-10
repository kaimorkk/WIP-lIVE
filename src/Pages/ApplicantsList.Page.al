Page 52193872 "Applicants List"
{
    ApplicationArea = Basic;
    CardPageID = Applicants1;
    PageType = List;
    SourceTable = Applicants1;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName;"First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName;"Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName;"Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(MaritalStatus;"Marital Status")
                {
                    ApplicationArea = Basic;
                }
                field(IDNumber;"ID Number")
                {
                    ApplicationArea = Basic;
                }
                field(Citizenship;Citizenship)
                {
                    ApplicationArea = Basic;
                }
                field(DateOfBirth;"Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Employ;Employ)
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

