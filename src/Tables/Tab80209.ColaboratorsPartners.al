
table 80209 "Colaborators & Partners"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "GFA No."; Code[20])
        {
        }
        field(2; "Contact Type"; Option)
        {
            OptionCaption = 'Colaborator,Partner';
            OptionMembers = Colaborator,Partner;
        }
        field(3; "Code"; Code[20])
        {
            // TableRelation = if ("Contact Type" = const(Colaborator)) Contact."No." where(test = const('1'))
            // else
            // if ("Contact Type" = const(Partner)) Contact."No." where(test = const('3'));

            // trigger OnValidate()
            // begin
            //     if Contact.Get(Code) then
            //         Name := Contact.Name;
            // end;
        }
        field(4; Name; Text[100])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "GFA No.", "Contact Type", "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Contact: Record Contact;
}

