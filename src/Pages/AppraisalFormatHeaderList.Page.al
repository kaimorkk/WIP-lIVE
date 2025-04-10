Page 52194166 "Appraisal Format Header List"
{
    Editable = false;
    PageType = List;
    SourceTable = "Appraisal Format Header1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Header;Header)
                {
                    ApplicationArea = Basic;
                }
                field(Priority;Priority)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ApprovalFormat)
            {
                Caption = 'Approval Format ';
                action(Values)
                {
                    ApplicationArea = Basic;
                    Caption = 'Values';
                    RunObject = Page "Approval Format Values Data";
                    RunPageLink = "Appraisal Header"=field(Header);
                }
            }
        }
    }
}

