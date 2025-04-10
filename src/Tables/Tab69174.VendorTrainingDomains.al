
table 69174 "Vendor Training Domains"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "Vendor No."; Code[30])
        {
            TableRelation = Vendor;
        }
        field(3; "Domain ID"; Code[10])
        {
            TableRelation = "Training Domains";
        }
        field(4; "Start Date"; Date)
        {
        }
        field(5; "End Date"; Date)
        {
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; "Vendor Name"; Text[100])
        {
            CalcFormula = lookup(Vendor.Name where("No." = field("Vendor No.")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Vendor No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Vendor Name", "Domain ID")
        {
        }
    }
}

