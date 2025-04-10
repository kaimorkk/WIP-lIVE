
table 70172 "Bid Modification Notice"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
        }
        field(2; "Bid Action Type"; Option)
        {
            OptionCaption = ',Modification,Withdrawal';
            OptionMembers = ,Modification,Withdrawal;
        }
        field(3; "Notice Date"; Date)
        {
            Description = 'It should be any date before Bid closure deadline';
        }
        field(4; "Bid No."; Code[30])
        {
        }
        field(5; "IFS No."; Code[30])
        {
        }
        field(6; "Reason for Action"; Text[100])
        {
        }
        field(7; "External Reference No"; Code[30])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

