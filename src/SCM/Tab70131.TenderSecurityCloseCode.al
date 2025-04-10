
table 70131 "Tender Security Close Code"
{
    Caption = 'Tender Security Close Code';
    DataCaptionFields = "Code", Description;
    LookupPageID = "Tender Security Close Code";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
            Caption = 'Code';
            NotBlank = true;
        }
        field(2; "Security Type"; Option)
        {
            Caption = 'Security Type';
            OptionCaption = 'Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = "Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(3; "Close Type"; Option)
        {
            OptionCaption = 'Claim/Forfeiture,Released/Returned';
            OptionMembers = "Claim/Forfeiture","Released/Returned";
        }
        field(4; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "No. of Transactions"; Integer)
        {
            Caption = 'No. of Transactions';
            Description = 'Determines the No. of Forfeiture and Release transactions done for the bid & performance securities';
            Editable = false;
        }
        field(6; Blocked; Boolean)
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
        fieldgroup(DropDown; "Code", "Security Type", Description)
        {
        }
    }
}

