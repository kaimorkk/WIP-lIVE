

page 59049 "Driver Vehicle Allocation"
{
    PageType = ListPart;
    SourceTable = "Vehicle Driver Allocation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Driver Code"; Rec."Driver Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Driver''s Personal Number';
                    ToolTip = 'Specifies the value of the Driver''s Personal Number field.';
                    trigger OnValidate()
                    var

                        TransportReq: Record "Transport Requisition";
                    begin
                        TransportReq.Get(Rec."Requisition Number");
                        TransportReq.TestField("Date of Trip");
                        DriverAllocation.Reset;
                        DriverAllocation.SetRange(DriverAllocation."Driver Code", Rec."Driver Code");
                        DriverAllocation.SetFilter(DriverAllocation.Status, '%1|%2|%3', DriverAllocation.Status::Approved, DriverAllocation.Status::Open, DriverAllocation.Status::"Pending Approval");
                        DriverAllocation.SetFilter(DriverAllocation."Requisition Number", '<>%1', Rec."Requisition Number");
                        DriverAllocation.SetFilter("Trip End Date", '>=%1', TransportReq."Date of Trip" - 1);
                        if DriverAllocation.Find('-') then begin
                            repeat
                                Error('The Driver %1 has been allocated to another trip %2', Rec."Driver Name", DriverAllocation."Requisition Number");
                            until DriverAllocation.Next = 0;
                        end;
                    end;
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Number of Days"; Rec."Number of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Days field.';
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Trip End Date field.';
                }
                field("Vehicle Registration No"; Rec."Vehicle Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Registration No field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("&Line")
            {
                Caption = '&Line';
                Image = Line;
                action("Reassign to Another Trip")
                {
                    ApplicationArea = Basic;
                    Image = Refresh;
                    ToolTip = 'Executes the Reassign to Another Trip action.';
                    trigger OnAction()
                    begin
                        if Rec."Reassigned?" = true then
                            Error('The Driver has already been reassigned to another trip');
                        TravelRequ.Reset;
                        TravelRequ.SetRange("Driver Code", Rec."Driver Code");
                        TravelRequ.SetRange("Requisition Number", Rec."Requisition Number");
                        if Dialog.Confirm('Are you sure you want to reasign %1 to another trip?', true, Rec."Driver Name") then
                            Report.Run(58999, true, true, TravelRequ);
                    end;
                }
            }
        }
    }

    var
        DriverAllocation: Record "Vehicle Driver Allocation";
        TravelRequ: Record "Vehicle Driver Allocation";
}

#pragma implicitwith restore

