
table 70144 "IFS Securities"
{
    DrillDownPageID = "IFS Securities";
    LookupPageID = "IFS Securities";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "IFS Code"; Code[50])
        {
            TableRelation = "Standard Purchase Code";
        }
        field(2; "Form of Security"; Code[50])
        {
            TableRelation = "Tender Security Types".Code;

            trigger OnValidate()
            begin
                SecurityTypes.Reset;
                SecurityTypes.SetRange(Code, "Form of Security");
                if SecurityTypes.FindSet then begin
                    Description := SecurityTypes.Description;
                end;
            end;
        }
        field(3; "Security Type"; Option)
        {
            OptionCaption = 'Bid/Tender Security,Performance/Contract Security,Advance Payment Security';
            OptionMembers = "Bid/Tender Security","Performance/Contract Security","Advance Payment Security";
        }
        field(4; "Required at Bid Submission"; Boolean)
        {
            Description = 'Used to mark all Securities that the Vendor has to provide at the bid submission stage';
        }
        field(5; Description; Text[100])
        {
        }
        field(6; "Security Amount (LCY)"; Decimal)
        {
        }
        field(7; "Bid Security Validity Expiry"; Date)
        {
            Caption = 'Bid Security Validity Expiry Date';
            Description = 'Bid Security Validity Expiry Date';
        }
        field(8; "Nature of Security"; Option)
        {
            OptionCaption = 'Monetary,Non-Monetary';
            OptionMembers = Monetary,"Non-Monetary";
        }
    }

    keys
    {
        key(Key1; "IFS Code", "Form of Security")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        SecurityTypes: Record "Tender Security Types";
}

