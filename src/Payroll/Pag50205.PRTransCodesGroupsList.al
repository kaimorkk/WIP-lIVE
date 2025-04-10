page 52193606 "PR Trans Codes Groups - List"
{
    Caption = 'PR Transaction Codes Groups';
    CardPageID = "PR Trans Codes Groups - Card";
    Editable = false;
    PageType = List;
    SourceTable = "PR Trans Codes Groups";

    layout
    {
        area(content)
        {
            repeater(Control1102756000)
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
    }

    actions
    {
    }
}

