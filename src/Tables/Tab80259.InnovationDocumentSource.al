
table 80259 "Innovation Document Source"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[30])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Tender Source ID"; Code[50])
        {
            Description = 'Linked to Tender Document Source table';
        }
        field(3; Description; Text[60])
        {
        }
        field(4; "Url Link"; Text[60])
        {
        }
        field(5; "Date Published"; Date)
        {
        }
        field(6; "Bid Charge Code"; Code[30])
        {
            Description = 'Linked to Bid Charge Schedule to determine default charges for accessing/obtaining tender documents';
            // TableRelation = "Bid Charges Schedule".Code;

            // trigger OnValidate()
            // begin
            //     BidCharge.Reset;
            //     BidCharge.SetRange(Code, "Bid Charge Code");
            //     if BidCharge.FindSet then
            //         "IFS Application Fees (LCY)" := BidCharge.Amount
            // end;
        }
        field(7; "IFS Application Fees (LCY)"; Decimal)
        {
        }
    }

    keys
    {
        key(Key1; "Document No.", "Tender Source ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
    // BidCharge: Record "Bid Charges Schedule";
}

