table 50057 "Fleet Lookup"
{
    Caption = 'Fleet Lookup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Type; Option)
        {
            OptionMembers = "Specialized Vehicle Use","Driver Type","Route Destination";
        }
    }
    keys
    {
        key(PK; Type, "Code")
        {
            Clustered = true;
        }
    }
}
