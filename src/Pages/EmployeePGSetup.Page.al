Page 52193982 "Employee PG Setup"
{
    PageType = List;
    SourceTable = "Employee PGroups1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(GLAccount;"G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field(GLAccountEmployer;"GL Account Employer")
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

