table 50071 "HR Airtime Staff"
{
    Caption = 'HR Airtime Staff';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No"; Code[20])
        {
            Caption = 'Document No';
        }
        field(2; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            TableRelation = Employee."No.";
            // editable = false;
            trigger OnValidate()
            var
                HrEmp: Record Employee;
            begin
                if HrEmp.Get("Employee No") then
                    "Employee Name" := HrEmp.FullName();
                Designation := HrEmp."Job Title2";
                "Salary Scale" := HrEmp."Salary Scale";
                "Current Position ID" := HrEmp."Current Position ID";
                "Employee Category Type" := HrEmp."Employee Category Type";
            end;

        }
        field(3; "Employee Name"; Text[250])
        {
            Caption = 'Employee Name';
            // editable = false;
        }
        field(4; Airtime; Decimal)
        {
            Caption = 'Airtime';
            // editable = false;
        }
        field(5; "Phone No."; Code[12])
        {
            // editable = false;
        }
        field(6; "Service Provider No"; Code[20])
        {
            TableRelation = Vendor."No.";
            // editable = false;
            trigger OnValidate()
            var
                HrEmp: Record Vendor;
            begin
                if HrEmp.Get("Service Provider No") then
                    "Service Provider Name" := HrEmp.Name;
            end;

        }
        field(7; "Service Provider Name"; Text[300])
        {
            // editable = false;
        }
        field(8; Type; option)
        {
            OptionMembers = Postpaid,Prepaid;
            OptionCaption = 'Postpaid,Prepaid';
            // editable = false;
        }

        field(9; "Line No"; Integer)
        {
            Caption = 'Document No';
            AutoIncrement = true;
            // editable = false;
        }
        field(10; "Designation"; Text[250])
        {
            Caption = 'Employee Name';
            // editable = false;
        }
        field(11; "Current Position ID"; Code[30])
        {
            TableRelation = "Company Positions"."Position ID";
            // editable = false;

        }
        field(12; "Salary Scale"; Code[30])
        {
            TableRelation = "Salary Scales".Scale;
            // editable = false;
        }
        field(70093; "Employee Category Type"; Option)
        {
            OptionCaption = '"...",Attachee,Casual,Intern,Judge,Judicial Officer,Judicial Staff,Pupillage,Temporary';
            OptionMembers = "...",Attachee,Casual,"Intern","Judge","Judicial Officer","Judicial Staff","Pupillage","Temporary";
        }
    }
    keys
    {
        key(PK; "Document No", "Line No")
        {
            Clustered = true;
        }
    }
}
