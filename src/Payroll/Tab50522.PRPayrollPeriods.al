table 52193796 "PR Payroll Periods"
{
    LookupPageID = "PR Payroll Periods";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Period Month"; Integer)
        {
            Editable = true;
        }
        field(2; "Period Year"; Integer)
        {
            Editable = true;
        }
        field(3; "Period Name"; Text[30])
        {
            Editable = true;
        }
        field(4; "Date Opened"; Date)
        {
            Editable = true;
            NotBlank = true;
        }
        field(5; "Date Closed"; Date)
        {
            Editable = true;
        }
        field(6; Closed; Boolean)
        {
            Editable = true;
        }
        field(7; "Closed By"; Code[100])
        {
            Editable = true;
        }
        field(8; "Opened By"; Code[100])
        {
            Editable = true;
        }
        field(9; "Allow View Payslip?"; Boolean)
        {
        }
        field(10; "Proration Done"; Boolean)
        {
        }
        field(11; "Approval Status"; option)
        {
            OptionMembers = Open,"Pending Approval",Approved;
        }
        field(12; "Date Approved"; DateTime)
        {
        }
        field(13; Processing; Boolean)
        {
        }
        field(14; "Lock PCA"; Boolean)
        {
            Caption = 'Lock PCA/Data form Creation';

        }
    }

    keys
    {
        key(Key1; "Date Opened")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Date Opened", "Period Name")
        {
        }
    }
    trigger OnInsert()
    begin
        Employee.Reset();
        Employee.SetRange(Status, Employee.Status::Active);
        Employee.SetRange(Disabled, true);
        Employee.SetFilter("Disability Cert Expiry", '<=%1', CalcDate('CM', "Date Opened"));
        if Employee.FindSet() then
            repeat
                SalaryCard.Get(Employee."No.");
            //SalaryCard."PWD Certificate?" := false;
            // SalaryCard.Modify();
            until Employee.Next() = 0;

    end;

    var
        Employee: Record Employee;
        SalaryCard: Record "PR Salary Card";
}

