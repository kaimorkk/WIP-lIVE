
table 56701 "SMS Messages"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            AutoIncrement = true;
            NotBlank = true;
        }
        field(2; Source; Code[100])
        {
        }
        field(3; "Telephone No"; Code[20])
        {
        }
        field(4; "Date Entered"; Date)
        {
        }
        field(5; "Time Entered"; Time)
        {
        }
        field(6; "Entered By"; Code[50])
        {
        }
        field(7; "SMS Message"; Text[250])
        {
        }
        field(8; "Sent To Server"; Option)
        {
            OptionCaption = 'No,Yes,Failed';
            OptionMembers = No,Yes,Failed;
        }
        field(9; "Date Sent to Server"; DateTime)
        {
        }
        field(10; "Time Sent To Server"; Time)
        {
        }
        field(11; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }
        field(12; "Sent To Server Status"; Code[20])
        {
        }
        field(13; "Account No"; Code[30])
        {
        }
        field(14; "Batch No"; Code[30])
        {
        }
        field(15; "Document No"; Code[30])
        {
        }
        field(16; "System Created Entry"; Boolean)
        {
        }
        field(17; "Bulk SMS Balance"; Decimal)
        {
        }
        field(18; Rate; Decimal)
        {
        }
        field(19; Charged; Boolean)
        {
        }
        field(20; "Additional Message"; Text[250])
        {
        }
        field(21; "Delivery Status"; Text[250])
        {
        }
        field(22; Fetched; Decimal)
        {
        }
        field(23; ScheduledOn; DateTime)
        {
        }
        field(24; "Service Provider"; Option)
        {
            OptionCaption = 'SemaSMS';
            OptionMembers = SemaSMS;
        }
        field(25; DeliveredOn; DateTime)
        {
        }
        field(26; "Additional Message 2"; Text[250])
        {
        }
        field(27; CampaignID; Text[50])
        {
        }
        field(28; MessageID; Text[250])
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

    var
        NoSetup: Record "General Ledger Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

