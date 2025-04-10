
table 70079 "Vendor Works Awarded"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
        }
        field(2; "Vendor No"; Code[20])
        {
        }
        field(3; "Document Type"; Option)
        {
            OptionCaption = ' ,Payment,Invoice,Credit Memo,Finance Charge Memo,Reminder,Refund';
            OptionMembers = " ",Payment,Invoice,"Credit Memo","Finance Charge Memo",Reminder,Refund;
        }
        field(4; "Posting Date"; Date)
        {
        }
        field(5; Description; Text[100])
        {
        }
        field(6; Amount; Decimal)
        {
        }
        field(7; "Amount (LCY)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", "Vendor No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

