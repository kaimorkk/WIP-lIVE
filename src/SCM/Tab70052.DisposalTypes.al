table 70052 "Disposal Types"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[50])
        {
        }
        field(3; Blocked; Boolean)
        {
        }
        field(4; "Method of Disposal"; Option)
        {
            OptionCaption = ' ,Transfer to Public Entity,Sale by Public Tender,Sale by Public Auction,Trade-in,Waste Disposal Management';
            OptionMembers = " ","Transfer to Public Entity","Sale by Public Tender","Sale by Public Auction","Trade-in","Waste Disposal Management";
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

