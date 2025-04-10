
table 70174 "Bid Opening Register Line"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Code"; Code[30])
        {
            TableRelation = "Bid Opening Register".Code;
        }
        field(2; "Vendor No."; Code[20])
        {
            Description = 'Entries suggested/linked to Bidders Register Table (To track Intention to bid vs actual submitted bidders)';
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin
                Vend.Reset;
                Vend.SetRange("No.", "Vendor No.");
                if Vend.FindSet then begin
                    "Bidder Name" := Vend.Name;
                    //"Bid No.":=Vend."Primary Email";
                end;
            end;
        }
        field(3; "IFS Code"; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(4; "Bidder Name"; Text[250])
        {
        }
        field(5; "Bid No."; Code[20])
        {
            Description = 'Linked to Bid Response Voucher (T38: Filter: Quote), IFS Codes are same on both tables';
            TableRelation = "Purchase Header"."No." where("Document Type" = const(Quote));
        }
        field(6; "External Bid Reference No"; Code[30])
        {
            Description = 'Additional bid reference that may be required in case of manual or Hybrid bid submission';
        }
        field(7; "Valid Bid Security Provided"; Boolean)
        {
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(8; "Bid Security Issuer"; Text[30])
        {
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(9; "Bid Security Amount (LCY)"; Decimal)
        {
            Description = 'Entries suggested from Bid Tender Security Table';
        }
        field(10; "Bid Security Amount Pass"; Boolean)
        {
            Description = 'Uneditable field where the system checks whether the submitted bid meets the Bid amount requirements. If bid amount submitted is less than the expected amount, the system shall mark this entry as Fail';
        }
        field(11; "Total Tender Price (LCY)"; Decimal)
        {
            Description = 'Used to record any read-out tender prices (Especially for 1-envelop bids)';
        }
        field(12; "Complete Bid Doc Submitted"; Boolean)
        {
            Description = 'Completenesss is checked in terms of No. of copies submitted, Separation of proposals etc';
        }
        field(13; "Late Bid"; Boolean)
        {
            Description = 'Used to mark any bids submitted late. All late manual/physical bids are not opened and shall be returned to the bidder. For E-bids, the system shall not allow submission after submission time';
        }
        field(14; "Late Bid Submission Time"; Time)
        {
            Description = 'This field is only completed for bids marked as LATE.';
        }
        field(15; "Bid Withdrawal Notice No."; Code[20])
        {
            Description = 'Linked to Bid Modification Notice Table (Filter Withdrawals mapped to each Bid No.)';
            TableRelation = "Bid Modification Notice".Code where("Bid Action Type" = const(Withdrawal));
        }
        field(16; "Bid Modification Notice No."; Code[20])
        {
            TableRelation = "Bid Modification Notice".Code where("Bid Action Type" = const(Modification));
        }
        field(17; "Bid Withdrawal Exists"; Boolean)
        {
            Description = 'Un-editable field that checks whether a Bid withdrawal notice exists for any bidder, for quicker analysis';
            Editable = false;
        }
        field(18; "Bid Modification Exists"; Boolean)
        {
            Description = 'Un-editable field that checks whether a Bid Modification notice exists for any bidder, for quicker analysis';
        }
        field(19; "Final Bid Opening Result"; Option)
        {
            OptionCaption = ',Proceed to Evaluation,Return Bid';
            OptionMembers = ,"Proceed to Evaluation","Return Bid";
        }
        field(20; "Tender Opening Com Remarks"; Text[1000])
        {
            Description = 'Tender Opening Committee Remarks';
        }
        field(21; "No. of Representatives"; Integer)
        {
            CalcFormula = count("IFS Prebid Bidder Attendance" where("Prebid Register ID" = field("Bid No."),
                                                                      "Bidder No" = field("Vendor No.")));
            Description = 'Count Calcfield linked to the IFS Prebid Bidder Attendance Table (Filter based on Prebid Register ID and Bidder No.)';
            FieldClass = FlowField;
        }
        field(22; Notified; Boolean)
        {
            Description = 'Field that indicates whether an email has been sent to the bidder to confirm partcipation in the prebid visit. It shall include a summary of the prebid meeting (Date held, time, venue etc), Bidder''s representative and summary of key clarifications made to the bidders)';
        }
        field(23; "Date/Time Notified"; Date)
        {
        }
        field(24; Rank; Integer)
        {
        }
        field(25; "Bid Submission No"; Code[10])
        {
        }
        field(26; "Read out Tender Price (LCY)"; Decimal)
        {
            Description = 'Used to record any read-out tender prices (Especially for 1-envelop bids)';
        }
        field(27; "Bid Number"; Integer)
        {

        }
    }

    keys
    {
        key(Key1; "Code", "Vendor No.", "IFS Code", "Bid Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vend: Record Vendor;
        ProcurementSetup: Record "Procurement Setup";
        NoMgt: Codeunit NoSeriesManagement;

    trigger OnInsert()
    var
        myInt: Integer;
        BidOpening: Record "Bid Opening Register Line";
    begin
        BidOpening.Reset();
        BidOpening.SetRange("Code", "Code");
        BidOpening.SetRange("IFS Code", "IFS Code");
        if BidOpening.FindLast() then begin
            "Bid Number" := BidOpening."Bid Number" + 1;
        end else
            "Bid Number" := 1;

    end;
}

