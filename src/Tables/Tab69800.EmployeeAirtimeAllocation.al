table 69800 "Employee Airtime Allocation"
{
    Caption = 'Employee Airtime Allocation';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Document No';
            AutoIncrement = true;
            editable = false;
        }
        field(2; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            TableRelation = Employee."No.";
            editable = false;
            //trigger OnValidate()
            // var
            //     HrEmp: Record Employee;
            // begin
            //     if HrEmp.Get("Employee No") then
            //         "Employee Name" := HrEmp.FullName();
            // end;

        }
        field(4; "Airtime Amount"; Decimal)
        {
            Caption = 'Airtime';
        }
        field(5; "Phone No."; Code[12])
        {
        }
        field(6; "Service Provider No"; Code[20])
        {
            TableRelation = Vendor."No.";
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
            editable = false;
        }
        field(8; Type; option)
        {
            OptionMembers = Postpaid,Prepaid;
            OptionCaption = 'Postpaid,Prepaid';
        }
    }
    keys
    {
        key(PK; "Employee No", "Service Provider No")
        {
            Clustered = true;
        }
    }
}
