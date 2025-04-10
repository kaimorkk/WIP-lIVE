Page 52194042 "Job Working Relationships"
{
    PageType = ListPart;
    SourceTable = "Job Working Relationships1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(JobID;"Job ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Type;Type)
                {
                    ApplicationArea = Basic;
                }
                field(Relationship;Relationship)
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

