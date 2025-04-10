
table 72063 "Incident Notification"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(2; Category; Code[100])
        {
        }
        field(3; Caller; Text[50])
        {
        }
        field(4; "Phone No"; Text[100])
        {
        }
        field(5; Description; Text[250])
        {
        }
        field(6; "Date Of Incident"; Date)
        {
        }
        field(7; "Time of Incident"; Time)
        {
        }
        field(8; "Road Chainage"; Decimal)
        {
        }
        field(9; "Road Location"; Code[50])
        {
        }
        field(10; "Information Resource"; Code[50])
        {
        }
        field(11; "Nature of Incident"; Text[50])
        {
        }
        field(12; "Location Of Incident"; Text[50])
        {
        }
        field(13; "Condition of Accident Vehicles"; Text[100])
        {
        }
        field(14; "No. Of Injured People"; Integer)
        {
        }
        field(15; Project; Code[20])
        {
        }
        field(16; "Header No"; Code[20])
        {
        }
    }

    keys
    {
        key(Key1; "Entry No", Project, "Header No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

