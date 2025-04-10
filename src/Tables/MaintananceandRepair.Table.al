Table 52194057 "Maintanance and Repair"
{

    fields
    {
        field(1;"Item No.";Code[20])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                if FixedAsset.Get("Item No.") then begin
                "Item Description":=FixedAsset.Description;
                "Item Class Code":=FixedAsset."FA Class Code";
                end;
            end;
        }
        field(2;"Item Description";Text[80])
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
        field(5;"Service Intervals";Code[30])
        {
            TableRelation = "Service Intervals" where ("Asset Class Code"=field("Item Class Code"));

            trigger OnValidate()
            begin
                ServiceIntervals.Reset;
                ServiceIntervals.SetRange(ServiceIntervals."Service Interval Code","Service Intervals");
                if ServiceIntervals.Find('-') then begin
                  "Service Period":=ServiceIntervals."Service Period";
                  "Service Mileage":=ServiceIntervals."Service Mileage";
                end;
            end;
        }
        field(6;"Date of Service";Date)
        {
        }
        field(7;"Next Service";Text[30])
        {
        }
        field(8;Amount;Decimal)
        {
        }
        field(9;"Service/Repair Description";Text[100])
        {
        }
        field(10;"Invoice No.";Code[20])
        {
        }
        field(11;"Service LSO/LPO No.";Code[20])
        {
        }
        field(12;"Item Class Code";Code[10])
        {
            Caption = 'FA Class Code';
            TableRelation = "FA Class";
        }
        field(13;"Current Odometer Reading";Decimal)
        {
        }
        field(14;"Service Interval Type";Option)
        {
            OptionCaption = ' ,Mileage,Periodical';
            OptionMembers = " ",Mileage,Periodical;
        }
        field(15;"Service Period";DateFormula)
        {
        }
        field(16;"Service Mileage";Decimal)
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
        ServiceIntervals: Record "Service Intervals";
}

