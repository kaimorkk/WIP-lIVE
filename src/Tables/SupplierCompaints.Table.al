Table 52194071 "Supplier Compaints"
{
    DrillDownPageID = "Supplier Complaints";
    LookupPageID = "Supplier Complaints";

    fields
    {
        field(1;"Supplier No.";Code[20])
        {
            Editable = false;
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if VendorRec.Get("Supplier No.") then
                "Supplier Name":=VendorRec.Name;
            end;
        }
        field(2;"Supplier Name";Text[100])
        {
            Editable = false;
        }
        field(3;Description;Text[150])
        {
        }
        field(4;"Line No";Integer)
        {
        }
        field(5;"User ID";Code[20])
        {
            Editable = false;
            TableRelation = "User Setup";
        }
    }

    keys
    {
        key(Key1;"Supplier No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "User ID":=UserId;
    end;

    var
        VendorRec: Record Vendor;
}

