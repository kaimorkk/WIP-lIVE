Table 52193953 "Vehicle Filling1"
{
    DrillDownPageID = "Filling List";
    LookupPageID = "Filling List";

    fields
    {
        field(1;"Filling No";Code[20])
        {
        }
        field(2;"No.";Code[20])
        {
            TableRelation = "Fixed Asset"."No." where ("Fixed Asset Type"=const(Equipment));

            trigger OnValidate()
            begin
                 if FixedAsset.Get("No.") then
                    begin
                    Description:=FixedAsset.Description;
                    "Registration No":=FixedAsset."Parastatl Reg. No";

                    end;
            end;
        }
        field(3;"Filling Date";Date)
        {
        }
        field(4;"Oil Drawn (Litres)";Decimal)
        {
        }
        field(5;"Fuel Drawn (Litres)";Decimal)
        {
        }
        field(6;"Voucher No.";Code[20])
        {
        }
        field(7;"Speed Reading on Ref";Decimal)
        {
        }
        field(8;"Kms Covered";Decimal)
        {
        }
        field(9;"No. Series";Code[10])
        {
        }
        field(10;"Driver No";Code[10])
        {
            TableRelation = Employee;

            trigger OnValidate()
            begin
                 if Emp.Get("Driver No") then
                  "Driver Name":=Emp."First Name"+Emp."Middle Name"+Emp."Last Name";
            end;
        }
        field(11;"Driver Name";Text[90])
        {
        }
        field(12;Description;Code[30])
        {
        }
        field(13;"Registration No";Code[20])
        {
        }
        field(14;"Cost per Litre";Decimal)
        {
        }
        field(15;Amount;Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"Filling No","No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Filling No" = '' then begin
          HumanResSetup.Get;
          HumanResSetup.TestField(HumanResSetup."Vehicle Filling No");
          NoSeriesMgt.InitSeries(HumanResSetup."Vehicle Filling No",xRec."No. Series",0D,"Filling No","No. Series");
        end;
    end;

    var
        HumanResSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Emp: Record Employee;
        FixedAsset: Record "Fixed Asset";
}

