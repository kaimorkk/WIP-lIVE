
table 80063 "Intiative Target"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Workplan No."; Code[30])
        {
        }
        field(2; "Initiative No."; Code[30])
        {
        }
        field(3; "Entry No"; Integer)
        {
        }
        field(4; Description; Text[200])
        {
        }
        field(5; "Year Reporting Code"; Code[50])
        {
        }
        field(6; "Quarter Reporting Code"; Code[50])
        {
        }
        field(7; "Planning Date"; Date)
        {
        }
        field(8; "Primary Directorate"; Code[50])
        {
        }
        field(9; "Primary Department"; Code[50])
        {
        }
        field(10; "Perfomance Quantity"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Workplan No.", "Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

