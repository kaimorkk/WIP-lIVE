Page 52193533 "File Movement Tracker"
{
    PageType = List;
    SourceTable = "File Movement Tracker";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Station;Station)
                {
                    ApplicationArea = Basic;
                }
                field(DateTimeIn;"Date/Time In")
                {
                    ApplicationArea = Basic;
                }
                field(UserId;"USER ID")
                {
                    ApplicationArea = Basic;
                }
                field(EntryNo;"Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks;Remarks)
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

