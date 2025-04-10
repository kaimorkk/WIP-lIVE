table 50094 "Tyre Requisition"
{
    Caption = 'Tyre Requisition';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Date"; Date)
        {
            Caption = 'Date';
        }

        field(23; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Reg No."; Code[20])
        {
            Caption = 'Reg No.';
        }
        field(3; Make; Code[50])
        {
            Caption = 'Make';
        }
        field(4; "Current Mileage"; Decimal)
        {
            Caption = 'Current Mileage';
        }
        field(5; User; Code[20])
        {
            Caption = 'User';
        }
        field(6; "Replacement Date"; Date)
        {
            Caption = 'Replacement Date';
        }
        field(7; Mileage; Decimal)
        {
            Caption = 'Mileage';
        }
        field(8; Reasons; Text[250])
        {
            Caption = 'Reasons';
        }
        field(9; "Tyre size Requested"; Code[20])
        {
            Caption = 'Tyre size Requested';
            TableRelation = "Vehicle Tyre Size";
        }
        field(10; "Quantity Requested"; Integer)
        {
            Caption = 'Quantity Requested';
        }
        field(11; "Type"; Option)
        {
            Caption = 'Type';
            OptionMembers = Requested,Issued,Returned;
        }


        field(12; Requester; Code[20])
        {
            Caption = 'Requester';
            TableRelation = Employee;
        }
        field(13; "Mobile No."; Integer)
        {
            Caption = 'Mobile No.';
        }
        field(14; "Transport Officer"; Code[20])
        {
            Caption = 'Transport Officer';
            TableRelation = Employee;

        }
        field(15; "Issuing Officer"; Code[20])
        {
            Caption = 'Issuing Officer';
            TableRelation = Employee;

        }
        field(16; "Returning Officer"; Code[20])
        {
            Caption = 'Returning Officer';
        }
        field(17; "Facilitating Officer"; Code[20])
        {
            Caption = 'Facilitating Officer';
        }
        field(18; "Procurement Officer"; Code[20])
        {
            Caption = 'Procurement Officer';
        }

        field(19; "User Type"; Option)
        {
            OptionMembers = Judge,Station,User;
        }

        field(20; "Quantity Issued"; Integer)
        {
            Caption = 'Quantity Issued';
        }
        field(21; "Quantity Returned"; Integer)
        {
            Caption = 'Quantity Returned';
        }

        field(22; "Tyre size Returned"; Code[20])
        {
            Caption = 'Tyre size Requested';
        }

        field(24; Status; Option)
        {
            OptionMembers = Open,"Pending Approval",Approved;
        }

        field(25; "Lines No"; Code[20])
        {

        }

        field(26; "No. Series"; Code[20])
        {

        }

      
       
    }


    keys
    {
        key(PK; "No.", "Lines No")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
            FleetSetup.Get();
            FleetSetup.TestField(FleetSetup."Tyre Requisition Nos");
            NoSeriesMgt.InitSeries(FleetSetup."Tyre Requisition Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    var
        FleetSetup: Record "Fleet Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
