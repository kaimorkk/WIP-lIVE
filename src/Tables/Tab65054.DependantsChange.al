table 65054 "Dependants Change"
{
    Caption = 'Dependants Change';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
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
                "Current Duty Station" := Employee."Current Duty Station";
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
        field(16; "Document Type"; Option)
        {
            OptionCaption = 'Dependants Change,Medical Card Replacement,Ex Gratia';
            OptionMembers = "Dependants Change","Medical Card Replacement","Ex Gratia";
        }
        field(17; "Dependant No"; Code[20])
        {
            TableRelation = "HR Employee Kin"."Employee Code" where("Employee Code" = field("Employee No"));
        }
        field(18; "Dependant Name"; Text[200])
        {
        }
        field(19; "Old Dependant No"; Code[20])
        {
            TableRelation = "HR Employee Kin"."Employee Code" where("Employee Code" = field("Employee No"));
        }
        field(20; "Old Dependant Name"; Text[200])
        {
        }
        field(21; "Card No"; Code[20])
        {

        }
        field(22; "Reason For Change"; Text[250])
        {
        }
        field(23; "Application Type"; Option)
        {

            OptionMembers = ,Self,Dependant;
        }
        field(24; "Current Duty Station"; Text[250])
        {
        }
        field(25; "Payment Reference No"; Code[50])
        {
            Caption = 'Mpesa Payment Reference No';
        }
    }

    keys
    {
        key(Key1; "Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document Type" = "Document Type"::"Dependants Change" then begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Dependants Change Nos.");
            if "Document No" = '' then
                NoSeriesMgt.InitSeries(HumanResourcesSetup."Dependants Change Nos.", xRec."No. Series", 0D, "Document No", "No. Series");
        end else
            if "Document Type" = "Document Type"::"Medical Card Replacement" then begin
                HumanResourcesSetup.Get;
                HumanResourcesSetup.TestField("Medical Cards Replacement");
                if "Document No" = '' then
                    NoSeriesMgt.InitSeries(HumanResourcesSetup."Medical Cards Replacement", xRec."No. Series", 0D, "Document No", "No. Series");

            // end else
            //     if "Document Type" = "Document Type"::"Ex Gratia" then begin
            //         HumanResourcesSetup.Get;
            //         HumanResourcesSetup.TestField("Ex Gratia Nos");
            //         if "Document No" = '' then
            //             NoSeriesMgt.InitSeries(HumanResourcesSetup."Ex Gratia Nos", xRec."No. Series", 0D, "Document No", "No. Series");

                end;
        "Document Date" := Today;
        "Time Created" := Time;
    end;



    var
        EmployeeWorkShift: Record "Employee Work Shift";
        JobApplications: Record "Job Applications";
        RecruitmentRequisition: Record "Recruitment Requisition Header";
        Positions: Record "Company Positions";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
}

