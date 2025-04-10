Page 51967 "SMS Receipients1"
{
    PageType = List;
    SourceTable = "SMS Receipients";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(AccountNo;"Account No")
                {
                    ApplicationArea = Basic;
                }
                field(PhoneNo;"Phone No")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
        }
    }
}

