
table 69639 "Commitee Appointed Member"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
        }
        field(2; "Document Type"; Option)
        {
            OptionCaption = 'Appointment,Termination';
            OptionMembers = Appointment,Termination;
        }
        field(3; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(4; "Member No."; Code[30])
        {
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Member No.");
                if Resource.FindSet then begin
                    Employee.Reset;
                    Employee.SetRange("No.", Resource."No.");
                    if Employee.Find('-') then begin
                        "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        "Member Email" := Employee."E-Mail";
                        "Telephone No." := Employee."Phone No.";
                        "Staff No." := Employee."No.";
                        "ID/Passport No" := Employee."ID Number";
                        // Employee.CalcFields("Job Title");
                        Designation := Employee."Job Title";
                        "Tax Registration (PIN) No." := Employee."PIN Number";

                    end;
                end;
            end;
        }
        field(5; Role; Option)
        {
            OptionCaption = 'Member,Chairperson,Secretary,Consultant,Joint Secretary,Secretariat Support,Secretariat,In Attendace,Alternate Chairperson,Alternate Secretary';
            OptionMembers = Member,Chairperson,Secretary,Consultant,"Joint Secretary","Secretariat Support",Secretariat,"In Attendace","Alternate Chairperson","Alternate Secretary";
        }
        field(6; "Member Name"; Text[50])
        {
        }
        field(7; "Member Email"; Text[50])
        {
            ExtendedDatatype = EMail;
        }
        field(8; "Telephone No."; Text[30])
        {
            ExtendedDatatype = PhoneNo;
        }
        field(9; Designation; Text[250])
        {
        }
        field(10; "Staff No."; Code[30])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Staff No.");
                if Employee.FindFirst then begin
                    "ID/Passport No" := Employee."ID Number";
                    "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Member Email" := Employee."E-Mail";
                end
            end;
        }
        field(11; "ID/Passport No"; Code[15])
        {
        }
        field(12; "Tax Registration (PIN) No."; Code[15])
        {
        }
        field(13; "Notified on Email"; Boolean)
        {
        }
        field(14; "Date/Time Notified"; DateTime)
        {
        }
        field(15; "Effective Date"; Date)
        {
        }
        field(16; "Expiry Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No", "Member No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        Resource: Record Resource;
}

