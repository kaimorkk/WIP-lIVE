Table 52194060 "Car Wash"
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                if FixedAsset.Get("Item No.") then begin
                "Consumable Description":=FixedAsset.Description;
                "Item Class Code":=FixedAsset."FA Class Code";
                end;
            end;
        }
        field(2;"Consumable Description";Text[100])
        {
        }
        field(3;"Service Provider";Code[10])
        {
            TableRelation = Vendor;

            trigger OnValidate()
            begin
                if VendorRec.Get("Service Provider") then
                 "Service Provider Name" :=VendorRec.Name;
            end;
        }
        field(4;"Service Provider Name";Text[30])
        {
        }
        field(5;Amount;Decimal)
        {
        }
        field(6;"Invoice No.";Code[20])
        {
        }
        field(7;"Service LSO/LPO No.";Code[20])
        {
        }
        field(8;"Item Class Code";Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(9;Date;Date)
        {
        }
    }

    keys
    {
        key(Key1;"Item No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        VendorRec: Record Vendor;
        FixedAsset: Record "Fixed Asset";
}

