Table 52193496 "Account Signatories"
{

    fields
    {
        field(1;"Account No";Code[20])
        {
            NotBlank = true;
        }
        field(2;Names;Text[50])
        {
            NotBlank = true;
        }
        field(3;"Date Of Birth";Date)
        {
        }
        field(4;"Telephone No.";Code[20])
        {
        }
        field(5;"ID No.";Code[50])
        {
        }
        field(6;Signatory;Boolean)
        {
        }
        field(7;"Must Sign";Boolean)
        {
        }
        field(8;"Must be Present";Boolean)
        {
        }
        field(9;Picture;Blob)
        {
            Caption = 'Picture';
            SubType = Bitmap;
        }
        field(10;Signature;Blob)
        {
            Caption = 'Signature';
            SubType = Bitmap;
        }
        field(11;"Expiry Date";Date)
        {
        }
        field(12;Suspended;Option)
        {
            OptionMembers = No,Yes;

            trigger OnValidate()
            begin
                if Suspended=Suspended::Yes then
                "Suspension Date":=Today;
            end;
        }
        field(13;"Suspension Date";Date)
        {
        }
        field(14;"Reasons for Suspension";Text[150])
        {
        }
    }

    keys
    {
        key(Key1;"Account No",Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

