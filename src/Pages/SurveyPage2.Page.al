Page 52193857 "Survey Page2"
{
    PageType = Card;
    SourceTable = "Segment Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
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
            group(Control1000000017)
            {
                part(Control1000000013;"Perfomance Rating")
                {
                    SubPageLink = "Survey Code"=field("No.");
                }
            }
            group(Control1000000015)
            {
                part(Control1000000016;"CS Index Description")
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
            //         if segment.Get("No.") then
            //         Page.RunModal(51209,segment);
            //     end;
            // }
        }
    }

    var
        segment: Record "Segment Header";
}

