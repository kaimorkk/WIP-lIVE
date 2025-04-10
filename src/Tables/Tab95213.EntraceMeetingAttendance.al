
table 95213 "Entrace Meeting Attendance"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document Type"; Option)
        {
            OptionCaption = ' ,Audit Commencement Notice,Auditee Notice Response,Audit Entrace Meeting,Pre-Audit Survey Invitation,Pre-Audit Survey Response';
            OptionMembers = " ","Audit Commencement Notice","Auditee Notice Response","Audit Entrace Meeting","Pre-Audit Survey Invitation","Pre-Audit Survey Response";
        }
        field(2; "Document No."; Code[20])
        {
        }
        field(3; "Engagement ID"; Code[20])
        {
        }
        field(4; "Resource No."; Code[20])
        {
            TableRelation = Resource."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Resource No.");
                if Employee.FindFirst() then begin
                    // Employee.CalcFields("Job Title");
                    Email := Employee."Company E-Mail";
                    Name := Employee.FullName;
                    "Phone No." := Employee."Phone No.";
                    "Job Title" := Employee."Job Title";
                end;
            end;
        }
        field(5; Name; Text[100])
        {
        }
        field(6; "Job Title"; Text[200])
        {
        }
        field(7; "Phone No."; Code[20])
        {
        }
        field(8; Email; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Document Type", "Document No.", "Engagement ID", "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

