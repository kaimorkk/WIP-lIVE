
table 59026 "Fuel Milleage Req"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; No; Code[20])
        {
        }
        field(2; Date; Date)
        {

            trigger OnValidate()
            begin
                Month := Format(Date, 0, '<Month Text>');
            end;
        }
        field(3; Month; Text[30])
        {
        }
        field(4; "Fuel Drawn"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; No, Date)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

