Page 52194400 "Contract Performance List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Contract Performance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ContractNo;"Contract No")
                {
                    ApplicationArea = Basic;
                }
                field(PICode;"PI Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Score;Score)
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

