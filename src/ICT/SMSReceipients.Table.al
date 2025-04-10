Table 51957 "SMS Receipients"
{

    fields
    {
        field(1; "Code"; Code[20])
        {
        }
        field(2; Type; Option)
        {
            OptionCaption = ' ,Employee,Suppliers,Customer';
            OptionMembers = " ",Employee,Suppliers,Customer;
        }
        field(3; "Account No"; Code[20])
        {
            TableRelation = if (Type = const(Suppliers)) "Vendor"."No."
            else
            if (Type = const(Employee)) "Employee"."No."
            else
            if (Type = const(Customer)) "Customer"."No.";

            trigger OnValidate()
            begin
                if Cust.Get("Account No") then
                    "Phone No" := Cust."Phone No.";
                if Emp.Get("Account No") then
                    "Phone No" := Emp."Phone No.";
                if Pat.Get("Account No") then
                    "Phone No" := Pat."Mobile Phone No.";
            end;
        }
        field(4; "Phone No"; Code[20])
        {
        }
        field(5; Status; Option)
        {
            CalcFormula = lookup("SMS Sender".Status where(Code = field(Code)));
            FieldClass = FlowField;
            OptionCaption = ' ,Pending,Sent';
            OptionMembers = " ",Pending,Sent;
        }
    }

    keys
    {
        key(Key1; "Code", "Account No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Cust: Record Customer;
        Emp: Record "Employee";
        Pat: Record "Vendor";
}

