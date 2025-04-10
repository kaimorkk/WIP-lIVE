
table 59020 "Vehicle Driver Allocation"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Requisition Number"; Code[30])
        {
        }
        field(2; "Driver Code"; Code[30])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                VehicleDrivers.Reset;
                VehicleDrivers.SetRange(VehicleDrivers."Driver Code", "Driver Code");
                VehicleDrivers.SetFilter(VehicleDrivers.Status, '<>%1|<>%2|<>%3', VehicleDrivers.Status::Cancelled, VehicleDrivers.Status::Open, VehicleDrivers.Status::Closed);
                VehicleDrivers.SetFilter(VehicleDrivers."Requisition Number", '<>%1', "Requisition Number");
                if VehicleDrivers.Find('-') then begin
                    repeat
                    // ERROR('The Driver %1 has been allocated to another trip %2',"Driver Name",VehicleDrivers."Requisition Number");
                    until VehicleDrivers.Next = 0;
                end;
                Drivers.Reset;
                Drivers.SetRange(Drivers.Driver, "Driver Code");
                if Drivers.FindSet then
                    "Driver Name" := Drivers."Driver Name";
                if TransportRequisition.Get("Requisition Number") then begin
                    "Date of Trip" := TransportRequisition."Date of Trip";
                    "Number of Days" := TransportRequisition."No of Days Requested";
                    "Trip End Date" := TransportRequisition."Trip End Date";
                end;
                /*TraveStaff.RESET;
                TraveStaff.SETRANGE(TraveStaff."Req No","Requisition Number");
                TraveStaff.SETFILTER(TraveStaff."Allocated Vehicle Reg No",'%1','');
                IF TraveStaff.FIND('-') THEN BEGIN
                  REPEAT
                    TraveStaff1."Allocated Vehicle Reg No" =*/

            end;
        }
        field(3; "Driver Name"; Text[100])
        {
        }
        field(4; "Number of Days"; Decimal)
        {

            trigger OnValidate()
            begin
                "Trip End Date" := CalcDate(Format("Number of Days") + 'D', "Date of Trip");
            end;
        }
        field(7; "Reassigned?"; Boolean)
        {
        }
        field(8; "New Trip"; Code[50])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No";
        }
        field(9; "Date of Trip"; Date)
        {

            trigger OnValidate()
            begin
                /*TRStaff.RESET;
                TRStaff.SETRANGE(TRStaff."Employee No","Employee No");
                //TRStaff.SETFILTER(TRStaff."Date of Trip",'>=%1&<=%2',"Date of Trip",TRStaff."Trip End Date");
                IF TRStaff.FIND() THEN BEGIN
                  MESSAGE('The employee is currently assigned to trip %1 from %2 to %3',TRStaff."Req No",TRStaff."Date of Trip",TRStaff."Trip End Date");
                END;
                */

                TransportRequisition.Reset;
                TransportRequisition.SetRange("Transport Requisition No", "Requisition Number");
                if TransportRequisition.FindFirst then begin
                    if "Date of Trip" < TransportRequisition."Date of Trip" then
                        Error('The date of tip %1 must be later or equal to date of trip %2 in the header', "Date of Trip", TransportRequisition."Date of Trip")
                end;
                "Trip End Date" := CalcDate(Format("Number of Days") + 'D', "Date of Trip");

            end;
        }
        field(10; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled,Closed';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;
        }
        field(11; "Trip End Date"; Date)
        {
        }
        field(12; "Date Reassigned"; Date)
        {
        }
        field(13; "Requisition Status"; Option)
        {
            CalcFormula = lookup("Transport Requisition".Status where("Transport Requisition No" = field("Requisition Number")));
            FieldClass = FlowField;
            OptionCaption = 'Open,Pending Approval,Approved,Rejected,Cancelled,Closed';
            OptionMembers = Open,"Pending Approval",Approved,Rejected,Cancelled,Closed;
        }
        field(14; "Vehicle Registration No"; Code[30])
        {
            TableRelation = "Fleet Vehicle Allocation"."Vehicle Req. No" where("Transport Requisition No" = field("Requisition Number"));
        }

        field(15; "Vehicle Description"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Requisition Number", "Driver Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        VehicleDrivers: Record "Vehicle Driver Allocation";
        TransportRequisition: Record "Transport Requisition";
        Drivers: Record "Vehicle Drivers";
        // ProjectMembers: Record "Project Members";
        TraveStaff: Record "Travel Requisition Staff";
        TraveStaff1: Record "Travel Requisition Staff";
        Text0001: label 'Are you sure you want to change the allocated vehicle?\This will send a notification to the transport Admin';
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Emp: Record Employee;
        FileDirectory: Text[100];
        FleetManagementSetup: Record "Fleet Management Setup";
        SentMail: Text;
}

