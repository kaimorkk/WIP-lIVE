Table 70177 "Bid Opening Tender Committee"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Bid Opening Register".Code;
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
                Resources.reset;
                Resources.SetRange("No.", "Member No.");
                if Resources.findfirst then begin
                    "Member Name" := Resources.Name;
                    //rec."Telephone No." := Resources."M-Pesa Number";
                    Emp.Reset;
                    Emp.SetRange("No.", Resources."No.");
                    if Emp.FindFirst() then begin
                        "Staff  No." := Emp."No.";
                        rec.Validate(rec."Staff  No.");
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
            DataClassification = ToBeClassified;
        }
        field(12; "Staff  No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange("No.", "Staff  No.");
                if Emp.FindSet then begin
                    Emp.CalcFields("Job Title");
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
        field(30; "Opening Person 1"; Code[60])
        {
        }
        field(31; "Opening Person 2"; Code[60])
        {
        }
        field(32; "Opening Person 3"; Code[60])
        {
        }
        field(33; "Nominated Bid Opening"; Option)
        {
            OptionCaption = ' ,Member 1,Member 2 ,Member 3,Member 4,Member 5';
            OptionMembers = " ","Member 1","Member 2 ","Member 3","Member 4","Member 5";
        }
        field(35; "Opening Person 4"; Code[60])
        {
        }
        field(36; "Opening Person 5"; Code[60])
        {
        }
        field(37; "Member Code"; code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(38; Passcode; Code[30])
        {
            DataClassification = ToBeClassified;
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

