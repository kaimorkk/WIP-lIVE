Table 52193573 "Uncleared Effects Comms."
{

    fields
    {
        field(1;"Code";Code[20])
        {
        }
        field(2;"Lower Limit";Decimal)
        {
        }
        field(3;"Upper Limit";Decimal)
        {
        }
        field(4;Commission;Decimal)
        {
        }
        field(5;"User %";Boolean)
        {

            trigger OnValidate()
            begin
                if "User %"=true then
                "Use Both":=false;
            end;
        }
        field(6;"Use Both";Boolean)
        {

            trigger OnValidate()
            begin
                 if "Use Both"=true then
                 "User %":=false;
            end;
        }
        field(7;"% OF Amount";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
        field(8;"G/L Account";Code[20])
        {
            TableRelation = "G/L Account"."No.";
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

