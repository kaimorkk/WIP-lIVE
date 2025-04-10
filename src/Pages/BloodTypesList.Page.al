Page 52194246 "Blood Types List"
{
    PageType = List;
    SourceTable = "Blood Types List";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code";Code)
                {
                    ApplicationArea = Basic;
                }
                field(BloodType;"Blood Type")
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

