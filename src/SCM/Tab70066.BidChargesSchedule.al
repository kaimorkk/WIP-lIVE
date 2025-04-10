
table 70066 "Bid Charges Schedule"
{
    DrillDownPageID = "Bid Charges Schedule";
    LookupPageID = "Bid Charges Schedule";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[50])
        {
        }
        field(2; Description; Text[100])
        {
        }
        field(3; "Currency Code"; Code[20])
        {
            TableRelation = Currency;
        }
        field(4; Amount; Decimal)
        {
        }
        field(5; "Effective Date"; Date)
        {
        }
        field(6; Blocked; Boolean)
        {
        }
        field(7; "Document Type"; Option)
        {
            OptionCaption = 'IFP,IFS';
            OptionMembers = IFP,IFS;
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

