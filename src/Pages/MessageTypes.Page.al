Page 52193666 "Message Types"
{
    PageType = List;
    SourceTable = "SMS Types";

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
                field(MessageType;"Message Type")
                {
                    ApplicationArea = Basic;
                }
                field(SMSMESSAGE;"SMS MESSAGE")
                {
                    ApplicationArea = Basic;
                }
                field(Subject;Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Activate;Activate)
                {
                    ApplicationArea = Basic;
                }
                field(SourceType;"Source Type")
                {
                    ApplicationArea = Basic;
                }
                field(StageFilter;"Stage Filter")
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

