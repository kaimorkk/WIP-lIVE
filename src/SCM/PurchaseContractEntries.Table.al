Table 70239 "Purchase Contract Entries"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; "NOA No"; Code[50])
        {
        }
        field(3; "Professional Opinion No"; Code[50])
        {
        }
        field(4; "Evaluation Report No"; Code[50])
        {
        }
        field(5; "IFS Code"; Code[50])
        {
        }
        field(6; "PRN No"; Code[50])
        {
        }
        field(7; "Purchase Agreement Type"; Option)
        {
            OptionCaption = ' ,LPO/LSO,Contract';
            OptionMembers = " ","LPO/LSO",Contract;
        }
        field(8; "Purchase Agreement No"; Code[50])
        {
        }
        field(9; "Created By"; Code[50])
        {
        }
        field(10; "Created On"; DateTime)
        {
        }
        field(11; Archived; Boolean)
        {
        }
        field(12; "Awarded Bidder No"; Code[50])
        {
        }
        field(13; "Awarded Bidder Name"; Text[250])
        {
        }
        field(14; "Awarded Bid Sum"; Decimal)
        {
        }
        field(15; "Tender Name"; Text[2000])
        {
        }
        field(16; "Awarded Bid No"; Code[50])
        {
        }
        field(17; "Archived On"; DateTime)
        {
        }
        field(18; "Archived By"; Code[50])
        {
        }
        field(19; "Framework Agreement No"; Code[50])
        {
        }
        field(20; "Start Date"; Date)
        {
        }
        field(21; "End Date"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

