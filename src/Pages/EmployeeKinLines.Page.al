Page 52194062 "Employee Kin Lines"
{
    PageType = ListPart;
    SourceTable = "Employee Kin1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SurName;SurName)
                {
                    ApplicationArea = Basic;
                }
                field(OtherNames;"Other Names")
                {
                    ApplicationArea = Basic;
                }
                field(Relationship;Relationship)
                {
                    ApplicationArea = Basic;
                }
                field(IDNoPassportNo;"ID No/Passport No")
                {
                    ApplicationArea = Basic;
                }
                field(DateOfBirth;"Date Of Birth")
                {
                    ApplicationArea = Basic;
                }
                field(Occupation;Occupation)
                {
                    ApplicationArea = Basic;
                }
                field(Address;Address)
                {
                    ApplicationArea = Basic;
                }
                field(OfficeTelNo;"Office Tel No")
                {
                    ApplicationArea = Basic;
                }
                field(HomeTelNo;"Home Tel No")
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

