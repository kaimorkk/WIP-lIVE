

page 52194239 "Transport Requisition Trip"
{
    PageType = Card;
    SourceTable = "Transport Requisition Trips";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Vehicle Allocated"; Rec."Vehicle Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Purpose of Trip"; Rec."Purpose of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            group("Trip Details")
            {
                Editable = TripOpen;
                field("Oil Drawn"; Rec."Oil Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("Fuel Drawn"; Rec."Fuel Drawn")
                {
                    ApplicationArea = Basic;
                }
                field("POL Voucher No"; Rec."POL Voucher No")
                {
                    ApplicationArea = Basic;
                }
                field("Opening Odometer"; Rec."Opening Odometer")
                {
                    ApplicationArea = Basic;
                }
                field("Odometer at the End"; Rec."Odometer at the End")
                {
                    ApplicationArea = Basic;
                }
                field("Details of Journey"; Rec."Details of Journey")
                {
                    ApplicationArea = Basic;
                }
                field("Kilometers of Journey"; Rec."Kilometers of Journey")
                {
                    ApplicationArea = Basic;
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Caption = 'Details of Journey Route in Full';
                }
                field("Authorized by  No"; Rec."Authorized by  No")
                {
                    ApplicationArea = Basic;
                }
                field("Authorized by Name"; Rec."Authorized by Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control23; "Trip Incidence and Accidents")
            {
                Editable = TripOpen;
                SubPageLink = RegNo = field("Transport Requisition No"),
                              Driver = field("Driver Allocated");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Close Trip")
            {
                ApplicationArea = Basic;
                Enabled = TripOpen;
                Image = Close;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to close this tip?', true) then begin
                        Rec.Status := Rec.Status::Closed;
                        Rec.Modify(true);
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Close Trip_Promoted"; "Close Trip")
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        TripOpen := true;
        if Rec.Status <> Rec.Status::Open then
            TripOpen := false;
    end;

    var
        TripOpen: Boolean;
}

#pragma implicitwith restore

