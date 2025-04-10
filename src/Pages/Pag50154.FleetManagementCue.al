page 52193521 "Fleet Management Cue"
{
    Caption = 'Fleet Management Cue';
    PageType = CardPart;
    SourceTable = "Fleet Management Cue";

    layout
    {
        area(content)
        {
            cuegroup("Fleet Activities")
            {

                field("No of Active Vehicles"; Rec."No of Active Vehicles")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Active Vehicles field.';
                }
                field("No of Grounded Vehicles"; Rec."No of Grounded Vehicles")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Grounded Vehicles field.';
                }
                field("No of Active Drivers"; Rec."No of Active Drivers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of Active Drivers field.';
                }
                field("No of InActive Drivers"; Rec."No of InActive Drivers")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No of InActive Drivers field.';
                }
            }
            cuegroup("Fleet Maintenance Activities")
            {
                field("Service Providers."; Rec."Service Providers.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Providers. field.';
                }
                field("Pending Maintenance Requests"; Rec."Pending Maintenance Requests")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Maintenance Requests field.';
                }

                field("Pending Tyre Requests"; Rec."Pending Tyre Requests")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Tyre Requests field.';
                    DrillDownPageId = "Tyre Requisition List";
                }
                field("Approved Tyre Requests"; Rec."Approved Tyre Requests")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approved Tyre Requests field.';
                    DrillDownPageId = "Tyre Requisition List";

                }
            }
            cuegroup("Transport Activities")
            {
                field("Pending Transport Requests"; Rec."Pending Transport Requests")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Transport Requests field.';
                }
            }
            cuegroup("Document Approvals")
            {
                Caption = 'Document Approvals';
                field("Requests to Approve"; Rec."Requests to Approve")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Requests to Approve";
                    ToolTip = 'Specifies the value of the Requests to Approve field.';
                }
                field("Requests Sent for Approval"; Rec."Requests Sent for Approval")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Approval Entries";
                    ToolTip = 'Specifies the value of the Requests Sent for Approval field.';
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get() then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("User ID Filter", '=%1', UserId);
    end;
}
