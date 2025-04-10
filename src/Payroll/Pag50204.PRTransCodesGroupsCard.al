page 52193596 "PR Trans Codes Groups - Card"
{
    Caption = 'PR Transaction Codes Groups Card';
    PageType = Card;
    SourceTable = "PR Trans Codes Groups";

    layout
    {
        area(content)
        {
            group(Control1102756000)
            {
                field(GroupCode; "Group Code")
                {
                    ApplicationArea = Basic;
                }
                field(GroupDescription; "Group Description")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3; Outlook)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

