
table 70176 "Bid Opening Bidder Attendance"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            TableRelation = "Bid Opening Register".Code;
        }
        field(2; "IFS Code"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(3; "Vendor No."; Code[20])
        {
            Description = 'Linked to Bidder/Vendor No. that had shown an Intention to Respond (T175) for a given IFS';
            TableRelation = Vendor."No.";
        }
        field(4; "Bidder Representative Name"; Text[250])
        {
            Description = 'Bidder Name as recorded in the Intention to Bid';
        }
        field(5; "Representative Email"; Text[80])
        {
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(6; "Representative Tel No"; Text[50])
        {
            Description = 'Count Calcfield linked to the IFS Prebid Bidder Attendance Table (Filter based on Prebid Register ID and Bidder No.)';
        }
        field(8; "Date/Time Notified"; Date)
        {
        }
        field(9; "Entry No"; Integer)
        {
            AutoIncrement = true;
        }
        field(10; Designation; Text[80])
        {
        }
        field(11; "Notified By Email"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Code", "Vendor No.", "Entry No", "IFS Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record "Standard Vendor Purchase Code";
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;
        Vendor: Record Vendor;
}

