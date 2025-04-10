
table 69555 "Succession Plan Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[30])
        {
        }
        field(2; "Employee No"; Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Employee No");
                if Employee.FindSet then begin
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    Directorate := Employee."Directorate Code";
                    Department := Employee."Department Code";
                    "Current Position ID" := Employee."Job ID";

                end;
            end;
        }
        field(3; "Employee Name"; Text[250])
        {
        }
        field(4; "Current Position ID"; Code[50])
        {
            TableRelation = "Company Positions"."Position ID" where(Blocked = const(false));
        }
        field(5; "Projected Position ID"; Code[50])
        {
            TableRelation = "Company Positions"."Position ID" where(Blocked = const(false));
        }
        field(6; "Planned Start Date"; Date)
        {
        }
        field(7; "Planned End Date"; Date)
        {

            trigger OnValidate()
            begin
                if "Planned End Date" < "Planned Start Date" then
                    Error('Planned End date must be greater than Start Date');
            end;
        }
        field(8; Directorate; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter(Directorate));
        }
        field(9; Department; Code[30])
        {
            TableRelation = "Responsibility Center" where("Operating Unit Type" = filter("Department/Center"));
        }
        field(10; Mentor; Code[10])
        {
            TableRelation = Resource."No." where(Type = const(Person),
                                                  Blocked = const(false));
        }
        field(11; "Default Mentorship Template"; Code[30])
        {
            TableRelation = "Succession Template".Code where(Blocked = const(false));
        }
        field(12; "Readyness Level"; option)
        {
            OptionMembers = ,"Ready Now","1-2 Years","2-5 Years","More than 5 Years";
        }
        field(13; "Talent 9 Box Code"; code[20])
        {
            // TableRelation= "Talent 9 Box Grid".Code;
        }
    }

    keys
    {
        key(Key1; "Document No", "Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        CompanyPositions: Record "Company Positions";
}

