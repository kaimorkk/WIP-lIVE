table 69801 "Airtime Allocation Header"
{
    Caption = 'Airtime Allocation Header';
    DataClassification = CustomerContent;


    fields
    {
        field(1; No; Code[10])
        {
        }
        field(2; "Requestor ID"; Code[50])
        {
            Editable = false;
        }
        field(3; "Employee No"; Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
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
            HRSetup.Get;
            // HRSetup.TestField(HRSetup."Airtime Allocation Nos");
            // NoSeriesMgt.InitSeries(HRSetup."Airtime Allocation Nos", xRec."No. Series", 0D, No, "No. Series");
            "Requestor ID" := UserId;
            usersetup.reset();
            usersetup.setrange("User ID", UserId);
            if usersetup.FindSet() then
                "Employee No" := usersetup."Employee No.";
            Rec.Validate("Employee No");
        end;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        usersetup: Record "User Setup";
}

