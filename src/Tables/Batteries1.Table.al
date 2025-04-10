Table 52193724 Batteries1
{
    DrillDownPageID = "Legal Advice Rqs Frm";
    LookupPageID = "Legal Advice Rqs Frm";

    fields
    {
        field(1;"Battery No";Code[20])
        {
        }
        field(2;Make;Text[30])
        {
        }
        field(3;Size;Text[30])
        {
        }
        field(4;"Speedometer Reading(KMS)";Decimal)
        {
        }
        field(5;Date;Date)
        {
        }
        field(6;Employee;Code[10])
        {
            TableRelation = Employee;
        }
        field(7;"vehicle No";Code[10])
        {
            TableRelation = "Fixed Asset";

            trigger OnValidate()
            begin
                FA.Get("vehicle No");
                "Vehicle Description":=FA.Description+' '+FA."Serial No.";
            end;
        }
        field(8;"Vehicle Description";Text[100])
        {
        }
    }

    keys
    {
        key(Key1;"Battery No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FA: Record "Fixed Asset";
}

