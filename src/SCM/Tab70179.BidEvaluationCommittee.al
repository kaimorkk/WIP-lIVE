
table 70179 "Bid Evaluation Committee"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
        }
        field(2; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(3; "Appointed Bid Opening Com"; Code[30])
        {
            Caption = 'Appointed Bid Opening Committee';
            Description = 'Appointed Bid Opening Committee';
        }
        field(4; "Role Type"; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant';
            OptionMembers = Member,Chairperson,Secretary,Consultant;
        }
        field(5; "Member No."; Code[30])
        {
            Description = 'Linked to Resource Table (This shall support definition of both staff and non-staff (e.g. Experts and Consultants) who form the committee';
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Resources.Get;
                Resources.SetRange("No.", "Member No.");
                if Resources.FindSet then begin
                    "Member Name" := Resources.Name;
                    Emp.Reset;
                    Emp.SetRange("No.", "Member No.");
                    if Emp.FindSet then begin
                        "Staff  No." := Emp."No.";
                    end;

                end;
            end;
        }
        field(6; "Member Name"; Text[60])
        {
            Editable = false;
        }
        field(7; Designation; Text[60])
        {
            Editable = false;
        }
        field(8; "ID/Passport No"; Code[30])
        {
        }
        field(9; "Tax Registration (PIN) No."; Code[30])
        {
        }
        field(10; Email; Text[80])
        {
        }
        field(11; "Telephone No."; Text[50])
        {
        }
        field(12; "Staff  No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange("No.", "Staff  No.");
                if Emp.FindSet then begin
                    //Emp.CalcFields("Job Title");
                    Designation := Emp."Job Title";
                    "ID/Passport No" := Emp."ID Number";
                    "Tax Registration (PIN) No." := Emp."P.I.N";
                end;
            end;
        }
        field(13; "IFS Code"; Code[20])
        {
            TableRelation = "Standard Purchase Code".Code;
        }
        field(14; "Notified on Email"; Boolean)
        {
        }
        field(15; "Date/Time Notified"; DateTime)
        {
        }
        field(16; Type; Option)
        {
            OptionCaption = 'Bid Opening,Evaluation';
            OptionMembers = "Bid Opening",Evaluation;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Resources: Record Resource;
        Emp: Record Employee;
}

