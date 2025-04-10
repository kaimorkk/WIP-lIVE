Page 52194131 "Salary Pointers2"
{
    PageType = List;
    SourceTable = "Salary Pointers21";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(SalaryPointer;"Salary Pointer")
                {
                    ApplicationArea = Basic;
                }
                field(BasicPayint;"Basic Pay int")
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

