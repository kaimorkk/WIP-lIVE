
table 70155 "IFS Prebid Register Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Prebid Register ID"; Code[30])
        {
            TableRelation = "IFS Prebid Register".Code;
        }
        field(2; "IFS Code"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(3; "Bidder No"; Code[20])
        {
            Description = 'Linked to Bidder/Vendor No. that had shown an Intention to Respond (T175) for a given IFS';
            TableRelation = "Standard Vendor Purchase Code"."Vendor No.";

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("Vendor No.", "Bidder No");
                if Vend.FindSet then begin
                    "Name of Participating Bidder" := Vend."Vendor Name";
                    "Primary Email" := Vend."Primary Email";
                end;
            end;
        }
        field(4; "Name of Participating Bidder"; Text[250])
        {
            Description = 'Bidder Name as recorded in the Intention to Bid';
        }
        field(5; "Primary Email"; Text[80])
        {
            Description = 'Linked to Vendor.Primary Email (It shall be used for vendor communications during the bidding process)';
        }
        field(6; "No. of Representatives"; Integer)
        {
            CalcFormula = count("IFS Prebid Bidder Attendance" where("Bidder No" = field("Bidder No"),
                                                                      "Prebid Register ID" = field("Prebid Register ID"),
                                                                      "IFS Code" = field("IFS Code")));
            Description = 'Count Calcfield linked to the IFS Prebid Bidder Attendance Table (Filter based on Prebid Register ID and Bidder No.)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(7; Notified; Boolean)
        {
            Description = 'Field that indicates whether an email has been sent to the bidder to confirm partcipation in the prebid visit. It shall include a summary of the prebid meeting (Date held, time, venue etc), Bidder''s representative and summary of key clarifications made to the bidders)';
        }
        field(8; "Date/Time Notified"; Date)
        {
        }
    }

    keys
    {
        key(Key1; "Prebid Register ID", "IFS Code", "Bidder No")
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
}

