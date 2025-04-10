table 50143 "Payroll Projections Buffer"
{
    Caption = 'Payroll Projections Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            autoIncrement = true;
        }
        field(2; "Employee No"; Code[20])
        {
            Caption = 'Employee No';
            DataClassification = CustomerContent;
        }
        field(3; "Transaction Code"; Code[10])
        {
            Caption = 'Transaction Code';
            DataClassification = SystemMetadata;
        }
        field(4; "Start Date"; Date)
        {
            Caption = 'Start Date';
        }
        field(5; "End Date"; Date)
        {
            Caption = 'End Date';
        }
        field(6; "Financial Year"; Code[20])
        {
            Caption = 'Financial Year';
        }
        field(7; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Grade; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Job ID"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
    }
}
