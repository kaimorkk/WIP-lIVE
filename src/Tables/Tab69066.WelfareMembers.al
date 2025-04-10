
table 69066 "Welfare Members"
{
    LookupPageID = "Welfare members";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Member Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Resource,Board,Field';
            OptionMembers = Employee,Resource,Board,"Field";
        }
        field(3; "Member No."; Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Member Type" = "member type"::Employee then begin
                    if Employee.Get("Member No.") then
                        "Member Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                end;
                if "Member Type" = "member type"::Board then begin
                    if Vendor.Get("Member No.") then
                        "Member Name" := Vendor.Name;
                end;

                if "Member Type" = "member type"::Resource then begin
                    if Resource.Get("Member No.") then
                        "Member Name" := Resource.Name;
                end;
                if "Member Type" = "member type"::Field then begin
                    if SalespersonPurchaser.Get("Member No.") then
                        "Member Name" := SalespersonPurchaser.Name;
                end;
            end;
        }
        field(4; "Member Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5; Designation; Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Customer: Record Customer;
        Employee: Record Employee;
        SalespersonPurchaser: Record "Salesperson/Purchaser";
        Vendor: Record Vendor;
        Resource: Record Resource;
}

