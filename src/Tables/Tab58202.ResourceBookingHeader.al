table 58202 "Resource Booking Header"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[10])
        {
        }
        field(2; "Requestor ID"; Code[50])
        {
        }
        field(3; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
                "Implementing Unit Code" := Employee."Directorate Code";
                "Duty Station" := Employee."Current Duty Station";
            end;
        }
        field(4; "Employee Name"; Text[250])
        {
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Document Date"; Date)
        {
        }
        field(7; "Time Created"; Time)
        {
        }
        field(8; "Posted By"; Code[50])
        {
        }
        field(9; "Posting Date"; Date)
        {
        }
        field(10; "Posting Time"; Time)
        {
        }
        field(11; Status; Option)
        {
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12; "Document Status"; Option)
        {
            OptionCaption = 'Draft,Submitted,Closed,Rejected';
            OptionMembers = Draft,Submitted,Closed,Rejected;
        }
        field(13; Type; Option)
        {
            OptionCaption = ',Appointment,Reservation';
            OptionMembers = ,Appointment,Reservation;
        }
        field(14; Posted; Boolean)
        {
        }
        field(15; "No. Series"; Code[10])
        {
        }
        field(70018; "Implementing Unit Code"; Code[50])
        {
            Caption = 'Implementing Unit';
            DataClassification = CustomerContent;
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate | "Court Stations" | "Department/Center" | "Division/Section" | Office));
            trigger OnValidate()
            var
                RespC: Record "Responsibility Center";
            begin
                if RespC.get("Implementing Unit Code") then
                    "Implementing Unit Name" := RespC.Name;
            end;
        }

        field(70092; "Implementing Unit Name"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(69601; "Duty Station"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "Duty Station";
        }
    }

    keys
    {
        key(Key1; No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
            ResourceBookingSetup.Get;
            ResourceBookingSetup.TestField(ResourceBookingSetup."Reservation Nos");
            NoSeriesMgt.InitSeries(ResourceBookingSetup."Reservation Nos", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    var
        Employee: Record Employee;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ResourceBookingSetup: Record "Resource Booking Setup";
}

