
table 56062 "ICT Issuance Voucher Lines"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Code[10])
        {
            TableRelation = "ICT Issuance Voucher"."No.";
        }
        field(2; "Code"; Code[10])
        {
            TableRelation = "ICT Inventory".Code;

            trigger OnValidate()
            begin
                ICTInventory.Reset;
                ICTInventory.SetRange(Code, Code);
                if ICTInventory.FindSet then begin
                    Description := ICTInventory.Description;
                    "Serial No." := ICTInventory."Serial No.";
                    "FA No" := ICTInventory."Sub Type No.";
                    "Dpt Current Assigned" := ICTInventory."Current Assigned Division/Unit";
                    "Current Assigned Employee" := ICTInventory."Current Assigned Employee";
                end;
            end;
        }
        field(3; Description; Text[250])
        {
        }
        field(4; "Serial No."; Code[50])
        {
        }
        field(5; "Duration of Use start date"; DateTime)
        {
        }
        field(6; "Duration of Use end date"; DateTime)
        {

            trigger OnValidate()
            begin
                "Duration of Use" := "Duration of Use end date" - "Duration of Use start date";
            end;
        }
        field(7; "Duration of Use"; Duration)
        {
        }
        field(8; "FA No"; Code[10])
        {
            TableRelation = "Fixed Asset"."No.";
        }
        field(9; "Reason For Movement"; Text[250])
        {
        }
        field(10; Type; Option)
        {
            OptionCaption = 'Issuance,Movement';
            OptionMembers = Issuance,Movement;
        }
        field(11; "Dpt Current Assigned"; Code[10])
        {
            TableRelation = "Responsibility Center".Code where("Operating Unit Type" = const("Department/Center"));

            trigger OnValidate()
            begin
                Employee.SetRange("No.", "Dpt Current Assigned");
                if Employee.FindSet then begin
                    "Current Assigned Employee" := Employee."First Name" + ' ' + Employee."Last Name";
                end;
            end;
        }
        field(12; "Current Assigned Employee"; Code[30])
        {
            TableRelation = Employee."No.";
        }
        field(13; Comments; Text[250])
        {
        }
        field(14; "Return Reason"; Text[250])
        {
        }
        field(15; "Return Condition"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "No.", Type, "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTInventory: Record "ICT Inventory";
        Employee: Record Employee;
}

