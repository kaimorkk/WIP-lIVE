Table 52193437 "Share Transfer Lines"
{

    fields
    {
        field(1; "Code"; Code[30])
        {
            // TableRelation = "Share Transfer Header";
        }
        field(2; "Line No"; Integer)
        {
        }
        field(3; "Source Member No."; Code[20])
        {
            // TableRelation = Customer."No." where("Customer Ty/pe" = filter(Member));

            trigger OnValidate()
            begin
                if Cust.Get("Source Member No.") then begin
                    "Source Member Name" := Cust.Name;
                    Validate(Amount);
                end;
            end;
        }
        field(4; "Source Member Name"; Text[50])
        {
        }
        field(5; "Source Product Code"; Code[20])
        {
            TableRelation = "Monthly Contributions"."Product Code" where("Member No." = field("Source Member No."));

            trigger OnValidate()
            begin
                Validate("Source Member No.");


                /*MembCont.RESET;
                MembCont.SETRANGE("Member No.","Source Member No.");
                MembCont.SETRANGE("Product Code","Source Product Code");
                IF NOT MembCont.FIND THEN
                ERROR((Text003),"Source Member No.","Source Product Code");*/

            end;
        }
        field(6; Amount; Decimal)
        {

            trigger OnValidate()
            begin
                AvailableShares := 0;

                MembCont.Reset;
                MembCont.SetRange("Member No.", "Source Member No.");
                MembCont.SetRange("Product Code", "Source Product Code");
                if MembCont.Find('-') then begin
                    MembCont.CalcFields(Amount);
                    AvailableShares := MembCont.Amount;

                    if Amount > AvailableShares then
                        Error((Text001), AvailableShares);
                end;
            end;
        }
        field(7; "Destination Member No."; Code[20])
        {
            // TableRelation = Customer."No." where("Customer Type" = filter(Member));

            trigger OnValidate()
            begin
                if Cust.Get("Destination Member No.") then begin
                    "Destination Member Name" := Cust.Name;

                    if ("Destination Member No." = "Source Member No.") and ("Source Product Code" = "Destination Product Code") then
                        Error(Text002);

                end;
            end;
        }
        field(8; "Destination Member Name"; Text[50])
        {
        }
        field(9; "Destination Product Code"; Code[20])
        {
            TableRelation = "Monthly Contributions"."Product Code" where("Member No." = field("Destination Member No."));

            trigger OnValidate()
            begin
                Validate("Destination Member No.");
            end;
        }
    }

    keys
    {
        key(Key1; "Code", "Source Member No.", "Source Product Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Cust: Record Customer;
        MembCont: Record "Monthly Contributions";
        AvailableShares: Decimal;
        Text001: label 'Transfer Amount cannot be more than the Balance of %1';
        Text002: label 'You cannot transfer to the same product';
        Text003: label 'The Member %1 does not have product %2';
        MembContx: Record "Monthly Contributions";
}

