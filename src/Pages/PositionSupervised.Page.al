Page 52194036 "Position Supervised"
{
    PageType = ListPart;
    SourceTable = "Position Supervisedx1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(JobID;"Position Supervised")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job ID';
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

