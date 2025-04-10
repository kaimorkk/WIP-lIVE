
table 72080 "Contract Evaluation Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Project No"; Code[20])
        {
        }
        field(2; "Document No"; Code[20])
        {
        }
        field(3; Item; Text[250])
        {
        }
        field(4; "No of Months"; Integer)
        {
        }
        field(5; Jan; Decimal)
        {
        }
        field(6; Feb; Decimal)
        {
        }
        field(7; Mar; Decimal)
        {
        }
        field(8; April; Decimal)
        {
        }
        field(9; May; Decimal)
        {
        }
        field(10; June; Decimal)
        {
        }
        field(11; July; Decimal)
        {
        }
        field(12; August; Decimal)
        {
        }
        field(13; Septemeber; Decimal)
        {
        }
        field(14; October; Decimal)
        {
        }
        field(15; November; Decimal)
        {
        }
        field(16; December; Decimal)
        {
        }
        field(17; Year; Code[20])
        {
        }
        field(18; "Total Pass"; Integer)
        {
        }
        field(19; "Total Month"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Project No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

