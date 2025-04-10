
table 95180 "Risk & Audit Officer"
{
    DrillDownPageID = "Risk & Audit Officers";
    LookupPageID = "Risk & Audit Officers";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Resource No."; Code[20])
        {
        }
        field(2; "Employee Name"; Text[100])
        {
            Editable = false;
            TableRelation = Employee;
        }
        field(3; "Employee No."; Code[20])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Employee No.");
                if Resource.FindSet then begin
                    "Employee No." := Resource."No.";
                    "Employee Name" := Resource.Name;
                    // Email := Resource."E-mail Address";
                    Email := Resource.Email;
                end;
                // Employee.RESET;
                // Employee.SETRANGE("No.", "Employee No.");
                // IF Employee.FINDSET THEN BEGIN
                //  "Employee No.":= Employee."No.";
                //  "Employee Name":= Employee."First Name";
                //  Email:= Employee."E-Mail";
                //  END;
            end;
        }
        field(4; "No. of Assigned Audit Projects"; Integer)
        {
        }
        field(5; Email; Text[50])
        {
        }
    }

    keys
    {
        key(Key1; "Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

