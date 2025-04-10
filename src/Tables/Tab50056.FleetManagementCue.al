table 52193434 "Fleet Management Cue"
{
    Caption = 'Fleet Management Cue';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';

        }
        field(2; "No of Active Vehicles"; Integer)
        {
            Caption = 'No of Active Vehicles';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Fleet Vehicles." where(Blocked = const(false)));

        }
        field(3; "No of Grounded Vehicles"; Integer)
        {
            Caption = 'No of Grounded Vehicles';
            FieldClass = FlowField;
            CalcFormula = count("Fleet Vehicles." where(Blocked = const(true)));
        }
        field(4; "No of Active Drivers"; Integer)
        {
            Caption = 'No of Active Drivers';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Drivers" where(Active = const(true)));
        }
        field(5; "No of InActive Drivers"; Integer)
        {
            Caption = 'No of InActive Drivers';
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Vehicle Drivers" where(Active = const(false)));
        }
        field(6; "Service Providers."; Integer)
        {
            Caption = 'Service Providers.';
            BlankZero = true;
            // FieldClass = FlowField;
            // CalcFormula = count(Vendor where("Vendor Type" = const(Fleet)));
        }
        field(7; "Pending Maintenance Requests"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Fuel & Maintenance Requisition" where(Status = const("Pending Approval")));
        }

        field(8; "Pending Transport Requests"; Integer)
        {
            BlankZero = true;
            FieldClass = FlowField;
            CalcFormula = count("Transport Requisition" where(Status = const("Pending Approval")));
        }

        field(9; "Pending Tyre Requests"; Integer)
        {
            BlankZero = true;
            // FieldClass = FlowField;
            // CalcFormula = count("Purchase Header" where(Status = const("Pending Approval"),
            // "Document Type" = const("Store Requisition"), "Requisition Type" = const(Tyre)));
        }
        field(10; "Requests to Approve"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Approver ID" = field("User ID Filter"),
                                                        Status = const(Open)));
            Caption = 'Requests to Approve';
            FieldClass = FlowField;
        }
        field(11; "Requests Sent for Approval"; Integer)
        {
            CalcFormula = count("Approval Entry" where("Sender ID" = field("User ID Filter"),
                                                        Status = filter(Open)));
            Caption = 'Requests Sent for Approval';
            FieldClass = FlowField;
        }
        field(12; "User ID Filter"; Code[50])
        {
            Caption = 'User ID Filter';
            FieldClass = FlowFilter;
        }

        field(13; "Approved Tyre Requests"; Integer)
        {
            BlankZero = true;
            // FieldClass = FlowField;
            // CalcFormula = count("Purchase Header" where(Status = const(Released),
            // "Document Type" = const("Store Requisition"), "Fully Issued"
            //  = const(false), "Requisition Type" = const(Tyre)));
        }

        field(14; "Issued Tyre Requests"; Integer)
        {
            BlankZero = true;
            // FieldClass = FlowField;
            // CalcFormula = count("Purchase Header" where(Status = const(Released),
            // "Document Type" = const("Store Requisition"), "Fully Issued"
            //  = const(true), "Requisition Type" = const(Tyre)));
        }


    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
