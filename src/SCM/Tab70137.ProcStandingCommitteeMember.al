
table 70137 "Proc Standing Committee Member"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Procurement Standing Committee";
        }
        field(2; "Committee Type"; Code[20])
        {
            TableRelation = "Procurement Committee Types"."Committee Type";
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; Role; Option)
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
                        Designation := Emp."Job Title";
                        "ID/Passport No" := Emp."ID Number";
                        "Tax Registration (PIN) No." := Emp."P.I.N";
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
    }

    keys
    {
        key(Key1; "Document No.", "Committee Type", "Line No")
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

