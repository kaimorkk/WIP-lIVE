Page 52194205 Hobbies1
{
    PageType = List;
    SourceTable = Hobbies1;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No;No)
                {
                    ApplicationArea = Basic;
                }
                field(Hobbies;Hobbies)
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

