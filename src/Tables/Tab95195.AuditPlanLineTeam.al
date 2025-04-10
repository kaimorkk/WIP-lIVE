
table 95195 "Audit Plan Line Team"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Audit Plan ID"; Code[20])
        {
        }
        field(2; "Engagement Line No."; Integer)
        {
        }
        field(3; "Resource No."; Code[20])
        {
            TableRelation = Resource;

            trigger OnValidate()
            begin
                // Employee.RESET;
                // Employee.SETRANGE("No.", "Resource No.");
                // IF Employee.FINDSET THEN BEGIN
                //   "Resource No." := Employee."No.";
                //   Email:= Employee."E-Mail";
                //   Name := Employee."First Name";
                //   "Phone No.":= Employee."Phone No.";
                //   END;
                Resource.Reset;
                Resource.SetRange("No.", "Resource No.");
                if Resource.FindSet then begin
                    "Resource No." := Resource."No.";
                    // Email := Resource."E-mail Address";
                    Email := Resource.Email;
                    Name := Resource.Name;
                end;
            end;
        }
        field(4; Name; Text[100])
        {
        }
        field(5; "Audit Team Type"; Option)
        {
            OptionCaption = ' ,Auditor Team,Auditee Team';
            OptionMembers = " ","Auditor Team","Auditee Team";
        }
        field(6; "Engagement Role"; Code[20])
        {
        }
        field(7; "Start Date"; Date)
        {
        }
        field(8; "End Date"; Date)
        {
        }
        field(9; "Default Audit Location ID"; Code[20])
        {
        }
        field(10; "Job Title"; Text[250])
        {
        }
        field(11; "Phone No."; Code[20])
        {
        }
        field(12; Email; Text[250])
        {
        }
        field(13; Blocekd; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Audit Plan ID", "Engagement Line No.", "Resource No.")
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
        Employee: Record Employee;
        Resource: Record Resource;
}

