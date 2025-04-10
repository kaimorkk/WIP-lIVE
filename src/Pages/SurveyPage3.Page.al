Page 52193858 "Survey Page3"
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
            group(OverallCustomerSatisfactionIndex)
            {
                Caption = 'Overall Customer Satisfaction Index';
                part(Control1000000015;"Overal Consumers CSI")
                {
                    Description = '<>';
                    SubPageLink = "Survey Id"=field("No.");
                }
            }
            group(CunsumerCustomersatisfactionindexescomparisonforIn)
            {
                Caption = 'Cunsumer Customer satisfaction indexes comparison for Individual/domestic and commercial consumers';
                part(Control1000000013;"Satisfaction Indexes Compariso")
                {
                    SubPageLink = "Survey ID"=field("No.");
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Preview)
            {
                ApplicationArea = Basic;
                Caption = 'Preview';

                trigger OnAction()
                begin
                    Segment.Reset;
                    Segment.SetRange(Segment."No.","No.");
                    if Segment.Find('-') then
                    Report.RunModal(51057,true,false,Segment);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Preview_Promoted; Preview)
                {
                }
            }
        }
    }

    var
        Segment: Record "Segment Header";
}

