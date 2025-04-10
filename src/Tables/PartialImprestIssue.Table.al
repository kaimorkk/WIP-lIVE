Table 52193998 "Partial Imprest Issue"
{
    DrillDownPageID = "Partial Imprest Issues";
    LookupPageID = "Partial Imprest Issues";

    fields
    {
        field(1;"Imprest No";Code[20])
        {
        }
        field(2;"Line No";Integer)
        {
        }
        field(3;"Employee No";Code[20])
        {
        }
        field(4;Date;Date)
        {
        }
        field(5;"Approved Amount";Decimal)
        {
        }
        field(6;"Amount Already Issued";Decimal)
        {
        }
        field(7;"Remaining Amount";Decimal)
        {
        }
        field(8;"Amount to Issue";Decimal)
        {

            trigger OnValidate()
            begin
                CalcFields("Amount Issued to date");
                if ("Amount Issued to date" + "Amount to Issue") > "Approved Amount" then
                Error(Text000,"Amount to Issue","Approved Amount",(("Amount Issued to date" + "Amount to Issue") - "Approved Amount"));
            end;
        }
        field(9;"Pay Mode";Code[10])
        {
            TableRelation = "Pay Modes1";
        }
        field(10;"User ID";Code[50])
        {
        }
        field(11;Posted;Boolean)
        {
            Editable = false;
        }
        field(12;"Posted Date";DateTime)
        {
        }
        field(13;"Amount Issued to date";Decimal)
        {
            CalcFormula = sum("Partial Imprest Issue"."Amount to Issue" where ("Imprest No"=field("Imprest No"),
                                                                               Posted=filter(true)));
            FieldClass = FlowField;
        }
        field(14;"Imprest Dead Line";Date)
        {
        }
        field(15;"Select to Surrender";Boolean)
        {
        }
        field(16;Surrendered;Boolean)
        {
        }
        field(17;"PV Created";Boolean)
        {
        }
        field(18;Partial;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Imprest No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Text000: label 'If you issue Amount %1,the total issued Amount will be more than the Approved Imprest Amount of %2 by %3';
}

