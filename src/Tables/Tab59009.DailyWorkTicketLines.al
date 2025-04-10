
table 59009 "Daily Work Ticket Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Transport Requisition No"; Code[20])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No" where(Status = filter(Approved | Closed));

            trigger OnValidate()
            begin
                if TransReq.Get("Transport Requisition No") then begin
                    Commencement := TransReq.Commencement;
                    Destination := TransReq.Destination;
                    "Route Description" := TransReq."Route Description";
                    "Vehicle Allocated" := TransReq."Vehicle Allocated";
                    "Driver Allocated" := TransReq."Driver Allocated";
                    "Date of Request" := TransReq."Date of Request";
                    "Opening Odometer Reading" := TransReq."Opening Odometer Reading";
                    TransReq."Loaded to WorkTicket" := true;
                    employee.Reset;
                    employee.SetRange("No.", "Driver Allocated");
                    if employee.FindSet then
                        "Driver Name" := employee."First Name" + ' ' + employee."Middle Name" + ' ' + employee."Last Name";
                    TransReq.Modify;
                end;
            end;
        }
        field(2; Commencement; Text[30])
        {
        }
        field(3; Destination; Code[20])
        {
            Caption = 'Route Code';
            TableRelation = "Fleet Lookup".Code where(Type = const("Route Destination"));
            trigger OnValidate()
            var
                FleetLookup: Record "Fleet Lookup";
            begin
                FleetLookup.Reset();
                FleetLookup.SetRange(Type, FleetLookup.Type::"Route Destination");
                FleetLookup.SetRange(Code, Destination);
                if FleetLookup.FindFirst() then
                    "Route Description" := FleetLookup.Description;

            end;

        }
        field(4; "Vehicle Allocated"; Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange("Registration No.", "Vehicle Allocated");
                if FleetVehicles.FindFirst then
                    "Opening Odometer Reading" := FleetVehicles."Current Odometer Reading";
            end;
        }
        field(5; "Driver Allocated"; Code[20])
        {
            TableRelation = "Vehicle Drivers".Driver;
            trigger OnValidate()
            var
                VehicleDrivers: Record "Vehicle Drivers";
            begin
                VehicleDrivers.Reset();
                VehicleDrivers.SetRange(Driver, "Driver Allocated");
                if VehicleDrivers.FindFirst() then
                    "Driver Name" := VehicleDrivers."Driver Name";
            end;
        }
        field(7; "Date of Request"; Date)
        {
        }
        field(9; "Opening Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(11; "Daily Work Ticket"; Code[20])
        {
        }
        field(12; "Closing Odometer Reading"; Decimal)
        {
            DecimalPlaces = 0 : 0;

            trigger OnValidate()
            begin
                /* IF "Closing Odometer Reading"<>0 THEN BEGIN
                 IF "Closing Odometer Reading"< "Opening Odometer Reading" THEN
                     ERROR(Text002);
                 "Total Kilometres":="Closing Odometer Reading"-"Opening Odometer Reading";
                  END ELSE
                     "Total Kilometres":=0;*/

            end;
        }
        field(15; "Total Kilometres"; Decimal)
        {
            DecimalPlaces = 0 : 0;
        }
        field(16; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(17; "Time out"; Time)
        {
        }
        field(18; "Time In"; Time)
        {
        }
        field(19; "Fuel Drawn(Litres)"; Decimal)
        {
        }
        field(20; "Order No"; Code[20])
        {
        }
        field(21; "Authorized By"; Code[50])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if HrEmployee.Get("Authorized By") then begin
                    "Authorized By" := HrEmployee."First Name" + ' ' + HrEmployee."Middle Name" + ' ' + HrEmployee."Last Name";
                end;
            end;
        }
        field(22; Position; Text[30])
        {
        }
        field(23; "Driver Name"; Text[50])
        {
        }
        field(24; ReceiptNo; Text[50])
        {
        }
        field(25; "Oil Drawn(Litres)"; Decimal)
        {
        }
        field(26; "Journey/Route"; Text[150])
        {
        }
        field(27; "GOK Officer"; Text[150])
        {
        }
        field(28; Date; Date)
        {
        }
        field(29; "Authorized By Name"; Text[100])
        {
        }
        field(30; "Route Description"; Text[100])
        {
            Editable = false;
        }
        field(31; "Miles Per Litre(Fuel)"; Decimal)
        {
        }
        field(32; "Miles Per Litre(Oil)"; Decimal)
        {
        }
        field(33; "Fuel Carried Forward"; Decimal)
        {
        }

        field(34; "Defect Date"; Date)
        {
        }
        field(35; Defect; Text[250])
        {
        }
        field(36; "Action Taken Reported"; Text[250])
        {
        }

    }

    keys
    {
        key(Key1; "Daily Work Ticket", EntryNo)
        {
            Clustered = true;
            SumIndexFields = "Total Kilometres";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        /* WorkTktHder.RESET;
         WorkTktHder.SETRANGE(WorkTktHder."Daily Work Ticket","Daily Work Ticket");
         IF WorkTktHder.FIND('-') THEN BEGIN
            WorkTktHder.TESTFIELD(Status,WorkTktHder.Status::Open);
         END;

          IF  TransReq.GET("Transport Requisition No") THEN BEGIN

               TransReq."Loaded to WorkTicket":=FALSE;
               TransReq.MODIFY;
          END;*/

    end;

    trigger OnInsert()
    begin
        WorkTktHder.Reset;
        WorkTktHder.SetRange(WorkTktHder."Daily Work Ticket", "Daily Work Ticket");
        if WorkTktHder.Find('-') then begin
            if "Vehicle Allocated" <> WorkTktHder."Vehicle Registration No" then
                "Vehicle Allocated" := WorkTktHder."Vehicle Registration No";
            "Driver Allocated" := WorkTktHder."Driver Allocated";
            "Driver Name" := WorkTktHder."Driver Name";
        end;
    end;

    var
        TransReq: Record "Transport Requisition";
        employee: Record Employee;
        WorkTktHder: Record "Monthly Work Ticket Header";
        FleetVehicles: Record "Fleet Vehicles.";
        HrEmployee: Record Employee;
}

