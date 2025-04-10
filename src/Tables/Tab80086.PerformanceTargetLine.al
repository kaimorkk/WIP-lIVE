
table 80086 "Performance Target Line"
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
        field(4; Description; Code[255])
        {
        }
        field(5; "Year Reporting Code"; Code[30])
        {
            TableRelation = "Annual Reporting Codes".Code;
        }
        field(6; "Quarter Reporting Code"; Code[30])
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

