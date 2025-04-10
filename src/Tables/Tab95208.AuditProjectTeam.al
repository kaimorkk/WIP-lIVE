
table 95208 "Audit Project Team"
{
    DrillDownPageID = "Audit Project Teams";
    LookupPageID = "Audit Project Teams";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Engagement ID"; Code[20])
        {
        }
        field(2; "Resource No."; Code[20])
        {
            TableRelation = Resource."No." where(Type = const(Person));

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Resource No.");
                if Resource.FindSet then
                    Name := Resource.Name;
                Employee.Reset;
                Employee.SetRange("No.", "Resource No.");
                if Employee.FindSet then begin
                    // Employee.CalcFields("Job Title");
                    "Job Title" := Employee."Job Title";
                    "Phone No." := Employee."Phone No.";
                    Email := Employee."Company E-Mail";
                end;
            end;
        }
        field(3; Name; Text[100])
        {
        }
        field(4; "Audit Team Type"; Option)
        {
            OptionCaption = ' ,Auditor Team,Auditee Team';
            OptionMembers = " ","Auditor Team","Auditee Team";
        }
        field(5; "Engagement Role"; Code[20])
        {
        }
        field(6; "Start Date"; Date)
        {
        }
        field(7; "End Date"; Date)
        {
        }
        field(8; "Default Audit Location ID"; Code[20])
        {
        }
        field(9; "Job Title"; Text[250])
        {
        }
        field(10; "Phone No."; Code[20])
        {
        }
        field(11; Email; Text[250])
        {
        }
        field(12; Blocked; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Engagement ID", "Resource No.")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        Employee: Record Employee;
}

