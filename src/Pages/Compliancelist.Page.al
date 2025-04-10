Page 52193795 "Compliance list"
{
    CardPageID = Compliance;
    Editable = false;
    PageType = List;
    SourceTable = Compliance1;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(ComplianceCode;"Compliance Code")
                {
                    ApplicationArea = Basic;
                }
                field(ComplianceDescrption;"Compliance Descrption")
                {
                    ApplicationArea = Basic;
                }
                field(DateCreated;"Date Created")
                {
                    ApplicationArea = Basic;
                }
                field(DateModified;"Date Modified")
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

