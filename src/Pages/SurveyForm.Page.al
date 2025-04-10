Page 52193856 "Survey Form"
{
    Editable = true;
    PageType = Card;
    SourceTable = "Segment Header";
    SourceTableView = where(Type=const("Customer Survey"));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                Editable = false;
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Description)
                {
                    ApplicationArea = Basic;
                }
                field(ImplementingAgencyNo;"Implementing Agency No")
                {
                    ApplicationArea = Basic;
                }
                field(ImplementingAgencyName;"Implementing Agency Name")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(EndDate;"End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1000000015)
            {
                part(Control1000000013;"Customer Survey Index")
                {
                    SubPageLink = "Survey Code"=field("No.");
                }
            }
            group(Control1000000016)
            {
                part(Control1000000017;"CS  Description")
                {
                    SubPageLink = "Survey Code"=field("No.");
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("<< Next Page >>")
            // {
            //     ApplicationArea = Basic;
            //     Caption = '<< Next Page >>';
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "Job Tasks Setup";
            //     RunPageLink = Code=field("No.");

            //     trigger OnAction()
            //     begin
            //         if Segment.Get("No.") then
            //         Page.RunModal(51511132,Segment);
            //     end;
            // }
        }
    }

    var
        Segment: Record "Segment Header";
}

