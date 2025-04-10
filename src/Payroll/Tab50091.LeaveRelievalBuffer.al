table 52193426 "Leave Relieval Buffer"
{
    Caption = 'Leave Relieval Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            AutoIncrement = true;
        }
        field(2; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }
        field(3; Approvee; Code[50])
        {
            Caption = 'Approvee';
        }
        field(4; "Application No"; Code[20])
        {
            Caption = 'Application No';
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
