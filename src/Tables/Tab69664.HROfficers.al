
table 69664 "HR Officers"
{
    DrillDownPageID = "HR Officers";
    LookupPageID = "HR Officers";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Employee No."; Code[30])
        {
            TableRelation = Employee where(Status = filter(Active));

            trigger OnValidate()
            begin
                if Employee.Get("Employee No.") then begin
                    "First Name" := Employee."First Name";
                    "Last Name" := Employee."Last Name";
                    "Middle Name" := Employee."Middle Name";
                    Status := Employee.Status;
                end
            end;
        }
        field(2; "First Name"; Text[30])
        {
        }
        field(3; "Last Name"; Text[30])
        {
        }
        field(4; "Middle Name"; Text[30])
        {
        }
        field(5; Status; Option)
        {
            OptionCaption = 'Active,Inactive,Terminated';
            OptionMembers = Active,Inactive,Terminated;
        }
    }

    keys
    {
        key(Key1; "Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Employee No.", "First Name", "Last Name")
        {
        }
    }

    var
        Employee: Record Employee;
}

