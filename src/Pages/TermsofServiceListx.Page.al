Page 52193680 "Terms of Service Listx"
{
    Caption = 'Terms of Service';
    PageType = List;
    SourceTable = "Terms of Service";

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
                field(Terms;Terms)
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
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

